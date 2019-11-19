## Procesamiento de las muestras de input 
## Author: Sara Cartan Moya and Jorge Dominguez Barragan 

##Reading parameters

INPUT=$1
WD=$2
NUMCHIP=$3
SRA=$4

## Access input folder

cd $WD/samples/input${INPUT}

##QC and mapping

if [ -e {$SRA}_2.fastq ]
   then
     fastqc {$SRA}_1.fastq
     fastqc {$SRA}_2.fastq

     bowtie2 -x ../../genome/index -1 {$SRA}_1.fastq -2 {$SRA}_2.fastq -S input${INPUT}.sam

   else
     fastqc {$SRA}_1.fastq

     bowtie2 -x ../../genome/index -U {$SRA}_1.fastq -S input${INPUT}.sam
fi


## Transcript assembly

samtools view -S -b chip${INPUT}.sam > chip${INPUT}.bam
rm chip${INPUT}.sam
samtools sort chip${INPUT}.bam -o chip_sorted_${INPUT}.bam
rm chip${INPUT}.bam
samtools index chip_sorted_${INPUT}.bam

