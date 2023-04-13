#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00 --qos=short
#SBATCH -J FastQC_Nanopore_Petter
#SBATCH --mail-type=All
#SBATCH --mail-user petter.bystrom.8041@student.uu.se

module load bioinfo-tools
module load FastQC/0.11.9

#$input1 = /home/pette/Genome_Analysis_Local/Data/raw_data/genomics_raw/Nanopore/m131023_233432_42174_c100519312550000001823081209281335_s1*/      
#for file in /home/pette/Genome_Analysis_Local/Data/raw_data/genomics_raw/PacBio/*
#do
# fastqc --outdir /home/pette/Genome_Analysis_Local/Analyses/01_preprocessing/FastQC/ --threads 1 $file
#done
fastqc --outdir /home/pette/Genome_Analysis_Local/Analyses/01_preprocessing/FastQC/PacBio /home/pette/Genome_Analysis_Local/Data/raw_data/genomics_raw/PacBio/E745_all.fasta.gz
