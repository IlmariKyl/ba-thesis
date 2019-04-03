# script: resample_all_languages.sh
# author: Ilmari Kylliäinen

# Resamples high train data for each language.
# Usage: resample_all_languages.sh <num_of_lines_in_samples> <num_of_files_to_create>

if [ $# -ne 2 ]
then
    echo "ERROR! Wrong amount of command-line arguments."
    echo "Usage: $0 <num_of_lines_in_samples> <num_of_files_to_create>"
    exit 1
fi

for lang in arabic finnish georgian german hindi italian khaling navajo russian turkish; do
	python ../../python_scripts/resampler.py ../../language_data/"$lang"/src-"$lang"-train-high-10000 ../../language_data/"$lang"/tgt-"$lang"-train-high-10000 $1 $2
done
