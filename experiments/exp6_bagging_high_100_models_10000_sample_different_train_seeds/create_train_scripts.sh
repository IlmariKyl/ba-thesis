# script: create_train_scripts.sh
# author: Ilmari Kylliäinen

# Creates train batch scripts for each language. Running all_train.sh will run them all.

if [ $# -ne 1 ]
then
    echo "ERROR! Wrong amount of command-line arguments."
    echo "Usage: $0 <n_seed_per_language>"
    exit 1
fi

mkdir -p models
mkdir -p train_scripts
rm -f train_scripts/all_train.sh
touch train_scripts/all_train.sh

for lang in arabic finnish georgian german hindi italian khaling navajo russian turkish; do
	mkdir -p models/"$lang"_models
	for i in $(seq 1 $1); do
		cat ../../batch_template > train_scripts/train_"$lang"_res"$i".sh
		echo srun python ../../../../train.py \
		-data ../"$lang"-train-high-10000to10000/data_"$lang"_resample10000_s"$i" \
		-save_model ../models/"$lang"_models/model-"$lang"-high-res"$i" \
		-world_size 1 \
		-gpu_ranks 0 1 \
		-layers 1 \
		-rnn_size 300 \
		-src_word_vec_size 100 \
		-tgt_word_vec_size 100 \
		-encoder_type brnn -global_attention general \
		-optim adam \
		-learning_rate 0.001 \
		-report_every 100 \
		-valid_steps 100 \
		-train_steps 12500 \
		-save_checkpoint_steps 12500 \
		-seed "$i" >> train_scripts/train_"$lang"_res"$i".sh \
        -log_file log_file_"$lang"_s"$i"

		echo "rm -f slurm*" >> train_scripts/train_"$lang"_res"$i".sh
		echo "sbatch train_${lang}_res${i}.sh" >> train_scripts/all_train.sh

	done
	
done

