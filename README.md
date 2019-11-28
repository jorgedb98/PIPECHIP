# PIPECHIP
PIPECHIP is a computational tool which allows any user to perform a ChIP Seq analysis for any organism and any number of samples.

## Table of Contents
- ChIP Seq
- Usage
- Parameters

## ChIP Seq
ChIP Seq combines methodolgy of High Troughput Sequecing of DNA plus Chromatin Immuno-precipitaion technique to study potential
places for Transcription Factors (TF) to bind DNA. By using PIPECHIP it may be possible to understand where the target TF bind
and what structures they conform.

## Usage
For carrying the study you migth need to create a parameters file in order to create those which they may find necessary.
To see an example, please check the test folder. Inside it there are two different paramteres files, one for an analysisis having
already downloaded the refference genome, the annotatio and samples and another one in case you have to download them all.

## Params files
In this section each parameter from the `params.sh` files is explained. Please read this section carefully in order to perform your analysis correctly.
- `Working_directory`: This parameter stablishes the directory where the analysis will be performed. We strongly reccommend the user to set it by default to the `$HOME` path and add the right path to create the correct folder. In the example given the working directory is `/home/sarajorge/PIPECHIP/tarea1_TCP` which means it will create a folder named tarea1_TCP inside the PIPECHIP folder (already created before the analysis inside the `$HOME`).
- `Number_of_samples`: This parameter refers to the total number of samples (both chips and inputs). It must be a number bigger than 0.
- `genome`: here ther might be two possible scenarios:
  - download
