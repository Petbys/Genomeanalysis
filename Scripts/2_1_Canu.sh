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
module load canu/2.0
id = "E745"
read1=$1
read2=$2
read3=$3
read4=$4
read5=$5
read6=$6

output = "/home/pette/Genome_Analysis_Local/Analyses/02_Assembly"
canu -p $id -d $output genomeSize=4.5m -pacbio $read1 $read2 $read3 $read4 $read5 $read6

