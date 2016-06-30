#!/bin/bash

#PBS -W group_list=bhurwitz
#PBS -q standard
#PBS -l jobtype=cluster_only
#PBS -l select=1:ncpus=2:mem=4gb
#PBS -l place=pack
#PBS -l walltime=24:00:00
#PBS -l cput=24:00:00
#PBS -M jamesthornton@email.arizona.edu
#PBS -m bea

FASTA="$FASTA_DIR/$FILE"
FILE_NAME=`basename $FILE | cut -d '.' -f 1`

cd "$CLARK_DIR"
./classify_metagenome.sh -k 31 -O $FASTA -R $OUT_DIR/$FILE_NAME.results -m 2 --light

./estimate_abundance.sh -F $OUT_DIR/$FILE_NAME.results.csv -D ./Database/ >> $OUT_DIR/$FILE_NAME.abund.csv  

