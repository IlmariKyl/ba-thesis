# script: movetodirectories.sh

# Moves data files own each language to their own directories

mkdir -p processed_conll2017_data/arabic processed_conll2017_data/finnish processed_conll2017_data/georgian processed_conll2017_data/german processed_conll2017_data/hindi processed_conll2017_data/italian processed_conll2017_data/khaling processed_conll2017_data/navajo processed_conll2017_data/russian processed_conll2017_data/turkish

mv processed_conll2017_data/*arabic-* processed_conll2017_data/arabic/
mv processed_conll2017_data/*finnish-* processed_conll2017_data/finnish/
mv processed_conll2017_data/*georgian-* processed_conll2017_data/georgian/
mv processed_conll2017_data/*german-* processed_conll2017_data/german/
mv processed_conll2017_data/*hindi-* processed_conll2017_data/hindi/
mv processed_conll2017_data/*italian-* processed_conll2017_data/italian/
mv processed_conll2017_data/*khaling-* processed_conll2017_data/khaling/
mv processed_conll2017_data/*navajo-* processed_conll2017_data/navajo/
mv processed_conll2017_data/*russian-* processed_conll2017_data/russian/
mv processed_conll2017_data/*turkish-* processed_conll2017_data/turkish/

