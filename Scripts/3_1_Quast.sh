#/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00 --qos=short
#SBATCH -j FastQC_Technique_Petter
#SBATCH --mail-type=All
#SBATCH --mail-user petter.bystrom.8041@student.uu.se

module load bioinfo-tools
module load FastQC/0.11.9

output = "/home/pette/Genome_Analysis_Local/Analyses/03_Evaluation"
read1=$1
fastqc $read1 -o $output --threads 1
