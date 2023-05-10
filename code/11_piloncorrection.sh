#!/bin/bash
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J pilon
#SBATCH --mail-type=ALL
#SBATCH --mail-user eleni.aretaki.7370@student.uu.se

# Load modules
module load bioinfo-tools
module load Pilon/1.24


ass=~/genome_analysis/Genome_Analysis/analysis/03_canuassembly/canu_assembly/Efaecium.contigs.fasta
aln=~/genome_analysis/Genome_Analysis/analysis/09_bwaalignment/bwa_align_sorted.bam

java -Xmx16G -jar /sw/apps/bioinfo/Pilon/1.24/snowy/pilon.jar --genome $ass --frags $aln --output pilon_outdir --changes
