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

srun python ../../../../translate.py -model ../models/arabic_models/model-arabic-res1-high_step_12500.pt -src ../../../language_data/arabic/src-arabic-uncovered-test-1000 -output ../test_data_accuracies_and_translate_results/arabic_accuracies_and_translate_results/pred_test_data_arabic_12500_exp1_res1.txt -replace_unk -verbose
srun python ../../../../translate.py -model ../models/arabic_models/model-arabic-res2-high_step_12500.pt -src ../../../language_data/arabic/src-arabic-uncovered-test-1000 -output ../test_data_accuracies_and_translate_results/arabic_accuracies_and_translate_results/pred_test_data_arabic_12500_exp1_res2.txt -replace_unk -verbose
srun python ../../../../translate.py -model ../models/arabic_models/model-arabic-res3-high_step_12500.pt -src ../../../language_data/arabic/src-arabic-uncovered-test-1000 -output ../test_data_accuracies_and_translate_results/arabic_accuracies_and_translate_results/pred_test_data_arabic_12500_exp1_res3.txt -replace_unk -verbose
srun python ../../../../translate.py -model ../models/arabic_models/model-arabic-res4-high_step_12500.pt -src ../../../language_data/arabic/src-arabic-uncovered-test-1000 -output ../test_data_accuracies_and_translate_results/arabic_accuracies_and_translate_results/pred_test_data_arabic_12500_exp1_res4.txt -replace_unk -verbose
srun python ../../../../translate.py -model ../models/arabic_models/model-arabic-res5-high_step_12500.pt -src ../../../language_data/arabic/src-arabic-uncovered-test-1000 -output ../test_data_accuracies_and_translate_results/arabic_accuracies_and_translate_results/pred_test_data_arabic_12500_exp1_res5.txt -replace_unk -verbose
srun python ../../../../translate.py -model ../models/arabic_models/model-arabic-res6-high_step_12500.pt -src ../../../language_data/arabic/src-arabic-uncovered-test-1000 -output ../test_data_accuracies_and_translate_results/arabic_accuracies_and_translate_results/pred_test_data_arabic_12500_exp1_res6.txt -replace_unk -verbose
srun python ../../../../translate.py -model ../models/arabic_models/model-arabic-res7-high_step_12500.pt -src ../../../language_data/arabic/src-arabic-uncovered-test-1000 -output ../test_data_accuracies_and_translate_results/arabic_accuracies_and_translate_results/pred_test_data_arabic_12500_exp1_res7.txt -replace_unk -verbose
srun python ../../../../translate.py -model ../models/arabic_models/model-arabic-res8-high_step_12500.pt -src ../../../language_data/arabic/src-arabic-uncovered-test-1000 -output ../test_data_accuracies_and_translate_results/arabic_accuracies_and_translate_results/pred_test_data_arabic_12500_exp1_res8.txt -replace_unk -verbose
srun python ../../../../translate.py -model ../models/arabic_models/model-arabic-res9-high_step_12500.pt -src ../../../language_data/arabic/src-arabic-uncovered-test-1000 -output ../test_data_accuracies_and_translate_results/arabic_accuracies_and_translate_results/pred_test_data_arabic_12500_exp1_res9.txt -replace_unk -verbose
srun python ../../../../translate.py -model ../models/arabic_models/model-arabic-res10-high_step_12500.pt -src ../../../language_data/arabic/src-arabic-uncovered-test-1000 -output ../test_data_accuracies_and_translate_results/arabic_accuracies_and_translate_results/pred_test_data_arabic_12500_exp1_res10.txt -replace_unk -verbose
