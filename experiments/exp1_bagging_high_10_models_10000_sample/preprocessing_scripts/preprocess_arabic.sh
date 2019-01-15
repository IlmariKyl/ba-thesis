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


srun python ../../../../preprocess.py -train_src ../arabic-train-high-10000to10000/src-arabic-train-high-10000-resampled-s1 -train_tgt ../arabic-train-high-10000to10000/tgt-arabic-train-high-10000-resampled-s1 -valid_src ../../../language_data/arabic/src-arabic-dev-1000 -valid_tgt ../../../language_data/arabic/tgt-arabic-dev-1000 -save_data ../arabic-train-high-10000to10000/data_arabic_resample1000_s1
srun python ../../../../preprocess.py -train_src ../arabic-train-high-10000to10000/src-arabic-train-high-10000-resampled-s2 -train_tgt ../arabic-train-high-10000to10000/tgt-arabic-train-high-10000-resampled-s2 -valid_src ../../../language_data/arabic/src-arabic-dev-1000 -valid_tgt ../../../language_data/arabic/tgt-arabic-dev-1000 -save_data ../arabic-train-high-10000to10000/data_arabic_resample1000_s2
srun python ../../../../preprocess.py -train_src ../arabic-train-high-10000to10000/src-arabic-train-high-10000-resampled-s3 -train_tgt ../arabic-train-high-10000to10000/tgt-arabic-train-high-10000-resampled-s3 -valid_src ../../../language_data/arabic/src-arabic-dev-1000 -valid_tgt ../../../language_data/arabic/tgt-arabic-dev-1000 -save_data ../arabic-train-high-10000to10000/data_arabic_resample1000_s3
srun python ../../../../preprocess.py -train_src ../arabic-train-high-10000to10000/src-arabic-train-high-10000-resampled-s4 -train_tgt ../arabic-train-high-10000to10000/tgt-arabic-train-high-10000-resampled-s4 -valid_src ../../../language_data/arabic/src-arabic-dev-1000 -valid_tgt ../../../language_data/arabic/tgt-arabic-dev-1000 -save_data ../arabic-train-high-10000to10000/data_arabic_resample1000_s4
srun python ../../../../preprocess.py -train_src ../arabic-train-high-10000to10000/src-arabic-train-high-10000-resampled-s5 -train_tgt ../arabic-train-high-10000to10000/tgt-arabic-train-high-10000-resampled-s5 -valid_src ../../../language_data/arabic/src-arabic-dev-1000 -valid_tgt ../../../language_data/arabic/tgt-arabic-dev-1000 -save_data ../arabic-train-high-10000to10000/data_arabic_resample1000_s5
srun python ../../../../preprocess.py -train_src ../arabic-train-high-10000to10000/src-arabic-train-high-10000-resampled-s6 -train_tgt ../arabic-train-high-10000to10000/tgt-arabic-train-high-10000-resampled-s6 -valid_src ../../../language_data/arabic/src-arabic-dev-1000 -valid_tgt ../../../language_data/arabic/tgt-arabic-dev-1000 -save_data ../arabic-train-high-10000to10000/data_arabic_resample1000_s6
srun python ../../../../preprocess.py -train_src ../arabic-train-high-10000to10000/src-arabic-train-high-10000-resampled-s7 -train_tgt ../arabic-train-high-10000to10000/tgt-arabic-train-high-10000-resampled-s7 -valid_src ../../../language_data/arabic/src-arabic-dev-1000 -valid_tgt ../../../language_data/arabic/tgt-arabic-dev-1000 -save_data ../arabic-train-high-10000to10000/data_arabic_resample1000_s7
srun python ../../../../preprocess.py -train_src ../arabic-train-high-10000to10000/src-arabic-train-high-10000-resampled-s8 -train_tgt ../arabic-train-high-10000to10000/tgt-arabic-train-high-10000-resampled-s8 -valid_src ../../../language_data/arabic/src-arabic-dev-1000 -valid_tgt ../../../language_data/arabic/tgt-arabic-dev-1000 -save_data ../arabic-train-high-10000to10000/data_arabic_resample1000_s8
srun python ../../../../preprocess.py -train_src ../arabic-train-high-10000to10000/src-arabic-train-high-10000-resampled-s9 -train_tgt ../arabic-train-high-10000to10000/tgt-arabic-train-high-10000-resampled-s9 -valid_src ../../../language_data/arabic/src-arabic-dev-1000 -valid_tgt ../../../language_data/arabic/tgt-arabic-dev-1000 -save_data ../arabic-train-high-10000to10000/data_arabic_resample1000_s9
srun python ../../../../preprocess.py -train_src ../arabic-train-high-10000to10000/src-arabic-train-high-10000-resampled-s10 -train_tgt ../arabic-train-high-10000to10000/tgt-arabic-train-high-10000-resampled-s10 -valid_src ../../../language_data/arabic/src-arabic-dev-1000 -valid_tgt ../../../language_data/arabic/tgt-arabic-dev-1000 -save_data ../arabic-train-high-10000to10000/data_arabic_resample1000_s10
rm -f slurm*
