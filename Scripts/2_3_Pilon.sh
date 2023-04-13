#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00 --qos=short
#SBATCH -J Pilon_Petter
#SBATCH --mail-type=All
#SBATCH --mail-user petter.bystrom.8041@student.uu.se

module load bioinfo-tools
module load bwa
module load Pilon
module load samtools
Assembly="/home/pette/Genome_Analysis_Local/Analyses/02_Assembly/Canu/E745_2.contigs.fasta"
Illumina_reads="/home/pette/Genome_Analysis_Local/Data/raw_data/genomics_raw/Illumina/*"
#map illumina to assembly
cd /home/pette/Genome_Analysis_Local/Analyses/02_Assembly/Pilon
bwa index $Assembly
bwa mem $Assembly $Illumina_reads > Illumina_reference_aligned.sam


#convert to bam
samtools view -b Illumina_reference_aligned.sam > Illumina_reference_aligned.bam
samtools sort -o Illumina_reference_aligned.sorted.bam Illumina_reference_aligned.bam
samtools index Illumina_reference_aligned.sorted.bam

output="/home/pette/Genome_Analysis_Local/Analyses/02_Assembly/Pilon"
input="/home/pette/Genome_Analysis_Local/Analyses/02_Assembly/Canu/E745_2.contigs.fasta"

#Run pilon
java -jar $PILON_HOME/pilon.jar --genome $input --frags Illumina_reference_aligned.sorted.bam --outdir $output
