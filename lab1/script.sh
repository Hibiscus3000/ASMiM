#!/bin/bash

result_file_name=table.csv

>$result_file_name

for ((j = 0; j < 10; j++))
do
	./main $result_file_name
	printf "\n">>$result_file_name
	printf "\n"
done
