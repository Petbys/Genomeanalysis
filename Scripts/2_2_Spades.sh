#/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00 --qos=short
#SBATCH -j 01_Spades_Petter
#SBATCH --mail-type=All
#SBATCH --mail-user petter.bystrom.8041@student.uu.se

module load bioinfo-tools 
module load spades/3.14.1

output = "/home/pette/Genome_Analysis_Local/Analyses/02_Assembly"
# Illumina reads
read1="/home/raw_data/GenomicsData/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz"
read2="/home/raw_data/GenomicsData/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz"

