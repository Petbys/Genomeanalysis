#!/bin/bash
module load bioinfo-tools
module load samtools

Gene_id="/home/pette/Genomeanalysis/Scripts/sig_genes.csv"
Annotatition="/home/pette/Genome_Analysis_Local/Analyses/04_Annotation/Prokka_canu_pilon/Canu_pilon_annotation_prokka.faa"

#while IFS= read -r $Gene_id; do
  #echo "$Gene_id"
  #samtools faidx $Annotatition $Gene_id >> Significant_genes.faa
#done < "$1"
#!/bin/sh

for i in `cat $Gene_id`
do
  samtools faidx $Annotatition $i >> /home/pette/Genome_Analysis_Local/Analyses/06_Expression_Profiling/Significant_genes.faa
done
