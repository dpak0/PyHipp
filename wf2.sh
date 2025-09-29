#!/bin/bash

# Submit this script with: sbatch <this-filename>

#SBATCH --time=1:00:00   # walltime
#SBATCH --ntasks=1   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH -J "wf2"   # job name

## /SBATCH -p general # partition (queue)
#SBATCH -o wf2-slurm.%N.%j.out # STDOUT
#SBATCH -e wf2-slurm.%N.%j.err # STDERR

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE
import PyHipp as pyh; \
import DataProcessingTools as DPT; \
wfall = DPT.objects.processDirs(dirs=None, exclude=['*eye*', '*mountains*'], objtype=pyh.Waveform); \
wfall.save();”
aws sns publish --topic-arn arn:aws:sns:ap-southeast-1:454631877139:awsnotify --message "jobdone"
