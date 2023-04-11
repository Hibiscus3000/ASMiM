#!/bin/bash

#must be executed with sudo

csv_file=table.csv
src_file=main11111.cpp
executable_file=./main
attempts=$((10))

init=$((1))
finish=$((100))

>$csv_file

for ((j = 0; j < $attempts; ++j))
do
    printf "\nattempt %d\n" $j
    for ((k = $init; k < $finish; ++k))
    do
        for ((d = 0; d < 11; ++d))
        do
            cat "start.cpp" > $src_file
            for ((i = 0; i < d; ++i))
            do
                cat "dummy.cpp" >> $src_file
            done 
            cat "end.cpp" >> $src_file
            g++ $src_file -o $executable_file -lpapi
            $executable_file $k $d $csv_file
            printf ";" >> $csv_file
            printf ""
        done
    done
    printf "\n" >> $csv_file
done
