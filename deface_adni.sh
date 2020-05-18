#!/bin/bash
. /opt/minc/1.9.15/minc-toolkit-config.sh
INPUT_T1=${1?}
OUTPUT_T1=${2?}

# Convert to MINC format
/opt/minc/1.9.15/bin/nii2mnc ${INPUT_T1} /tmp/input_t1.mnc

# Run defacing pipeline
/opt/bic-pipelines/bin/pipeline_deface.pl \
  /tmp/input_t1.mnc glob \
  --beastlib=/opt/minc/share/beast-library-1.1 \
  --model-dir=/opt/minc/share/icbm152_model_09c \
  --model=mni_icbm152_t1_tal_nlin_sym_09c \
  --output=/tmp/deface --3t

# Convert back to NIFTI
/opt/minc/1.9.15/bin/mnc2nii /tmp/deface_t1w.mnc /tmp/deface.nii
gzip /tmp/deface.nii
cp /tmp/deface.nii.gz ${OUTPUT_T1}

