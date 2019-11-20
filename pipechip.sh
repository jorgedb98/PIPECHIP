## This pipeline analysis Chip-seq data

## Author: Sara Cartan Moya and Jorge Dominguez Barragan
## Date: November 2019

#! /bin/bash

if [ $# -eq 0 ]
   then
    echo "This pipeline analysisi Chip Seq data."
    echo "Usage: piperna <param_file>"
    echo ""
    echo "param_file: File with the parameters spefification. Please, check params.sh for an example"
    echo ""
    echo "Enjoy!"

    exit 0
fi


## Parameters loading

PARAMS=$1

WD=$(grep working_directory: $PARAMS | awk '{ print$2 }')
NUMSAM=$(grep number_of_samples: $PARAMS | awk '{ print$2 }')
GENOME=$(grep genome: $PARAMS | awk '{ print$2 }')
ANNOTATION=$(grep annotation: $PARAMS | awk '{ print$2 }')
NUMCHIP=$(grep chip_num: $PARAMS | awk '{ print$2 }')
NUMINPUT=$(grep input_num: $PARAMS | awk '{ print$2 }')

SAMPLES_CHIP=( )
I=0

while [ $I -lt $NUMCHIP ]
do
   SAMPLES_CHIP[$I]=$(grep sra_chip$(($I+1)): $PARAMS | awk '{ print$2 }')
   ((I++))
done

SAMPLES_INPUT=( )
I=0

while [ $I -lt $NUMINPUT ]
do
   SAMPLES_INPUT[$I]=$(grep sra_input$(($I+1)): $PARAMS | awk '{ print$2 }')
   ((I++))
done


##Printing variable values

echo WORKING_DIRECTORY=$WD
echo NUMBER_OF_SAMPLES=$NUMSAM
echo GENOME=$GENOME
echo ANNOTATION=$ANNOTATION
echo NUMBER_CHIP_SAMPLES=$NUMCHIP
echo NUMBER_INPUT_SAMPLES=$NUMINPUT

I=0

while [ $I -lt $NUMCHIP ]
do
   echo chip_$((I + 1)) = ${SAMPLES_CHIP[$I]}
   ((I++))
done

I=0

while [ $I -lt $NUMINPUT ]
do
   echo input_$((I + 1)) = ${SAMPLES_INPUT[$I]}
   ((I++))
done


##Generate the working directory

mkdir $WD
cd $WD
mkdir genome annotation samples results logs

cd samples
mkdir chip input
cd chip

I=1

while [ $I -le $NUMCHIP ]
do
   mkdir chip$I
   ((I++))
done

cd ../input

I=1

while [ $I -le $NUMINPUT ]
do
     mkdir input$I
     ((I++))
done

## Download genome of reference

cd $WD/genome
wget -O genome.fa.gz $GENOME
gunzip genome.fa.gz


## Download annotation

cd $WD/annotation
wget -O annotation.gtf.gz $ANNOTATION
gunzip annotation.gtf.gz

## Building reference index

cd $WD/genome
bowtie2-build genome.fa index

## Download samples and name changing

cd $WD/samples/chip

I=0

while [ $I -lt $NUMCHIP ]
do
   cd chip$((I+1))
   fastq-dump --split-files ${SAMPLES_CHIP[$I]}
   if [ -e ${SAMPLES_CHIP[$I]}_2.fastq ]
      then 
       mv ${SAMPLES_CHIP[$I]}_1.fastq chip$((I+1))_1.fastq
       mv ${SAMPLES_CHIP[$I]}_2.fastq chip$((I+1))_2.fastq
      else
       mv ${SAMPLES_CHIP[$I]}_1.fastq chip$((I+1)).fastq
   fi
   cd $WD/samples/chip
   sleep 30s ##Wait 30 seconds
   ((I++))
done

cd $WD/samples/input

I=0

while [ $I -lt $NUMINPUT ]
do
   cd chip$((I+1))
   fastq-dump --split-files ${SAMPLES_INPUT[$I]}
   if [ -e ${SAMPLES_INPUT[$I]}_2.fastq ]
      then 
       mv ${SAMPLES_INPUT[$I]}_1.fastq chip$((I+1))_1.fastq
       mv ${SAMPLES_INPUT[$I]}_2.fastq chip$((I+1))_2.fastq
      else
       mv ${SAMPLES_INPUT[$I]}_1.fastq chip$((I+1)).fastq
   fi


##Punto de paralelizacion 

I=1

while [ $I -le $NUMCHIP ]
do
   qsub -N chip$I -o $WD/logs/chip$I /home/sarajorge/PIPECHIP/chip_seq_sample_processing.sh $I $WD ${NUMCHIP}
   ((I++))

done

## Input processing

I=1

while [ $I -le $NUMINPUT ]
   do
   qsub -N input$I -o $WD/logs/input$I /home/sarajorge/PIPECHIP/input_sample_processing.sh $I $WD ${NUMINPUT} 
   ((I++))
done
