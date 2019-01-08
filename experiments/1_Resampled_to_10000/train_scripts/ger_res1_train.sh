#!/bin/bash
#SBATCH -n 1
#SBATCH -p gpu
#SBATCH -t 02:00:00
#SBATCH -J ../models/ger_models/ger_res1_high_gpu_job
#SBATCH -o ../empty_out_files/ger_res1_gpu_job.out_.%j
#SBATCH -e ../models/ger_models/output_ger_res1_high_gpu_job.%j
#SBATCH --gres=gpu:k80:1
#SBATCH --mail-user=ilmari.kylliainen@helsinki.fi
#SBATCH --mail-type=END
#SBATCH --mem=10000
#SBATCH                                                                                                                                                                              
module purge
module load python-env/intelpython3.6-2018.3 gcc/5.4.0 cuda/9.0 cudnn/7.1-cuda9

srun python ../../../../train.py -data ../german-train-high-10000to10000/data_ger_resample1000_s1 -save_model ../models/ger_models/model-ger-res1-high -world_size 1 -gpu_ranks 0 1 -layers 1 -rnn_size 300 -src_word_vec_size 100 -tgt_word_vec_size 100 -encoder_type brnn -global_attention general -optim adam -learning_rate 0.001 -report_every 1000 -valid_steps 1000 -train_steps 12500 -save_checkpoint_steps 12500 -seed 1

