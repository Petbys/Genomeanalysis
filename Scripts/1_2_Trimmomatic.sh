#/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00 --qos=short
#SBATCH -j Trimmomatic_Petter
#SBATCH --mail-type=All
#SBATCH --mail-user petter.bystrom.8041@student.uu.se

module load bioinfo-tools
module load trimmomatic/0.36 
module load java/sun_jdk1.8.0_151

id = "illumina"

output = "/home/pette/Genome_Analysis_Local/Analyses/01_preprocessing"
read1=$1
read2=$2

# java -jar $TRIMMOMATIC_HOME/trimmomatic.jar PE -phred33 $read1 $read2 ${id}.trimmomatic_r1_P ${id}.trimmomatic_r1_U ${id}.trimmomatic_r2_P ${id}.trimmomatic_r2_U TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36