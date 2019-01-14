#!/bin/bash
#SBATCH -n 1
#SBATCH -p gpu
#SBATCH -t 03:00:00
#SBATCH --gres=gpu:k80:1
#SBATCH --mail-user=ilmari.kylliainen@helsinki.fi
#SBATCH --mail-type=END
#SBATCH --mem=10000
#SBATCH                                                                                                                                                                              
module purge
module load python-env/intelpython3.6-2018.3 gcc/5.4.0 cuda/9.0 cudnn/7.1-cuda9

srun python ../../../python_scripts/preprocess.py -train_src ../../../language_data/georgian/src-georgian-train-low-100 -train_tgt ../../../language_data/georgian/tgt-georgian-train-low-100 -valid_src ../../../language_data/georgian/src-georgian-dev-1000 -valid_tgt ../../../language_data/georgian/tgt-georgian-dev-1000 -save_data ../preprocessed_data/data_georgian_low_100
rm -f slurm*
