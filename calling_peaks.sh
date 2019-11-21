## Author: Sara Cartan Moya and Jorge Dominguez Barragan
## Date: November 2019
## Contact: saracartanmoya@gmail.com or jodombar@gmail.com

#$ -S /bin/bash
#$ -N chip_sample_processing
#$ -V
#$ -cwd
#$ -j yes
#$ -o chip_sample_processing

#! /bin/bash

## Loading parameters

WD=$1
ID=$2

#Callpeak function

cd $WD/results

##Macs2 for creating the jar file
I=1

while [ $I -le $ID ]
do
   macs2 callpeak -t $WD/samples/chip/chip_sorted_{$ID}. bam -c $WD/samples/input/input_sorted_{$ID}.bam -f BAM --outdir $WD/results -n peak_determination
   ((I++))
done

##PeakAnnotation using the nearest downstream gene as reference
java -jar $WD/scripts/PeakAnnotator.jar -u NDG -g all -p peak_determination.bed -a $WD/annotation/annotation.gtf -o $WD/results

