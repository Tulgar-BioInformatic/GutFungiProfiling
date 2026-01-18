#!/bin/bash
#SBATCH --job-name=concat_uhgg_iso
#SBATCH --partition=std
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=16G
#SBATCH --time=1-00:00:00
#SBATCH --output=concat_uhgg_%j.out
#SBATCH --error=concat_uhgg_%j.err

set -euo pipefail

BASE=/scratch/iglesiay/databases/UHGG
IN=${BASE}/isolates_fasta
OUT=${BASE}/uhgg_isolates.fa

echo "Starting concat at $(date)"
echo "Input dir: ${IN}"
echo "Output: ${OUT}"

cat ${IN}/*.fa > ${OUT}

echo "Finished concat at $(date)"
