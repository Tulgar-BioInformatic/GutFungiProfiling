#!/bin/bash
#SBATCH --job-name=bt2_build_UHGG_iso
#SBATCH --partition=bigm
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=256G
#SBATCH --time=3-00:00:00
#SBATCH --output=bt2_build_uhgg_%j.out
#SBATCH --error=bt2_build_uhgg_%j.err

set -euo pipefail


module load conda

source /softs/tools/conda/2025.12/etc/profile.d/conda.sh


conda activate assembly_based



BASE=/scratch/iglesiay/databases/UHGG
FASTA=${BASE}/uhgg_isolates.fa
PREFIX=${BASE}/uhgg_isolates_bt2

echo "Starting Bowtie2 index build"
echo "FASTA:  ${FASTA}"
echo "Prefix: ${PREFIX}"
echo "Date:   $(date)"

bowtie2-build \
  --threads ${SLURM_CPUS_PER_TASK} \
  "${FASTA}" \
  "${PREFIX}"

echo "Finished at $(date)"
