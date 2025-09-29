#!/bin/bash

# Submit this script with: sbatch <this-filename>

#SBATCH --time=1:00:00   # walltime
#SBATCH --ntasks=1   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH -J "wf"   # job name

## /SBATCH -p general # partition (queue)
#SBATCH -o wf-slurm.%N.%j.out # STDOUT
#SBATCH -e wf-slurm.%N.%j.err # STDERR

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE
import PyHipp as pyh; \
pyh.Waveform(saveLevel=1);

