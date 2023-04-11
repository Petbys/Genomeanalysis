#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00 --qos=short
#SBATCH -J Trimmomatic_Petter
#SBATCH --mail-type=All
#SBATCH --mail-user petter.bystrom.8041@student.uu.se

# Load modules

module load bioinfo-tools

module load trimmomatic
# Your commands

#Settings for trimmming paired end reads

trimmomatic PE -phred33 /home/pette/raw_data/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz /home/pette/raw_data/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz /home/pette/Genome_Analysis_Local/Analyses/01_preprocessing/Trimmomatic/Illumina_trimmed/E745-1.L500_SZAXPI015146-56_clean_trim_forward_paired.fq.gz /home/pette/Genome_Analysis_Local/Analyses/01_preprocessing/Trimmomatic/Illumina_trimmed/E745-1.L500_SZAXPI015146-56_clean_trim_forward_unpaired.fq.gz //home/pette/Genome_Analysis_Local/Analyses/01_preprocessing/Trimmomatic/Illumina_trimmed/E745-1.L500_SZAXPI015146-56_clean_trim_reverse_paired.fq.gz /home/pette/Genome_Analysis_Local/Analyses/01_preprocessing/Trimmomatic/Illumina_trimmed/E745-1.L500_SZAXPI015146-56_clean_trim_reverse_unpaired.fq.gz ILLUMINACLIP:/sw/bioinfo/trimmomatic/0.39/rackham/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

