#!/usr/bin/env bash
set -euo pipefail

# Downloads ISIC challenge files into the repo's data/Datasets/ directory.
# This script assumes it lives at: data/scripts/get_isic_data.sh
# and will write to:              data/Datasets/...
#
# Usage:
#   ./scripts/get_isic_data.sh
#   UNZIP=1 ./scripts/get_isic_data.sh   # also unzip archives

UNZIP="${UNZIP:-0}"

# Repo layout: this script is in ./scripts, datasets live in ../Datasets
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTDIR="${OUTDIR:-${SCRIPT_DIR}/../Datasets}"

download () {
  local url="$1"
  local out="$2"
  mkdir -p "$(dirname "$out")"
  echo "==> $url"
  echo "    -> $out"
  # -L follow redirects, -C - resume partial downloads
  curl -L -C - -o "$out" "$url"
}

maybe_unzip () {
  local zipfile="$1"
  local destdir="$2"
  if [[ "$UNZIP" == "1" ]]; then
    mkdir -p "$destdir"
    echo "Unzipping $zipfile -> $destdir"
    unzip -q "$zipfile" -d "$destdir"
  fi
}

# ---- ISIC 2020 ----
download "https://isic-challenge-data.s3.amazonaws.com/2020/ISIC_2020_Training_JPEG.zip" \
         "${OUTDIR}/ISIC_2020_Training_JPEG.zip"

download "https://isic-challenge-data.s3.amazonaws.com/2020/ISIC_2020_Training_GroundTruth_v2.csv" \
         "${OUTDIR}/ISIC_2020_Training_GroundTruth_v2.csv"

maybe_unzip "${OUTDIR}/ISIC_2020_Training_JPEG.zip" \
            "${OUTDIR}/ISIC_2020_Training_JPEG"

# ---- ISIC 2019 (test) ----
download "https://isic-archive.s3.amazonaws.com/challenges/2019/ISIC_2019_Test_Input.zip" \
         "${OUTDIR}/ISIC_2019_Test_Input.zip"

download "https://isic-archive.s3.amazonaws.com/challenges/2019/ISIC_2019_Test_GroundTruth.csv" \
         "${OUTDIR}/ISIC_2019_Test_GroundTruth.csv"

download "https://isic-archive.s3.amazonaws.com/challenges/2019/ISIC_2019_Test_Metadata.csv" \
         "${OUTDIR}/ISIC_2019_Test_Metadata.csv"

maybe_unzip "${OUTDIR}/ISIC_2019_Test_Input.zip" \
            "${OUTDIR}/ISIC_2019_Test_Input"

echo "Done. Files are under: ${OUTDIR}"
echo "Tip: run with UNZIP=1 to extract ZIPs."
