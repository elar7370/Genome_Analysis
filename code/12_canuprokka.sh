#!/bin/bash
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J prokka
#SBATCH --mail-type=ALL
#SBATCH --mail-user eleni.aretaki.7370@student.uu.se

# Load modules
module load bioinfo-tools
module load prokka

prokka --prefix annot_prokka ~/genome_analysis/Genome_Analysis/analysis/10_piloncorrection/pilon_outdir.fasta
