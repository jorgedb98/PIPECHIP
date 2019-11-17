## This pipeline analysis Chip-seq data

##Author: Sara Cartan Moya and Jorge Dominguez Barragan
##Date: November 2019

#! /bin/bash

if [ $# -eq 0 ]
   then
    echo "This pipeline analysisi RNA-seq data."
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
echo GENOMA=$GENOME
echo ANNOTATION=$ANNOTATION

I=0

while [ $I -lt $NUMSAM ]
do
   echo sample_$((I + 1)) = ${SAMPLES[$I]}
   ((I++))
done

##Generate the working directory



