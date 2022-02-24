#!/bin/bash
FILES1=/projectFolder/trimmed_reads/*.fastq
for f in $FILES1
do
	awk '/@SRR/ {getline; print length($0)}' $f | awk -v sample="$f" '{sum+=$1} END {print sample,sum/NR,NR}' >> /projectFolder/data/trimmedReadCounts.txt
done
