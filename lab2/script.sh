#!/bin/bash

assembly_file=main_assembly.s
csv_file=table.csv
executable_file=./main_assembly
n=$((10240 * (128 + 512 + 3072) / 4))
attempts=$((5))

init=$((0))
finish=$((300))

>$assembly_file
>$csv_file

prepare_assembly() {
    echo "$2" > $assembly_file
    for ((k = 0; k < $1; k ++))
    do
        printf "\tnop\n" >> $assembly_file
    done
    echo "$3" >> $assembly_file
    if [[ $5 = 1 ]]
    then
        for ((k = 0; k < $1; k ++))
        do
            printf "\tnop\n" >> $assembly_file
        done
    fi
    echo "$4" >> $assembly_file
}

test() {
    for  ((j = 0; j < $attempts; j++))
    do
        printf "\n" >> $csv_file
        for ((i = $init; i < $finish; i++))
        do
            prepare_assembly $i "$2" "$3" "$4" $5
            gcc $assembly_file -o $executable_file
            printf "($1,$j,$i): "
            $executable_file $n $csv_file
        done
    done
    printf "\n" >> $csv_file
}

for ((i = $init; i < $finish; i++))
do
    printf "$i;" >> $csv_file
done
test 1 "$(cat start_reg.s)" "" "$(cat finish_reg.s)" 0
test 2 "$(cat start_reg_no_arr.s)" "" "$(cat finish_reg.s)" 0
test 3 "$(cat start2_reg.s)" "$(cat middle2_reg.s)" "$(cat finish2_reg.s)" 1
test 4 "$(cat start_reg_no_arr.s)" "" "$(cat finish_reg.s)" 1
