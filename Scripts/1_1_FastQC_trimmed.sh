#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00 --qos=short
#SBATCH -J FastQC_Trimmed_Petter
#SBATCH --mail-type=All
#SBATCH --mail-user petter.bystrom.8041@student.uu.se

module load bioinfo-tools
module load FastQC/0.11.9

for file in /home/pette/Genome_Analysis_Local/Analyses/01_preprocessing/Trimmomatic/Illumina_trimmed/*
do
 fastqc --outdir /home/pette/Genome_Analysis_Local/Analyses/01_preprocessing/FastQC/Illumina_trimmed $file
done
