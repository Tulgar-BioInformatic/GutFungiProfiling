#!/bin/bash
#SBATCH --job-name=dl_gtdb_genomes
#SBATCH --partition=std
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G
#SBATCH --time=48:00:00
#SBATCH --output=/home/iglesiay/stage_project/GutFungiProfiling/logs/dl_gtdb_%j.out
#SBATCH --error=/home/iglesiay/stage_project/GutFungiProfiling/logs/dl_gtdb_%j.err

set -euo pipefail

# =========================
# Configuration
# =========================
GTDB_BASE_URL="https://data.gtdb.ecogenomic.org/releases/latest/genomic_files_reps"
OUTDIR="/scratch/iglesiay/databases/GTDB"
FILE="gtdb_genomes_reps.tar.gz"

mkdir -p "${OUTDIR}"
cd "${OUTDIR}"


# =========================
# Download (robust)
# =========================
aria2c \
  --continue=true \
  --file-allocation=trunc \
  --summary-interval=60 \
  -x 4 \
  -s 4 \
  -k 1M \
  "${GTDB_BASE_URL}/${FILE}"

# =========================
# Optional: checksum (if available later)
# =========================
echo "Download finished: ${OUTDIR}/${FILE}"
