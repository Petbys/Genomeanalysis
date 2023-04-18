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
module load blast

output="/home/pette/Genome_Analysis_Local/Analyses/03_Evaluation/Blast"
input1="/home/pette/Genome_Analysis_Local/Analyses/02_Assembly/Pilon/pilon.fasta"
input2="/home/pette/Genome_Analysis_Local/Analyses/02_Assembly/Spades/contigs.fasta"
reference="/home/pette/Genome_Analysis_Local/Data/reference/*"

makeblastdb -in $reference -title Assembly_db -dbtype nucl -out $output/Assembly_db
cd $output
blastn -db Assembly_db -query $input1 -out $output/Canu_Pilon_blast.blastn -outfmt 6
blastn -db Assembly_db -query $input2 -out $output/Spades_blast.blastn -outfmt 6
