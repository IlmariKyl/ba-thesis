
for lang in arabic finnish georgian german hindi italian khaling navajo russian turkish; do

	for dir in "$lang"_accuracies_and_translate_results/*; do
		for file in "$dir"; do
			if [[ $(basename "$file") == pred_* ]]
			then
				python ../../comparetogold.py "$lang"_accuracies_and_translate_results/$(basename "$file") ../../gold_files/"$lang"_dev_gold.txt > "$lang"_accuracies_and_translate_results/acc_$(basename "$file")
			fi
		done
	done
	python ../../weighted_majorityvote.py "$lang"_accuracies_and_translate_results "$lang"_exp1_voted.txt "$lang"_exp1_weighted_voted.txt
	python ../../dir_comparetogold.py "$lang"_accuracies_and_translate_results ../../gold_files/"$lang"_dev_gold.txt
done

rm -f ./*/acc_pred*

