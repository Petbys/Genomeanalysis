#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J Quast_Petter
#SBATCH --mail-type=All
#SBATCH --mail-user petter.bystrom.8041@student.uu.se

module load bioinfo-tools
module load quast

output="/home/pette/Genome_Analysis_Local/Analyses/03_Evaluation/Spades"
input="/home/pette/Genome_Analysis_Local/Analyses/02_Assembly/Spades/contigs.fasta"
reference="/home/pette/Genome_Analysis_Local/Data/reference/*"
quast.py $input -r $reference -o $output --gene-finding 
