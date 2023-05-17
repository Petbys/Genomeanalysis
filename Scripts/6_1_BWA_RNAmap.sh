#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 8:00:00
#SBATCH -J RNA_Map_Petter
#SBATCH --mail-type=All
#SBATCH --mail-user petter.bystrom.8041@student.uu.se

module load bioinfo-tools
module load bwa
module load samtools

Assembly="/home/pette/Genome_Analysis_Local/Analyses/02_Assembly/Pilon/pilon.fasta"
Output="/home/pette/Genome_Analysis_Local/Analyses/06_Expression_Profiling/RNA_map"

RNA_1_1_BH="/home/pette/Genome_Analysis_Local/Data/raw_data/transcriptomics_raw/RNA-seq/BH/trim_paired_ERR1797972_pass_1.fastq.gz"
RNA_1_2_BH="/home/pette/Genome_Analysis_Local/Data/raw_data/transcriptomics_raw/RNA-seq/BH/trim_paired_ERR1797972_pass_2.fastq.gz"

RNA_2_1_BH="/home/pette/Genome_Analysis_Local/Data/raw_data/transcriptomics_raw/RNA-seq/BH/trim_paired_ERR1797973_pass_1.fastq.gz"
RNA_2_2_BH="/home/pette/Genome_Analysis_Local/Data/raw_data/transcriptomics_raw/RNA-seq/BH/trim_paired_ERR1797973_pass_2.fastq.gz" 

RNA_3_1_BH="/home/pette/Genome_Analysis_Local/Data/raw_data/transcriptomics_raw/RNA-seq/BH/trim_paired_ERR1797974_pass_1.fastq.gz"
RNA_3_2_BH="/home/pette/Genome_Analysis_Local/Data/raw_data/transcriptomics_raw/RNA-seq/BH/trim_paired_ERR1797974_pass_2.fastq.gz"

RNA_1_1_Serum="/home/pette/Genome_Analysis_Local/Data/raw_data/transcriptomics_raw/RNA-seq/Serum/trim_paired_ERR1797969_pass_1.fastq.gz"
RNA_1_2_Serum="/home/pette/Genome_Analysis_Local/Data/raw_data/transcriptomics_raw/RNA-seq/Serum/trim_paired_ERR1797969_pass_2.fastq.gz"

RNA_2_1_Serum="/home/pette/Genome_Analysis_Local/Data/raw_data/transcriptomics_raw/RNA-seq/Serum/trim_paired_ERR1797970_pass_1.fastq.gz"
RNA_2_2_Serum="/home/pette/Genome_Analysis_Local/Data/raw_data/transcriptomics_raw/RNA-seq/Serum/trim_paired_ERR1797970_pass_2.fastq.gz"

RNA_3_1_Serum="/home/pette/Genome_Analysis_Local/Data/raw_data/transcriptomics_raw/RNA-seq/Serum/trim_paired_ERR1797971_pass_1.fastq.gz"
RNA_3_2_Serum="/home/pette/Genome_Analysis_Local/Data/raw_data/transcriptomics_raw/RNA-seq/Serum/trim_paired_ERR1797971_pass_2.fastq.gz"

bwa index $Assembly

bwa mem $Assembly $RNA_1_1_BH $RNA_1_2_BH | samtools view -b | samtools sort -o $Output/RNA_map_BH_paired_ERR1797972.bam
bwa mem	$Assembly $RNA_2_1_BH $RNA_2_2_BH | samtools view -b | samtools sort -o $Output/RNA_map_BH_paired_ERR1797973.bam
bwa mem $Assembly $RNA_3_1_BH $RNA_3_2_BH | samtools view -b | samtools sort -o $Output/RNA_map_BH_paired_ERR1797974.bam

bwa mem	$Assembly $RNA_1_1_Serum $RNA_1_2_Serum | samtools view -b | samtools sort -o $Output/RNA_map_Serum_paired_ERR1797969.bam
bwa mem $Assembly $RNA_2_1_Serum $RNA_2_2_Serum | samtools view -b | samtools sort -o $Output/RNA_map_Serum_paired_ERR1797970.bam
bwa mem $Assembly $RNA_3_1_Serum $RNA_3_2_Serum | samtools view -b | samtools sort -o $Output/RNA_map_Serum_paired_ERR1797971.bam
