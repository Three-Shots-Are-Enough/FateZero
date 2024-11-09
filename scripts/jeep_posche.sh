#!/bin/bash

source ~/anaconda3/etc/profile.d/conda.sh
conda activate fatezero38

export CUDA_HOME=/opt/ohpc/pub/apps/cuda/12.1
export LD_LIBRARY_PATH=$CUDA_HOME/lib64

TORCH_LIB_DIR=$(python -c "import torch; import os; print(os.path.join(os.path.dirname(torch.__file__), 'lib'))")
export LD_LIBRARY_PATH=$TORCH_LIB_DIR:$LD_LIBRARY_PATH

echo "=== Environment Information ==="
echo "CUDA_HOME: $CUDA_HOME"
echo "LD_LIBRARY_PATH: $LD_LIBRARY_PATH"
python -c "import torch; print('PyTorch version:', torch.__version__); print('CUDA available:', torch.cuda.is_available())"
ls -l $TORCH_LIB_DIR

accelerate launch test_fatezero.py --config config/teaser/jeep_posche.yaml