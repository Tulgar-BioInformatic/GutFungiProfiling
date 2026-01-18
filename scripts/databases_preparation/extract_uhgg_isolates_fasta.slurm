#!/bin/bash
#SBATCH --job-name=uhgg_gff2fa
#SBATCH --partition=std
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=16G
#SBATCH --time=2-00:00:00
#SBATCH --output=uhgg_gff2fa_%j.out
#SBATCH --error=uhgg_gff2fa_%j.err

set -euo pipefail

BASE=/scratch/iglesiay/databases/UHGG
GFFDIR=${BASE}/genomes_fasta
OUTDIR=${BASE}/isolates_fasta

mkdir -p "${OUTDIR}"

while read -r id; do
  gff=${GFFDIR}/${id}.gff.gz
  out=${OUTDIR}/${id}.fa

  if [[ -f "${gff}" && ! -f "${out}" ]]; then
    zcat "${gff}" | awk '
      BEGIN {fasta=0}
      /^##FASTA/ {fasta=1; next}
      fasta {print}
    ' > "${out}"
  fi
done < ${BASE}/uhgg_isolates.list
