#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J fastqc_before_trim

#Quality control of raw sequences

module load bioinfo-tools
module load FastQC



#Illumina sequences with FastQC - genomic data

fastqc ~/genome_analysis/Genome_Analysis/data/raw_data/genomics_data/Illumina/*.fq.gz -o ~/genome_analysis/Genome_Analysis/analysis/01_readquality/

