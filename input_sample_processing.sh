## Author: Sara Cartan Moya and Jorge Dominguez Barragan
## Date: November 2019
## Contact: saracartanmoya@gmail.com or jodombar@gmail.com

#$ -S /bin/bash
#$ -N input_sample_processing
#$ -V
#$ -cwd
#$ -j yes
#$ -o input_sample_processing

##Reading parameters

INPUT=$1
WD=$2
NUMCHIP=$3


## Access input folder

cd $WD/samples/input${INPUT}

##QC and mapping

if [ -e input${INPUT}_2.fastq ]
   then
     fastqc input${INPUT}_1.fastq
     fastqc input${INPUT}_2.fastq

     bowtie2 -x ../../genome/index -1 input${INPUT}_1.fastq -2 input${INPUT}_2.fastq -S input${INPUT}.sam

   else
     fastqc input${INPUT}_1.fastq

     bowtie2 -x ../../genome/index -U input${INPUT}_1.fastq -S input${INPUT}.sam
fi


## Transcript assembly

samtools view -S -b chip${INPUT}.sam > chip${INPUT}.bam
rm chip${INPUT}.sam
samtools sort chip${INPUT}.bam -o chip_sorted_${INPUT}.bam
rm chip${INPUT}.bam
samtools index chip_sorted_${INPUT}.bam

