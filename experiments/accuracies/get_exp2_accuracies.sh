cat ../../baseline/baseline_translate_results_and_accuracies/*/accuracies/all_accuracies.txt | grep voted > baseline_accuracies
cat ../exp2_bagging_100_models_10000_sample/accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep voted > exp2_accuracies

sdiff baseline_accuracies exp2_accuracies > baseline_vs_exp2_accuracies.txt

rm -f baseline_accuracies exp2_accuracies

