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
input="/home/pette/Genome_Analysis_Local/Analyses/02_Assembly/Pilon/pilon.fasta"
reference="/home/pette/Genome_Analysis_Local/Data/reference/*"
nucmer --mum -p nucmer_pilon $reference $input
cd /home/pette/Genome_Analysis_Local/Analyses/03_Evaluation/MUMmer
mummerplot -p nucmer_pilon --png -l ./nucmer_pilon.delta
