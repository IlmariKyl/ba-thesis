#!/bin/bash
#SBATCH -n 1
#SBATCH -p gpu
#SBATCH -t 04:00:00
#SBATCH --gres=gpu:k80:1
#SBATCH --mail-user=ilmari.kylliainen@helsinki.fi
#SBATCH --mail-type=END
#SBATCH --mem=10000
#SBATCH                                                                                                                                                                              
module purge
module load python-env/intelpython3.6-2018.3 gcc/5.4.0 cuda/9.0 cudnn/7.1-cuda9

srun python ../../../../translate.py -model ../models/fin_models/model-fin-res1-high_step_12500.pt -src ../../../language_data/finnish/src-finnish-dev-1000 -output translate_batch1.txt -replace_unk -verbose

rm -f slurm*

