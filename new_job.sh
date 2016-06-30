#!/bin/sh

source ./config.sh

cd "$FASTA_DIR"
export FILES_LIST="$FASTA_DIR/files-list"
pwd
ls *.fasta > $FILES_LIST

while read FILE; do
    export FILE="$FILE"
    NUM_FILES=`wc -l $FILES_LIST | cut -d ' ' -f 1`
    
    JOB_ID1=`qsub -v SCRIPT_DIR,OUT_DIR,FILE,CLARK_DIR,FASTA_DIR -N clark -e "$STDERR_DIR" -o "$STDOUT_DIR" $SCRIPT_DIR/run_clark.sh`


done < $FILES_LIST
