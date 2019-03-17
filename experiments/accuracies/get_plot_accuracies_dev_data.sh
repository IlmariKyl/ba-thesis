
cat ../exp5_bagging_high_10_models_10000_sample_different_train_seeds/accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep -o "[0-9]_voted.txt\s\+[0-9\.]\+" | grep -o "[0-9\.]\+$" > exp5_voted_dev_data_accuracies
cat ../exp5_bagging_high_10_models_10000_sample_different_train_seeds/accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep -o "[0-9]_weighted_voted.txt\s\+[0-9\.]\+" | grep -o "[0-9\.]\+$" > exp5_weighted_voted_dev_data_accuracies

cat ../exp6_bagging_high_100_models_10000_sample_different_train_seeds/accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep -o "[0-9]_voted.txt\s\+[0-9\.]\+" | grep -o "[0-9\.]\+$" > exp6_voted_dev_data_accuracies
cat ../exp6_bagging_high_100_models_10000_sample_different_train_seeds/accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep -o "[0-9]_weighted_voted.txt\s\+[0-9\.]\+" | grep -o "[0-9\.]\+$" > exp6_weighted_voted_dev_data_accuracies

cat ../exp7_bagging_medium_10_models_1000_sample_different_train_seeds/accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep -o "[0-9]_voted.txt\s\+[0-9\.]\+" | grep -o "[0-9\.]\+$" > exp7_voted_dev_data_accuracies
cat ../exp7_bagging_medium_10_models_1000_sample_different_train_seeds/accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep -o "[0-9]_weighted_voted.txt\s\+[0-9\.]\+" | grep -o "[0-9\.]\+$" > exp7_weighted_voted_dev_data_accuracies

cat ../exp8_bagging_medium_100_models_1000_sample_different_train_seeds/accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep -o "[0-9]_voted.txt\s\+[0-9\.]\+" | grep -o "[0-9\.]\+$" > exp8_voted_dev_data_accuracies
cat ../exp8_bagging_medium_100_models_1000_sample_different_train_seeds/accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep -o "[0-9]_weighted_voted.txt\s\+[0-9\.]\+" | grep -o "[0-9\.]\+$" > exp8_weighted_voted_dev_data_accuracies

