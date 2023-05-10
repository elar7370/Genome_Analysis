#!/bin/bash 
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:10:00
#SBATCH -J mummerplot
#SBATCH --mail-type=ALL
#SBATCH --mail-user eleni.aretaki.7370@student.uu.se

# Load modules
module load bioinfo-tools
module load MUMmer/4.0.0rc1

ref=~/genome_analysis/Genome_Analysis/data/raw_data/GCF_009734005.1_ASM973400v2_genomic.fna
ass=~/genome_analysis/Genome_Analysis/analysis/03_canuassembly/canu_assembly/Efaecium.contigs.fasta

mummer -mum -b -L $ref $ass > matches_assembly.mummer
mummerplot -t png -p mummerplot_canu matches_assembly.mummer
