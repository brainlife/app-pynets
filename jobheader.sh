#!/bin/bash

if [[ "$(jq -r .mplx config.json)" != "0" ]]; then
    walltime=48:00:00
elif [[ "$(jq -r .dwi config.json)" != "0" ]]; then
    walltime=36:00:00
else
    walltime=2:00:00
fi

echo "#SBATCH --nodes=1"
echo "#SBATCH --ntasks-per-node=1"
echo "#SBATCH --mem=60G"
echo "#SBATCH -t $walltime"
