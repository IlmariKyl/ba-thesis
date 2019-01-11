# script: all_majorityvote_and_comparetogold.sh
# author: Ilmari Kylliäinen

# Runs majorityvote.py and dir_comparetogold.py for each language

for lang in arabic finnish georgian german hindi italian khaling navajo russian turkish; do	
	python ../../majorityvote.py -i "$lang"_accuracies_and_translate_results -o "$lang"_exp2_voted.txt
	python ../../dir_comparetogold.py "$lang"_accuracies_and_translate_results ../../gold_files/"$lang"_dev_gold.txt
done
