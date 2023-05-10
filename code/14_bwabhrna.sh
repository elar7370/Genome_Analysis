#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J bwa_rna
#SBATCH --mail-type=ALL
#SBATCH --mail-user eleni.aretaki.7370@student.uu.se

module load bioinfo-tools
module load bwa
module load samtools

assembly=~/genome_analysis/Genome_Analysis/analysis/10_piloncorrection/pilon_outdir.fasta
bh_rna=~/genome_analysis/Genome_Analysis/data/raw_data/transcriptomics_data/RNA-Seq_BH
serum_rna=~/genome_analysis/Genome_Analysis/data/raw_data/transcriptomics_data/RNA-Seq_Serum

bwa index -p bwa_bh_index $assembly

#BH RNA
bwa mem -M bwa_bh_index $bh_rna/trim_paired_ERR1797972_pass_1.fastq.gz $bh_rna/trim_paired_ERR1797972_pass_2.fastq.gz | samtools view -b | samtools sort -o rnamapping_BHpaired_ERR1797972.bam

bwa mem -M bwa_bh_index $bh_rna/trim_paired_ERR1797973_pass_1.fastq.gz $bh_rna/trim_paired_ERR1797973_pass_2.fastq.gz | samtools view -b | samtools sort -o rnamapping_BHpaired_ERR1797973.bam

bwa mem -M bwa_bh_index $bh_rna/trim_paired_ERR1797974_pass_1.fastq.gz $bh_rna/trim_paired_ERR1797974_pass_2.fastq.gz | samtools view -b | samtools sort -o rnamapping_BHpaired_ERR1797974.bam

#Serum RNA
bwa mem -M bwa_bh_index $serum_rna/trim_paired_ERR1797969_pass_1.fastq.gz $serum_rna/trim_paired_ERR1797969_pass_2.fastq.gz | samtools view -b | samtools sort -o rnamapping_serumpaired_ERR1797969.bam

bwa mem -M bwa_bh_index $serum_rna/trim_paired_ERR1797970_pass_1.fastq.gz $serum_rna/trim_paired_ERR1797970_pass_2.fastq.gz | samtools view -b | samtools sort -o rnamapping_serumpaired_ERR1797970.bam

bwa mem -M bwa_bh_index $serum_rna/trim_paired_ERR1797971_pass_1.fastq.gz $serum_rna/trim_paired_ERR1797971_pass_2.fastq.gz | samtools view -b | samtools sort -o rnamapping_serumpaired_ERR1797971.bam


samtools index rnamapping_BHpaired_ERR1797972.bam
samtools index rnamapping_BHpaired_ERR1797973.bam
samtools index rnamapping_BHpaired_ERR1797974.bam
samtools index rnamapping_serumpaired_ERR1797971.bam
samtools index rnamapping_serumpaired_ERR1797970.bam
samtools index rnamapping_serumpaired_ERR1797969.bam
