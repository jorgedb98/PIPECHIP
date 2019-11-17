## This pipeline analysis Chip-seq data

##Author: Sara Cartan Moya and Jorge Dominguez Barragan
##Date: November 2019

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

SAMPLES=( )
I=0

while [ $I -lt $NUMSAM ]
do
   SAMPLES[$I]=$(grep sample_$(($I+1)): $PARAMS | awk '{ print$2 }')
   ((I++))
done

##Printing variable values

echo WORKING_DIRECTORY=$WD
echo NUMBER_OF_SAMPLES=$NUMSAM
echo GENOME=$GENOME
echo ANNOTATION=$ANNOTATION

I=0

while [ $I -lt $NUMSAM ]
do
   echo sample_$((I + 1)) = ${SAMPLES[$I]}
   ((I++))
done

##Generate the working directory

mkdir $WD
cd $WD
mkdir genome annotation samples results logs 

cd samples
I=1

while [ $I -le $NUMSAM ]
do
   mkdir sample$I
   ((I++))
done

## Download genome of reference

cd ../genome
wget -O genome.fa.gz $GENOME
gunzip genome.fa.gz


## Download annotation 

cd ../annotation
wget -O annotation.gtf.gz 
gunzip annotation.gtf.gz

## Building reference index

cd ../genome
bowtie2-build genome.fa index

## Download samples

cd $WD/samples

I=0

while [ $I -lt $NUMSAM ]
do
   fastq-dump --split-files sample$(($I+1))
   ((I++))
done


