## Author: Sara Cartan Moya and Jorge Dominguez Barragan
## Date: November 2019
## Contact: saracartanmoya@gmail.com or jodombar@gmail.com

#$ -S /bin/bash
#$ -N chip_sample_processing
#$ -V
#$ -cwd
#$ -j yes
#$ -o chip_sample_processing


## Reading parameters

CHIP_ID=$1
WD=$2
NUMCHIP=$3


##Access chip folder 

cd $WD/samples/chip${CHIP_ID}

##QC and mapping 

if [ -e chip${CHIP_ID}_2.fastq ]
   then
     fastqc chip${CHIP_ID}_1.fastq
     fastqc chip${CHIP_ID}_2.fastq

     bowtie2 -x ../../genome/index -1 chip${CHIP_ID}_1.fastq -2 chip${CHIP_ID}_2.fastq -S chip${CHIP_ID}.sam

   else
     fastqc chip${CHIP_ID}_1.fastq

     bowtie2 -x ../../genome/index -U chip${CHIP_ID}_1.fastq -S chip${CHIP_ID}.sam
fi

## Transcript assembly 

samtools view -S -b chip${CHIP_ID}.sam > chip${CHIP_ID}.bam
rm chip${CHIP_ID}.sam
samtools sort chip${CHIP_ID}.bam -o chip_sorted_${CHIP_ID}.bam
rm chip${CHIP_ID}.bam
samtools index chip_sorted_${CHIP_ID}.bam


## Sincronisation poit trough blackboard

echo "chip${SAM_ID} DONE" >> $WD/logs/blackboard

DONE_SAMPLES=$(wc -l $WD/logs/blackboard)

I=0
if [ $DONE_SAMPLES -eq $NUMCHIP ]
then 
   qsub -N input_sample_processing -o $WD/logs/input_sample_processing input_sample_processing.sh PARAMETROS
   ((I++))
fi



