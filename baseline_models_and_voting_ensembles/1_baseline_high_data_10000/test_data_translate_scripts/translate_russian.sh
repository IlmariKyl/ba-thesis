#!/bin/bash
#SBATCH -n 1
#SBATCH -p gpu
#SBATCH -t 10:00:00
#SBATCH --gres=gpu:k80:1
#SBATCH --mail-user=ilmari.kylliainen@helsinki.fi
#SBATCH --mail-type=END
#SBATCH --mem=10000
#SBATCH                                                                                                                                                                              
module purge
module load python-env/3.6.3-ml gcc/5.4.0 cuda/9.0 cudnn/7.1-cuda9

srun python ../../../../translate.py -model ../models/russian_models/model-russian-s1-high_step_12500.pt -src ../../../language_data/russian/src-russian-uncovered-test-1000 -output ../test_data_accuracies_and_translate_results/russian_accuracies_and_translate_results/pred_test_data_russian_12500_base_high_s1.txt -replace_unk -verbose
srun python ../../../../translate.py -model ../models/russian_models/model-russian-s2-high_step_12500.pt -src ../../../language_data/russian/src-russian-uncovered-test-1000 -output ../test_data_accuracies_and_translate_results/russian_accuracies_and_translate_results/pred_test_data_russian_12500_base_high_s2.txt -replace_unk -verbose
srun python ../../../../translate.py -model ../models/russian_models/model-russian-s3-high_step_12500.pt -src ../../../language_data/russian/src-russian-uncovered-test-1000 -output ../test_data_accuracies_and_translate_results/russian_accuracies_and_translate_results/pred_test_data_russian_12500_base_high_s3.txt -replace_unk -verbose
srun python ../../../../translate.py -model ../models/russian_models/model-russian-s4-high_step_12500.pt -src ../../../language_data/russian/src-russian-uncovered-test-1000 -output ../test_data_accuracies_and_translate_results/russian_accuracies_and_translate_results/pred_test_data_russian_12500_base_high_s4.txt -replace_unk -verbose
srun python ../../../../translate.py -model ../models/russian_models/model-russian-s5-high_step_12500.pt -src ../../../language_data/russian/src-russian-uncovered-test-1000 -output ../test_data_accuracies_and_translate_results/russian_accuracies_and_translate_results/pred_test_data_russian_12500_base_high_s5.txt -replace_unk -verbose
srun python ../../../../translate.py -model ../models/russian_models/model-russian-s6-high_step_12500.pt -src ../../../language_data/russian/src-russian-uncovered-test-1000 -output ../test_data_accuracies_and_translate_results/russian_accuracies_and_translate_results/pred_test_data_russian_12500_base_high_s6.txt -replace_unk -verbose
srun python ../../../../translate.py -model ../models/russian_models/model-russian-s7-high_step_12500.pt -src ../../../language_data/russian/src-russian-uncovered-test-1000 -output ../test_data_accuracies_and_translate_results/russian_accuracies_and_translate_results/pred_test_data_russian_12500_base_high_s7.txt -replace_unk -verbose
srun python ../../../../translate.py -model ../models/russian_models/model-russian-s8-high_step_12500.pt -src ../../../language_data/russian/src-russian-uncovered-test-1000 -output ../test_data_accuracies_and_translate_results/russian_accuracies_and_translate_results/pred_test_data_russian_12500_base_high_s8.txt -replace_unk -verbose
srun python ../../../../translate.py -model ../models/russian_models/model-russian-s9-high_step_12500.pt -src ../../../language_data/russian/src-russian-uncovered-test-1000 -output ../test_data_accuracies_and_translate_results/russian_accuracies_and_translate_results/pred_test_data_russian_12500_base_high_s9.txt -replace_unk -verbose
srun python ../../../../translate.py -model ../models/russian_models/model-russian-s10-high_step_12500.pt -src ../../../language_data/russian/src-russian-uncovered-test-1000 -output ../test_data_accuracies_and_translate_results/russian_accuracies_and_translate_results/pred_test_data_russian_12500_base_high_s10.txt -replace_unk -verbose
