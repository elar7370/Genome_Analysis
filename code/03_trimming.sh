#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J trimming


module load bioinfo-tools
module load trimmomatic

ref=~/genome_analysis/Genome_Analysis/data/raw_data/genomics_data/Illumina	
trim=~/genome_analysis/Genome_Analysis/data/trimmed_data

trimmomatic PE $ref/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz $ref/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz $trim/E745-1.L500_SZAXPI015146-56_paired_1_clean.fq.gz $trim/E745-1.L500_SZAXPI015146-56_unpaired_1_clean.fq.gz $trim/E745-1.L500_SZAXPI015146-56_paired_2_clean.fq.gz $trim/E745-1.L500_SZAXPI015146-56_unpaired_2_clean.fq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 
TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

