cat log_file_arabic_s1 | grep -o "Validation accuracy: [0-9]\+\.[0-9]\+" | grep -o "[0-9]\+\.[0-9]\+" > arabic_valid_accuracies
cat log_file_arabic_s1 | grep -o "Step [0-9]\+" | grep -o "[0-9]\+" > arabic_steps
cat log_file_arabic_s1 | grep -o "perplexity: [0-9]\+\.[0-9]\+" | grep -o "[0-9]\+\.[0-9]\+" > arabic_perplexity

cat log_file_finnish_s1 | grep -o "Validation accuracy: [0-9]\+\.[0-9]\+" | grep -o "[0-9]\+\.[0-9]\+" > finnish_valid_accuracies
cat log_file_finnish_s1 | grep -o "Step [0-9]\+" | grep -o "[0-9]\+" > finnish_steps
cat log_file_finnish_s1 | grep -o "perplexity: [0-9]\+\.[0-9]\+" | grep -o "[0-9]\+\.[0-9]\+" > finnish_perplexity

cat log_file_georgian_s1 | grep -o "Validation accuracy: [0-9]\+\.[0-9]\+" | grep -o "[0-9]\+\.[0-9]\+" > georgian_valid_accuracies
cat log_file_georgian_s1 | grep -o "Step [0-9]\+" | grep -o "[0-9]\+" > georgian_steps
cat log_file_georgian_s1 | grep -o "perplexity: [0-9]\+\.[0-9]\+" | grep -o "[0-9]\+\.[0-9]\+" > georgian_perplexity

cat log_file_german_s1 | grep -o "Validation accuracy: [0-9]\+\.[0-9]\+" | grep -o "[0-9]\+\.[0-9]\+" > german_valid_accuracies
cat log_file_german_s1 | grep -o "Step [0-9]\+" | grep -o "[0-9]\+" > german_steps
cat log_file_german_s1 | grep -o "perplexity: [0-9]\+\.[0-9]\+" | grep -o "[0-9]\+\.[0-9]\+" > german_perplexity

cat log_file_hindi_s1 | grep -o "Validation accuracy: [0-9]\+\.[0-9]\+" | grep -o "[0-9]\+\.[0-9]\+" > hindi_valid_accuracies
cat log_file_hindi_s1 | grep -o "Step [0-9]\+" | grep -o "[0-9]\+" > hindi_steps
cat log_file_hindi_s1 | grep -o "perplexity: [0-9]\+\.[0-9]\+" | grep -o "[0-9]\+\.[0-9]\+" > hindi_perplexity

cat log_file_italian_s1 | grep -o "Validation accuracy: [0-9]\+\.[0-9]\+" | grep -o "[0-9]\+\.[0-9]\+" > italian_valid_accuracies
cat log_file_italian_s1 | grep -o "Step [0-9]\+" | grep -o "[0-9]\+" > italian_steps
cat log_file_italian_s1 | grep -o "perplexity: [0-9]\+\.[0-9]\+" | grep -o "[0-9]\+\.[0-9]\+" > italian_perplexity

cat log_file_khaling_s1 | grep -o "Validation accuracy: [0-9]\+\.[0-9]\+" | grep -o "[0-9]\+\.[0-9]\+" > khaling_valid_accuracies
cat log_file_khaling_s1 | grep -o "Step [0-9]\+" | grep -o "[0-9]\+" > khaling_steps
cat log_file_khaling_s1 | grep -o "perplexity: [0-9]\+\.[0-9]\+" | grep -o "[0-9]\+\.[0-9]\+" > khaling_perplexity

cat log_file_navajo_s1 | grep -o "Validation accuracy: [0-9]\+\.[0-9]\+" | grep -o "[0-9]\+\.[0-9]\+" > navajo_valid_accuracies
cat log_file_navajo_s1 | grep -o "Step [0-9]\+" | grep -o "[0-9]\+" > navajo_steps
cat log_file_navajo_s1 | grep -o "perplexity: [0-9]\+\.[0-9]\+" | grep -o "[0-9]\+\.[0-9]\+" > navajo_perplexity

cat log_file_russian_s1 | grep -o "Validation accuracy: [0-9]\+\.[0-9]\+" | grep -o "[0-9]\+\.[0-9]\+" > russian_valid_accuracies
cat log_file_russian_s1 | grep -o "Step [0-9]\+" | grep -o "[0-9]\+" > russian_steps
cat log_file_russian_s1 | grep -o "perplexity: [0-9]\+\.[0-9]\+" | grep -o "[0-9]\+\.[0-9]\+" > russian_perplexity

cat log_file_turkish_s1 | grep -o "Validation accuracy: [0-9]\+\.[0-9]\+" | grep -o "[0-9]\+\.[0-9]\+" > turkish_valid_accuracies
cat log_file_turkish_s1 | grep -o "Step [0-9]\+" | grep -o "[0-9]\+" > turkish_steps
cat log_file_turkish_s1 | grep -o "perplexity: [0-9]\+\.[0-9]\+" | grep -o "[0-9]\+\.[0-9]\+" > turkish_perplexity
