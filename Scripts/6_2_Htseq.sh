#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 8:00:00
#SBATCH -J HTseq_Petter
#SBATCH --mail-type=All
#SBATCH --mail-user petter.bystrom.8041@student.uu.se

module load bioinfo-tools
module load htseq
output="/home/pette/Genome_Analysis_Local/Analyses/06_Expression_Profiling/RNA_count_6outputs_csv/"
Annotation="/home/pette/Genome_Analysis_Local/Analyses/04_Annotation/Prokka_canu_pilon/Canu_pilon_annotation_prokka.gff"
BWA_Dir="/home/pette/Genome_Analysis_Local/Analyses/06_Expression_Profiling/RNA_map"

for file in $BWA_Dir/*.bam 
do
base=$(basename "$file" .bam)
htseq-count -f bam -r pos -i locus_tag -t CDS -c ${base}_count.csv $file $Annotation
done
