#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 6:00:00
#SBATCH -J Prokka_Petter
#SBATCH --mail-type=All
#SBATCH --mail-user petter.bystrom.8041@student.uu.se

module load bioinfo-tools
module load prokka

prokka \
--outdir /home/pette/Genome_Analysis_Local/Analyses/04_Annotation/Prokka_canu_pilon \
--prefix /Canu_pilon_annotation_prokka \
--genus Enterococcus \
--species faecium \
--strain E745 \
--gram pos \
/home/pette/Genome_Analysis_Local/Analyses/02_Assembly/Pilon/pilon.fasta
