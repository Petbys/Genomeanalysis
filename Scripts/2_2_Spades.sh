#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 6:00:00
#SBATCH -j 01_Spades_Petter
#SBATCH --mail-type=All
#SBATCH --mail-user petter.bystrom.8041@student.uu.se

module load bioinfo-tools 
module load spades/3.14.1

output = "/home/pette/Genome_Analysis_Local/Analyses/02_Assembly/Spades"
#Illumina
read1="/home/pette/Genome_Analysis_Local/Data/raw_data/genomics_raw/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz"
read2="/home/pette/Genome_Analysis_Local/Data/raw_data/genomics_raw/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz"
#Nanopore
read3="/home/pette/Genome_Analysis_Local/Data/raw_data/genomics_raw/Nanopore/E745_all.fasta.gz"
#k-mer auto
spades.py \
-1 $read1 \
-2 $read2 \
--nanopore $read3 \
-o $output

