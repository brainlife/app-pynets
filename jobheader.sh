#!/bin/bash

if [[ "$(jq -r .mplx config.json)" != "0" ]]; then
    walltime=48:00:00
elif [[ "$(jq -r .dwi config.json)" != "0" ]]; then
    walltime=48:00:00
else
    walltime=6:00:00
fi

echo "#PBS -l nodes=1:ppn=1,walltime="$walltime""
echo "#PBS -l vmem=64gb"
echo "#PBS -N PyNets"
