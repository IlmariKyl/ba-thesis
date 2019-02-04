# script: create_preprocessing_scripts.sh
# author: Ilmari Kylliäinen

# Creates preprocessing batch scripts for each language. Running all_preprocess.sh will run them all.

if [ $# -ne 1 ]
then
    echo "ERROR! Wrong amount of command-line arguments."
    echo "Usage: $0 <n_seed_per_language>"
    exit 1
fi

mkdir -p preprocessing_scripts
rm -f preprocessing_scripts/all_preprocess.sh
touch preprocessing_scripts/all_preprocess.sh

for lang in arabic finnish georgian german hindi italian khaling navajo russian turkish; do
	cat ../../batch_template > preprocessing_scripts/preprocess_"$lang".sh
	for i in $(seq 1 $1); do
		echo srun python ../../../../preprocess.py \
		 -train_src ../"$lang"-train-medium-1000to1000/src-"$lang"-train-medium-1000-resampled-s"$i" \
		 -train_tgt ../"$lang"-train-medium-1000to1000/tgt-"$lang"-train-medium-1000-resampled-s"$i" \
		 -valid_src ../../../language_data/"$lang"/src-"$lang"-dev-1000 \
		 -valid_tgt ../../../language_data/"$lang"/tgt-"$lang"-dev-1000 \
		 -save_data ../"$lang"-train-medium-1000to1000/data_"$lang"_resample1000_s"$i" >> preprocessing_scripts/preprocess_"$lang".sh
	done
	echo "rm -f slurm*" >> preprocessing_scripts/preprocess_"$lang".sh
	echo "sbatch preprocess_$lang.sh" >> preprocessing_scripts/all_preprocess.sh
done
