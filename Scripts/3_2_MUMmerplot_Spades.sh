#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00 --qos=short
#SBATCH -J Mummerplot_Petter
#SBATCH --mail-type=All
#SBATCH --mail-user petter.bystrom.8041@student.uu.se

module load bioinfo-tools
module load MUMmer
output="/home/pette/Genome_Analysis_Local/Analyses/03_Evaluation/MUMmer"
input="/home/pette/Genome_Analysis_Local/Analyses/02_Assembly/Spades/contigs.fasta"
reference="/home/pette/Genome_Analysis_Local/Data/reference/*"
nucmer --mum -p nucmer_spades $reference $input
mummerplot -p nucmer_spades --png -l ./nucmer_spades.delta



