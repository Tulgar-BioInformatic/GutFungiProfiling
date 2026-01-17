#!/bin/bash
#SBATCH --job-name=dl_refseq_euka
#SBATCH --partition=std
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G
#SBATCH --time=06:00:00
#SBATCH --output=/home/iglesiay/stage_project/GutFungiProfiling/logs/dl_refseq_euka_%j.out
#SBATCH --error=/home/iglesiay/stage_project/GutFungiProfiling/logs/dl_refseq_euka_%j.err

set -euo pipefail

module load conda
source /softs/tools/conda/2025.12/etc/profile.d/conda.sh
conda activate assembly_based

cd /scratch/iglesiay/databases/RefSeq



datasets download genome taxon 2759 \
  --reference \
  --assembly-source refseq \
  --include genome \
  --filename refseq_eukaryota_reference_genomes.zip \
  --no-progressbar
