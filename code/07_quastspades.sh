#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J spades_quast
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user eleni.aretaki.7370@student.uu.se

module load bioinfo-tools
module load quast


python /sw/bioinfo/quast/5.0.2/snowy/bin/quast.py ~/genome_analysis/Genome_Analysis/analysis/04_spadesassembly/spades_outdir/scaffolds.fasta -r ~/genome_analysis/Genome_Analysis/data/raw_data/GCF_009734005.1_ASM973400v2_genomic.fna
