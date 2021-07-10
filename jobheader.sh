#!/bin/bash

if [[ "$(jq -r .mplx config.json)" != "0" ]]; then
    walltime=48:00:00
    ppn=1
elif [[ "$(jq -r .dwi config.json)" != "0" ]]; then
    walltime=48:00:00
    ppn=1
else
    walltime=8:00:00
    ppn=12
fi

echo "#PBS -l nodes=1:ppn="$ppn",walltime="$walltime""
echo "#PBS -l vmem=48gb"
echo "#PBS -N PyNets"
