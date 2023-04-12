#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 04:00:00
#SBATCH -J Canu_Petter
#SBATCH --mail-type=All
#SBATCH --mail-user petter.bystrom.8041@student.uu.se

module load bioinfo-tools
module load canu/2.0

read1="/home/pette/Genome_Analysis_Local/Data/raw_data/genomics_raw/PacBio/E745_all.fasta.gz"
read2="/home/pette/Genome_Analysis_Local/Data/raw_data/genomics_raw/Nanopore/m131023_233432_42174_c100519312550000001823081209281335_s1_X0.1.subreads.fastq.gz"
read3="/home/pette/Genome_Analysis_Local/Data/raw_data/genomics_raw/Nanopore/m131023_233432_42174_c100519312550000001823081209281335_s1_X0.2.subreads.fastq.gz"
read4="/home/pette/Genome_Analysis_Local/Data/raw_data/genomics_raw/Nanopore/m131023_233432_42174_c100519312550000001823081209281335_s1_X0.3.subreads.fastq.gz"
read5="/home/pette/Genome_Analysis_Local/Data/raw_data/genomics_raw/Nanopore/m131024_200535_42174_c100563672550000001823084212221342_s1_p0.1.subreads.fastq.gz"
read6="/home/pette/Genome_Analysis_Local/Data/raw_data/genomics_raw/Nanopore/m131024_200535_42174_c100563672550000001823084212221342_s1_p0.2.subreads.fastq.gz"
read6="/home/pette/Genome_Analysis_Local/Data/raw_data/genomics_raw/Nanopore/m131024_200535_42174_c100563672550000001823084212221342_s1_p0.3.subreads.fastq.gz"

output="/home/pette/Genome_Analysis_Local/Analyses/02_Assembly/Canu"

canu -p E745 -d $output genomeSize=4.5m -pacbio $read1 -nanopore $read2 $read3 $read4 $read5 $read6 $read_7
