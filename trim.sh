#!/bin/bash
#
#$ -cwd
#$ -j y
#$ -S /bin/bash
#$ -pe smp 4
#$ -m e

#source activate samtools
main_path=/home/smaguire/work/human_miRNA/low_input
data_path=$main_path/data/
output_path=$main_path/trimmed          
for i in $( ls $data_path/*.fastq.gz); 
do
new_name=${i#$data_path/}
new_name=${new_name%.fastq.gz}
bbduk.sh \
in=$i \
out=$output_path/$new_name.fastq \
ref=/home/smaguire/work/human_miRNA/adapter_seq.fasta \
ktrim=r \
k=18 \
mink=11 \
hdist=1 \
trimq=10 \
minlen=10 \
overwrite=T
done
