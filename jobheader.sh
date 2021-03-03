#!/bin/bash

if [[ "$(jq -r .mplx config.json)" != "0" ]]; then
    walltime=48:00:00
elif [[ "$(jq -r .dwi config.json)" != "0" ]]; then
    walltime=36:00:00
else
    walltime=2:00:00
fi

echo "#PBS -l nodes=1:ppn=1,walltime="$walltime""
echo "#PBS -l vmem=48gb"
echo "#PBS -N PyNets"
