#!/bin/bash
FILES1=~/Documents/IntroToRNASeq/rawReads/*.fastq
for f in $FILES1
do
	awk '/@GWZHISEQ/ {getline; print length($0)}' $f | awk -v sample="$f" '{sum+=$1} END {print sample,sum/NR,NR}' >> ~/Documents/IntroToRNASeq/data/rawReadCounts.txt
done
