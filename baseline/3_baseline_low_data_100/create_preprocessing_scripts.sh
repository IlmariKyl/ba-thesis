# script: create_preprocessing_scripts.sh
# author: Ilmari Kylliäinen

# Creates preprocessing batch scripts for each language. Running all_preprocess.sh will run them all.

if [ $# -ne 0 ]
then
    echo "ERROR! Wrong amount of command-line arguments."
    echo "Usage: $0 <n_seed_per_language>"
    exit 1
fi

mkdir -p preprocessing_scripts preprocessed_data
rm -f preprocessing_scripts/all_preprocess.sh
touch preprocessing_scripts/all_preprocess.sh

for lang in arabic finnish georgian german hindi italian khaling navajo russian turkish; do
	cat ../../batch_template > preprocessing_scripts/preprocess_"$lang".sh
	
	echo srun python ../../../python_scripts/preprocess.py \
	 -train_src ../../../language_data/"$lang"/src-"$lang"-train-low-100 \
	 -train_tgt ../../../language_data/"$lang"/tgt-"$lang"-train-low-100 \
	 -valid_src ../../../language_data/"$lang"/src-"$lang"-dev-1000 \
	 -valid_tgt ../../../language_data/"$lang"/tgt-"$lang"-dev-1000 \
	 -save_data ../preprocessed_data/data_"$lang"_low_100 >> preprocessing_scripts/preprocess_"$lang".sh

	echo "rm -f slurm*" >> preprocessing_scripts/preprocess_"$lang".sh
	echo "sbatch preprocess_$lang.sh" >> preprocessing_scripts/all_preprocess.sh
done
