#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J fastqc_after_trim

#Quality control of trimmed sequences

module load bioinfo-tools
module load FastQC


#Illumina sequences with FastQC - genomic data

fastqc ~/genome_analysis/Genome_Analysis/data/trimmed_data/E745-1.L500_SZAXPI015146-56_paired* -o ~/genome_analysis/Genome_Analysis/analysis/02_trimquality/

