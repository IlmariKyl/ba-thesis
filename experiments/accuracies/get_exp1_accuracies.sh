cat ../../baseline/baseline_translate_results_and_accuracies/*/accuracies/all_accuracies.txt | grep voted > baseline_accuracies
cat ../exp1_bagging_10_models_10000_sample/accuracies_and_translate_results/*/accuracies/all_accuracies.txt | grep voted > exp1_accuracies

sdiff baseline_accuracies exp1_accuracies > baseline_vs_exp1_accuracies.txt

rm -f baseline_accuracies exp1_accuracies

