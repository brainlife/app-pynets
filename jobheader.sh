#!/bin/bash

if [[ "$(jq -r .mplx config.json)" != "0" ]]; then
    walltime=48:00:00
    ppn=10
elif [[ "$(jq -r .dwi config.json)" != "0" ]]; then
    walltime=48:00:00
    ppn=10
else
    walltime=8:00:00
    ppn=10
fi

echo "#PBS -l nodes=1:ppn="$ppn",walltime="$walltime""
echo "#PBS -l vmem=60gb"
echo "#PBS -N PyNets"
