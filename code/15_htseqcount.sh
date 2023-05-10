#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 12:00:00
#SBATCH -J htseq_count
#SBATCH --mail-type=ALL
#SBATCH --mail-user eleni.aretaki.7370@student.uu.se

module load bioinfo-tools
module load htseq

rna=~/genome_analysis/Genome_Analysis/analysis/13_bwarnamapping
gff=~/genome_analysis/Genome_Analysis/analysis/11_annotprokka/annot_prokka


#Serum-RNA counts
htseq-count -f bam -t CDS -r pos -i locus_tag $rna/rnamapping_serumpaired_ERR1797969.bam $gff/prokka_correct.gff > serum_ERR1797969_counts.txt
htseq-count -f bam -t CDS -r pos -i locus_tag $rna/rnamapping_serumpaired_ERR1797970.bam $gff/prokka_correct.gff > serum_ERR1797970_counts.txt
htseq-count -f bam -t CDS -r pos -i locus_tag $rna/rnamapping_serumpaired_ERR1797971.bam $gff/prokka_correct.gff > serum_ERR1797971_counts.txt


#HB-RNA counts
htseq-count -f bam -t CDS -r pos -i locus_tag $rna/rnamapping_BHpaired_ERR1797972.bam $gff/prokka_correct.gff > hb_ERR1797972_counts.txt
htseq-count -f bam -t CDS -r pos -i locus_tag $rna/rnamapping_BHpaired_ERR1797973.bam $gff/prokka_correct.gff > hb_ERR1797973_counts.txt
htseq-count -f bam -t CDS -r pos -i locus_tag $rna/rnamapping_BHpaired_ERR1797974.bam $gff/prokka_correct.gff > hb_ERR1797974_counts.txt

