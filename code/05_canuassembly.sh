#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core -n 4
#SBATCH -t 08:00:00
#SBATCH -J canu
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user eleni.aretaki.7370@student.uu.se


module load bioinfo-tools
module load canu/2.2
canu \
  -p Efaecium -d canu_assembly \
  genomeSize=3m \
  -pacbio /proj/genomeanalysis2023/Genome_Analysis/1_Zhang_2017/genomics_data/PacBio/* \
  -nanopore /proj/genomeanalysis2023/Genome_Analysis/1_Zhang_2017/genomics_data/Nanopore/E745_all.fasta.gz \
  useGrid=false gridOptions="-A uppmax2023-2-8 -t 08:00:00" maxThreads=4
