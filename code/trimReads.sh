FILES1=/projectFolder/raw_reads/*_1*.fastq
for f in $FILES1
do
	f2=${f//_1/_2} 
	f_trimmed=${f//.fastq/_trimmed.fastq}
	f_trimmed=${f_trimmed//raw_reads/trimmed_reads}
	f2_trimmed=${f2//.fastq/_trimmed.fastq}
	f2_trimmed=${f2_trimmed//raw_reads/trimmed_reads}
	cutadapt -q 20 -m 20 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -o $f_trimmed -p $f2_trimmed $f $f2
done