sort ../../baseline/1_baseline_high_data_10000/accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep voted > baseline_high_accuracies
sort ../../baseline/2_baseline_medium_data_1000/accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep voted > baseline_medium_accuracies
sort ../../baseline/3_baseline_low_data_100/accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep voted > baseline_low_accuracies

sort ../exp5_bagging_high_10_models_10000_sample_different_train_seeds/accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep voted > exp5_accuracies
sort ../exp6_bagging_high_100_models_10000_sample_different_train_seeds/accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep voted > exp6_accuracies
sort ../exp7_bagging_medium_10_models_1000_sample_different_train_seeds/accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep voted > exp7_accuracies
sort ../exp8_bagging_medium_100_models_1000_sample_different_train_seeds/accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep voted > exp8_accuracies

echo -e "Baseline and bagging accuracies compared (bagging models have different seed in training)\n\n" > accuracies_different_seed.txt
echo -e "Baseline high VS exp 4 (10 models, 10 000 sample):\n" >> accuracies_different_seed.txt
sdiff baseline_high_accuracies exp5_accuracies >> accuracies_different_seed.txt
echo -e "\n" >> accuracies_different_seed.txt

echo -e "Baseline high VS exp 5 (100 models, 10 000 sample):\n" >> accuracies_different_seed.txt
sdiff baseline_high_accuracies exp6_accuracies >> accuracies_different_seed.txt
echo -e "\n" >> accuracies_different_seed.txt

echo -e "Baseline medium VS exp 5 (10 models, 1000 sample):\n" >> accuracies_different_seed.txt
sdiff baseline_medium_accuracies exp7_accuracies >> accuracies_different_seed.txt
echo -e "\n" >> accuracies_different_seed.txt

echo -e "Baseline medium VS exp 6 (100 models, 1000 sample):\n" >> accuracies_different_seed.txt
sdiff baseline_medium_accuracies exp8_accuracies >> accuracies_different_seed.txt
echo -e "\n" >> accuracies_different_seed.txt

echo -e "Baseline low:\n" >> accuracies_different_seed.txt
cat baseline_low_accuracies >> accuracies_different_seed.txt
echo -e "\n" >> accuracies_different_seed.txt

rm -f baseline_high_accuracies baseline_medium_accuracies baseline_low_accuracies exp*

