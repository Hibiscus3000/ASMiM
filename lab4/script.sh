
attempts=10
martix_sizes=(500000000 1000000000 2000000000) 
cpus=4
virtual_threads=2
loop_unrolling=(1 2 4 8 16)
time_file="table.csv"
executable="./prog"

>$time_file

function measure()
{
    program_name=$1
    printf "$program_name\n" >> $time_file
    for ((s = 0; s < ${#martix_sizes[@]}; ++s))
    do
        for ((lu = 0; lu < ${#loop_unrolling[@]}; ++lu))
        do
            gcc "$program_name/$program_name${loop_unrolling[$lu]}.s" -w -o $executable
            for ((c = 1; c <= $cpus; ++c))
            do
                for ((i = 0; i < $attempts; ++i))
                do
                    $executable $c $cpus $virtual_threads ${martix_sizes[$s]} 0 2 $time_file
                    printf "\n" >> $time_file
                    printf "\n"
                done
            done
        done 
    done
}

function library()
{
    type=$1
    printf "library $type\n" >> $time_file
    for ((s = 0; s < ${#martix_sizes[@]}; ++s))
    do
        echo "typedef $type tested;" > "temp.c"
        echo "$(cat "library/library.c")" >> "temp.c"
        gcc "temp.c" -w -o $executable
        for ((c = 1; c <= $cpus; ++c))
        do
            for ((i = 0; i < $attempts; ++i))
            do
                $executable $c $cpus $virtual_threads ${martix_sizes[$s]} 0 2 $time_file
                printf "\n" >> $time_file
                printf "\n"
            done
        done
    done
}

library "char"
library "int"
library "long long"
measure "sample"
measure "sample_no_temp"
measure "vectorized"
measure "vectorized_no_temp"
measure "vectorized_to_scalar"
measure "vectorized_to_scalar_nt"
