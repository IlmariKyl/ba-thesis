sort ../../baseline/1_baseline_high_data_10000/accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep voted > baseline_high_accuracies
sort ../../baseline/2_baseline_medium_data_1000/accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep voted > baseline_medium_accuracies
sort ../../baseline/3_baseline_low_data_100/accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep voted > baseline_low_accuracies

sort ../exp1_bagging_high_10_models_10000_sample/accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep voted > exp1_accuracies
sort ../exp2_bagging_high_100_models_10000_sample/accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep voted > exp2_accuracies
sort ../exp3_bagging_medium_10_models_1000_sample/accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep voted > exp3_accuracies
sort ../exp4_bagging_medium_100_models_1000_sample/accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep voted > exp4_accuracies

echo -e "Baseline and bagging accuracies compared (bagging models have same seed in training)\n\n" > dev_data_accuracies_exp1-exp4.txt
echo -e "Baseline high VS exp 1 (10 models, 10 000 sample):\n" >> dev_data_accuracies_exp1-exp4.txt
sdiff baseline_high_accuracies exp1_accuracies >> dev_data_accuracies_exp1-exp4.txt
echo -e "\n" >> dev_data_accuracies_exp1-exp4.txt

echo -e "Baseline high VS exp 2 (100 models, 10 000 sample):\n" >> dev_data_accuracies_exp1-exp4.txt
sdiff baseline_high_accuracies exp2_accuracies >> dev_data_accuracies_exp1-exp4.txt
echo -e "\n" >> dev_data_accuracies_exp1-exp4.txt

echo -e "Baseline medium VS exp 3 (10 models, 1000 sample):\n" >> dev_data_accuracies_exp1-exp4.txt
sdiff baseline_medium_accuracies exp3_accuracies >> dev_data_accuracies_exp1-exp4.txt
echo -e "\n" >> dev_data_accuracies_exp1-exp4.txt

echo -e "Baseline medium VS exp 4 (100 models, 1000 sample):\n" >> dev_data_accuracies_exp1-exp4.txt
sdiff baseline_medium_accuracies exp4_accuracies >> dev_data_accuracies_exp1-exp4.txt
echo -e "\n" >> dev_data_accuracies_exp1-exp4.txt

echo -e "Baseline low:\n" >> dev_data_accuracies_exp1-exp4.txt
cat baseline_low_accuracies >> dev_data_accuracies_exp1-exp4.txt
echo -e "\n" >> dev_data_accuracies_exp1-exp4.txt

rm -f baseline_high_accuracies baseline_medium_accuracies baseline_low_accuracies exp*

