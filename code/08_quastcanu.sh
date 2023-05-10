#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J canu_quast
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user eleni.aretaki.7370@student.uu.se

module load bioinfo-tools
module load quast


python /sw/bioinfo/quast/5.0.2/snowy/bin/quast.py ~/genome_analysis/Genome_Analysis/analysis/03_canuassembly/canu_assembly/Efaecium.contigs.fasta -r ~/genome_analysis/Genome_Analysis/data/raw_data/GCF_009734005.1_ASM973400v2_genomic.fna


