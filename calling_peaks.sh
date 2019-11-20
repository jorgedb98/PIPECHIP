##Author: Sara Cartan Moya



##Macs2 for creating the jar file



macs2 callpeak
-t $WD/samples/chip/chip_sorted_{$CHIP_ID}. bam
-c $WD/samples/input/input_sorted_{$INPUT_ID}.bam
-f BAM
--outdir $WD/results
-n peak_determination

##PeakAnnotation using the nearest downstream gene as reference
java -jar 



java -jar ../../scripts/PeakAnnotator.jar -u NDG -g all -p prr5_summits.bed
-a ../../annotation/chromosome_1.gtf -o .
