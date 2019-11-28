# PIPECHIP
PIPECHIP is a computational tool which allows any user to perform a ChIP Seq analysis for any organism and any number of samples.

## Table of Contents
- ChIP Seq
- Usage
- Parameters

     ┌────────────────────────────────────────────────────────────────────┐
     │                        • MobaXterm 12.3 •                          │
     │            (SSH client, X-server and networking tools)             │
     │                                                                    │
     │ ➤ SSH session to sarajorge@molsysbio.cica.es                       │
     │   • SSH compression : ✔                                            │
     │   • SSH-browser     : ✔                                            │
     │   • X11-forwarding  : ✔  (remote display is forwarded through SSH) │
     │   • DISPLAY         : ✔  (automatically set on remote server)      │
     │                                                                    │
     │ ➤ For more info, ctrl+click on help or visit our website           │
     └────────────────────────────────────────────────────────────────────┘

Welcome to Ubuntu 16.04.2 LTS (GNU/Linux 4.4.0-116-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

202 packages can be updated.
1 update is a security update.

New release '18.04.3 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


*** System restart required ***
Last login: Thu Nov 28 10:23:00 2019 from 83.51.17.144
sarajorge@molsysbio:~$ who
sarajorge pts/0        2019-11-28 15:07 (83.51.17.144)
fran     pts/6        2019-11-17 23:47 (213:S.0)
sarajorge@molsysbio:~$ clear
sarajorge@molsysbio:~$ cd PIPECHIP/
sarajorge@molsysbio:~/PIPECHIP$ ls
calling_peaks.sh               input_sample_processing.sh  pipechip.sh  tarea1_cp   target_genes.R
chip_seq_sample_processing.sh  LICENSE.md                  README.md    tarea1_TCP  test
sarajorge@molsysbio:~/PIPECHIP$ nano README.md
  GNU nano 2.5.3                                          File: README.md                                                                                  Modified

# PIPECHIP
PIPECHIP is a computational tool which allows any user to perform a ChIP Seq analysis for any organism and any number of samples.
Taking this into account, please make sure you read carefully throughout this README introduction in order to perform your
analysis successfully.

## Table of Contents
- ChIP Seq
- Usage
- Params files

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
  - 
