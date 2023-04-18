#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00 --qos=short
#SBATCH -J Artemis_Petter
#SBATCH --mail-type=All
#SBATCH --mail-user petter.bystrom.8041@student.uu.se

# Load modules

module load bioinfo-tools
module load artemis

Blast1="/home/pette/Genome_Analysis_Local/Analyses/03_Evaluation/Blast/Canu_Pilon_blast.blastn "
Blast2="/home/pette/Genome_Analysis_Local/Analyses/03_Evaluation/Blast/Spades_blast.blastn" 
output="/home/pette/Genome_Analysis_Local/Analyses/03_Evaluation/Blast"
input1="/home/pette/Genome_Analysis_Local/Analyses/02_Assembly/Pilon/pilon.fasta"
input2="/home/pette/Genome_Analysis_Local/Analyses/02_Assembly/Spades/contigs.fasta"
reference="/home/pette/Genome_Analysis_Local/Data/reference/*"

echo act $input1 $Blast1 $reference 
echo act $input2 $Blast2 $reference






