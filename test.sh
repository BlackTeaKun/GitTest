#!/bin/bash
workdir='/mnt/h/code/bash'

outputdir=`pwd`"/output"
tmp=`pwd`"/runnumber_list"
mkdir -p $outputdir
mkdir -p ${tmp}
for file in $workdir/*.root
do
    runnum=`echo $file | grep -o "+[0-9]\{8\}"`
    runnum=${runnum##+}
    filename=${file##/*/}
    echo ${filename} >> ${tmp}/${runnum}.list
done
mv ${tmp}/*.list ${outputdir}
rm -r ${tmp}
