# script: create_translate_scripts.sh
# author: Ilmari Kylliäinen

# Creates translate batch scripts for each language. Running all_translate.sh will run them all.

if [ $# -ne 1 ]
then
    echo "ERROR! Wrong amount of command-line arguments."
    echo "Usage: $0 <n_seed_per_language>"
    exit 1
fi

mkdir -p accuracies_and_translate_results
mkdir -p translate_scripts
rm -f translate_scripts/all_translate.sh

for lang in arabic finnish georgian german hindi italian khaling navajo russian turkish; do
	mkdir -p accuracies_and_translate_results/"$lang"_accuracies_and_translate_results
	for i in $(seq 1 $1); do
		cat ../../batch_template > translate_scripts/translate_"$lang"_res"$i".sh

		echo srun python ../../../../translate.py \
		-model ../models/"$lang"_models/model-"$lang"-high-res"$i"_step_12500.pt \
		-src ../../../language_data/"$lang"/src-"$lang"-dev-1000 \
		-output ../accuracies_and_translate_results/"$lang"_accuracies_and_translate_results/pred_"$lang"_12500_exp6_res"$i".txt \
		-replace_unk \
		-verbose >> translate_scripts/translate_"$lang"_res"$i".sh

		echo "rm -f slurm*" >> translate_scripts/translate_"$lang"_res"$i".sh
		echo "sbatch translate_${lang}_res${i}.sh" >> translate_scripts/all_translate.sh

	done
done
