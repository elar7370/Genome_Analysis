#!/bin/bash
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 06:00:00
#SBATCH -J blastn
#SBATCH --mail-type=ALL
#SBATCH --mail-user eleni.aretaki.7370@student.uu.se

# Load modules
module load bioinfo-tools
module load blast

pilon=~/genome_analysis/Genome_Analysis/analysis/10_piloncorrection/pilon_outdir.fasta
ref=~/genome_analysis/Genome_Analysis/data/raw_data/GCF_009734005.1_ASM973400v2_genomic.fna

blastn -query $pilon -subject $ref -outfmt 6 > blast.out
