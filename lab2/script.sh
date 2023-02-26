#!/bin/bash

assembly_file=main_assembly.s
executable_file=./main_assembly

>$assembly_file

for ((i = 230; i < 260; i++))
do
    cat start.s >> $assembly_file
    for ((k = 0; k < i; k++))
    do
        printf "\nnop" >> $assembly_file
    done
    printf "\n" >> $assembly_file
    cat finish.s >> $assembly_file
    printf "$i nops "
    gcc $assembly_file -o $executable_file
    $executable_file
    > $assembly_file
done
