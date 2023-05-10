#!/bin/bash
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J bwa
#SBATCH --mail-type=ALL
#SBATCH --mail-user eleni.aretaki.7370@student.uu.se

# Load modules
module load bioinfo-tools
module load bwa
module load samtools

assembly=~/genome_analysis/Genome_Analysis/analysis/03_canuassembly/canu_assembly/Efaecium.contigs.fasta
illumina=~/genome_analysis/Genome_Analysis/data/raw_data/genomics_data/Illumina

bwa index -p bwa_index $assembly

bwa mem -M bwa_index $illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz $illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz > bwa_align.sam
samtools view -bS bwa_align.sam > bwa_align.bam
samtools sort -o bwa_align_sorted.bam bwa_align.bam
samtools index bwa_align_sorted.bam
