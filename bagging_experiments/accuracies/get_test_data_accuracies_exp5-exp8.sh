sort ../../baseline/1_baseline_high_data_10000/test_data_accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep voted > baseline_high_test_data_accuracies
sort ../../baseline/2_baseline_medium_data_1000/test_data_accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep voted > baseline_medium_test_data_accuracies

sort ../exp5_bagging_high_10_models_10000_sample_different_train_seeds/test_data_accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep voted > exp5_test_data_accuracies
sort ../exp6_bagging_high_100_models_10000_sample_different_train_seeds/test_data_accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep voted > exp6_test_data_accuracies
sort ../exp7_bagging_medium_10_models_1000_sample_different_train_seeds/test_data_accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep voted > exp7_test_data_accuracies
sort ../exp8_bagging_medium_100_models_1000_sample_different_train_seeds/test_data_accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep voted > exp8_test_data_accuracies

echo -e "Baseline and bagging accuracies compared (bagging models have different seed in training)\n\n" > test_data_accuracies_exp5-exp8.txt
echo -e "Baseline high VS exp 4 (10 models, 10 000 sample):\n" >> test_data_accuracies_exp5-exp8.txt
sdiff baseline_high_test_data_accuracies exp5_test_data_accuracies >> test_data_accuracies_exp5-exp8.txt
echo -e "\n" >> test_data_accuracies_exp5-exp8.txt

echo -e "Baseline high VS exp 5 (100 models, 10 000 sample):\n" >> test_data_accuracies_exp5-exp8.txt
sdiff baseline_high_test_data_accuracies exp6_test_data_accuracies >> test_data_accuracies_exp5-exp8.txt
echo -e "\n" >> test_data_accuracies_exp5-exp8.txt

echo -e "Baseline medium VS exp 5 (10 models, 1000 sample):\n" >> test_data_accuracies_exp5-exp8.txt
sdiff baseline_medium_test_data_accuracies exp7_test_data_accuracies >> test_data_accuracies_exp5-exp8.txt
echo -e "\n" >> test_data_accuracies_exp5-exp8.txt

echo -e "Baseline medium VS exp 6 (100 models, 1000 sample):\n" >> test_data_accuracies_exp5-exp8.txt
sdiff baseline_medium_test_data_accuracies exp8_test_data_accuracies >> test_data_accuracies_exp5-exp8.txt
echo -e "\n" >> test_data_accuracies_exp5-exp8.txt


rm -f baseline_high_test_data_accuracies baseline_medium_test_data_accuracies exp*

