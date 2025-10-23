#!/usr/bin/env bash
mkdir -pv analysis

cat faculty.csv | grep -oiE [^,]*$ | grep -oE [^+]+ | sed -E 's/^[ \t]*//;s/[ \t]*$//' | sort | uniq -c | sort -nr |
while read count name
do
if [ "$count" -gt 10 ]
then
echo "$name - $count"
fi
done > analysis/big_groups.txt

#echo "Name, Position" > analysis/ai_cs_join.csv
cat faculty.csv | grep -i "Artificial Intelligence" | grep -i "Computer Systems" | sed -E 's/^([^,]+,[^,]+),.*/\1/' >> analysis/ai_cs_join.csv

cat faculty.csv | sed 's/,.*//' | sort | nl > analysis/sorted_names.txt
