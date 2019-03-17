# script: create_translate_scripts.sh
# author: Ilmari Kylliäinen

# Creates translate batch scripts for each language. Running all_translate.sh will run them all.

if [ $# -ne 1 ]
then
    echo "ERROR! Wrong amount of command-line arguments."
    echo "Usage: $0 <n_seed_per_language>"
    exit 1
fi

mkdir -p test_data_accuracies_and_translate_results
mkdir -p test_data_translate_scripts
rm -f test_data_translate_scripts/all_translate.sh

for lang in arabic finnish georgian german hindi italian khaling navajo russian turkish; do
	mkdir -p test_data_accuracies_and_translate_results/"$lang"_accuracies_and_translate_results
    cat ../../batch_template > test_data_translate_scripts/translate_"$lang".sh
	for i in $(seq 1 $1); do
		echo srun python ../../../../translate.py \
		-model ../models/"$lang"_models/model-"$lang"-high-res"$i"_step_12500.pt \
		-src ../../../language_data/"$lang"/src-"$lang"-uncovered-test-1000 \
		-output ../test_data_accuracies_and_translate_results/"$lang"_accuracies_and_translate_results/pred_test_data_"$lang"_12500_exp5_res"$i".txt \
		-replace_unk \
		-verbose >> test_data_translate_scripts/translate_"$lang".sh
    done
    echo "sbatch translate_${lang}.sh" >> test_data_translate_scripts/all_translate.sh

done
