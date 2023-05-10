#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 10:00:00
#SBATCH -J spades
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user eleni.aretaki.7370@student.uu.se

module load bioinfo-tools
module load spades

spades.py -t 4 -1 ~/genome_analysis/Genome_Analysis/data/raw_data/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz -2 ~/genome_analysis/Genome_Analysis/data/raw_data/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz --nanopore ~/genome_analysis/Genome_Analysis/data/raw_data/genomics_data/Nanopore/E745_all.fasta.gz --careful --cov-cutoff auto -o ~/genome_analysis/Genome_Analysis/analysis/spades_outdir
