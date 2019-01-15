rm -f ./*/acc_pred*

for lang in arabic finnish georgian german hindi italian khaling navajo russian turkish; do

    for file in "$lang"_accuracies_and_translate_results/*; do
        if [[ $(basename "$file") == pred_* ]]
        then
            python ../../../python_scripts/comparetogold.py "$file" ../../../experiments/gold_files/"$lang"_dev_gold.txt
        fi
    done
	python ../../../python_scripts/weighted_majorityvote.py "$lang"_accuracies_and_translate_results "$lang"_high_base_voted.txt "$lang"_high_base_weighted_voted.txt
	python ../../../python_scripts/dir_comparetogold.py "$lang"_accuracies_and_translate_results ../../../experiments/gold_files/"$lang"_dev_gold.txt
done

rm -f ./*/acc_pred*

