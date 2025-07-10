#!/bin/bash

# Run SNN training with full parameter specification

python main.py \
  --mat_file "" \
  --dataset TIDIGITS \
  --train_batch_size 44 \
  --eval_batch_size 22 \
  --lr 3e-3 \
  --num_epochs 50 \
  --gpu_id -1 \
  --criterion MSE \
  --n_classes 11 \
  --n_input 64 \
  --max_time 150
