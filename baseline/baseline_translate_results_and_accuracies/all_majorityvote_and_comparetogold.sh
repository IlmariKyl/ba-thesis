
for lang in arab fin geor ger hin ita kha nav rus tur; do

	for dir in "$lang"_baseline_translate_results_and_accuracies/*; do
		for file in "$dir"; do
			if [[ $(basename "$file") == pred_* ]]
			then
				python ../comparetogold.py "$lang"_baseline_translate_results_and_accuracies/$(basename "$file") "$lang"_baseline_translate_results_and_accuracies//"$lang"_gold.txt > "$lang"_baseline_translate_results_and_accuracies/acc_$(basename "$file")
			fi
		done
	done
	python ../weighted_majorityvote.py "$lang"_baseline_translate_results_and_accuracies "$lang"_base_voted.txt "$lang"_base_weighted_voted.txt
	python ../dir_comparetogold.py "$lang"_baseline_translate_results_and_accuracies "$lang"_baseline_translate_results_and_accuracies//"$lang"_gold.txt
done

rm -f ./*/acc_pred*

