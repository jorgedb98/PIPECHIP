# PIPECHIP
PIPECHIP is a computational tool which allows any user to perform a ChIP Seq analysis for any organism and any number of samples.

## Table of Contents
- ChIP Seq
- Usage
- Parameters
- Example given

## ChIP Seq
ChIP Seq combines methodolgy of High Troughput Sequecing of DNA plus Chromatin Immuno-precipitaion technique to study potential
places for Transcription Factors (TF) to bind DNA. By using PIPECHIP it may be possible to understand where the target TF bind
and what structures they conform.

## Usage
For carrying the study you migth need to create a parameters file in order to create those which they may find necessary.
To see an example, please check the test folder. Inside it there are two different paramteres files, one for an analysisis having
already downloaded the refference genome, the annotatio and samples and another one in case you have to download them all.

## Params files
__PLEASE NOTICE THAT THIS TUTORIAL INCLUDES A `test` FOLDER WHERE THE PARAMS FILE IS AVAILABLE. TAKE INTO ACCOUNT THAT THIS EXAMPLE IS GIVEN FOR HAVING TO DOWNLOAD THE REFFERENCE GENOME, THE ANNOTATION AND THE SAMPLES.__
In this section each parameter from the `params.sh` file is explained. Please read this section carefully in order to perform your analysis correctly. __PLEASE MAKE SURE YOU LEAVE A SPACE BETWEEN THE `:` AND THE BEGGNING OF THE PARAMETER!!__
- `Working_directory`: This parameter stablishes the directory where the analysis will be performed. We strongly reccommend the user to set it by default to the `$HOME` path and create a folder called PIPECHIP (this is a suggestion) where you are going to paste the scripts and a folder called test where params file will be added. After that, add the right path to create the correct folder. In the example given the working directory is `/home/sarajorge/PIPECHIP/tarea1_TCP` which means it will create a folder named `tarea1_TCP` inside the PIPECHIP folder (already created before the analysis inside the `$HOME`).

- `Number_of_samples`: This parameter refers to the total number of samples (both chips and inputs). It must be a number bigger than 0.

- `genome`: depending on having downloaded or not the refference genome already, ther might be 2 possible options:
  - __HAVING ALREADY your genome DOWNLOADED.__ In this case, you shall __PASTE IT INTO THE `test` FOLDER__ inside PIPECHIP. Once you have done so, the param genome will be the path to the refference genome inside the test folder.
  - __NOT HAVING DOWNLOADED THE GENOME.__ In this case, all you need to do is paste in the genome param the link to the refference genome.
  
- `annotation`: depending on having downloaded or not the annotation already, ther might be 2 possible options:
  - __HAVING ALREADY your genome ANNOTATION.__ In this case, you shall __PASTE IT INTO THE `test` FOLDER__ inside PIPECHIP. Once you have done so, the param genome will be the path to the annotation inside the test folder.
  - __NOT HAVING DOWNLOADED THE ANNOTATION.__ In this case, all you need to do is paste in the genome param the link to the refference genome.

- `chip_num`: This parameter refers to the number of chim samples.

- `input_num`: This parameter refers to the number of input samples.

This example is given for a test where 2 chip samples and 2 input samples are used. Following, it will be indicated the samples.
- `chip_1`: paste the path to the chip 1 sample or add the right SRR.
- `chip_2`: paste the path to the chip 2 sample or add the right SRR.
- `input_1`: paste the path to the inpu 1 sample or add the right SRR.
- `input_2`: paste the path to the input 2 sample or add the right SRR.
Once, more, ther might be 2 possible options here:
  - __HAVING ALREADY DOWNLOADED THE SAMPLES.__ In this case, you should paste them as well into the `test` folder and add in this parameter, the path to this folder.
  - __NOT HAVING DOWNLOADED THE SAMPLES.__ In this case, you must paste here the SRR accession number from NCBI.

- `sample_dir`: paste the path to the `test` folder where yu have pasted the params file along with the genome, annotation and samples, given the case you have them already downloaded.

- `promoter`: This parameter refers to the length of the promotoer for the proccessing of picks obtained using macs2 function. 
- `output`: This parameter refers to the directory where you might want to save the peak proccessing file.

## Example given
For further information about this tool you may like to perform the analysis using the example samples. You may find them in the NCBI accession number __GSE115358__. The genome and the annotation used were obtained from ensembl plants.
