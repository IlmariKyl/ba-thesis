#!/bin/bash
#SBATCH -n 1
#SBATCH -p gpu
#SBATCH -t 04:00:00
#SBATCH -J language_data/arabic/test_models/gpu_job_ger_high_t4
#SBATCH -o empty_out_files/t4_gpu_job.out_.%j
#SBATCH -e language_data/arabic/test_models/t4_output_gpu_job_ger_high.err.%j
#SBATCH --gres=gpu:k80:1
#SBATCH --mail-user=ilmari.kylliainen@helsinki.fi
#SBATCH --mail-type=ALL
#SBATCH --mem=10000
#SBATCH                                                                                                                                                                              
module purge
module load python-env/intelpython3.6-2018.3 gcc/5.4.0 cuda/9.0 cudnn/7.1-cuda9

srun python train.py -data language_data/german/demo -save_model language_data/german/model1/demo-ger-high -world_size 1 -gpu_ranks 0 1 -layers 1 -rnn_size 300 -src_word_vec_size 100 -tgt_word_vec_size 100 -encoder_type brnn -global_attention general -optim adam -learning_rate 0.001 -report_every 250 -valid_steps 250 -train_steps 10000

