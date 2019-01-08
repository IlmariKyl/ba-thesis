import sys, os
from sklearn.utils import resample


def main(argv):


    if len(argv) != 4:
        print("Usage: python resampler.py <source_file> <target_file> <n_samples> <n_files_to_create>")
        sys.exit(2)

    src_filepath = argv[0]
    tgt_filepath = argv[1]
    n_samples = int(argv[2])
    n_files = int(argv[3])

    src_filename = src_filepath.split('/')[-1]
    tgt_filename = tgt_filepath.split('/')[-1]

    # Create a directory for the new files
    output_dir = src_filename.split('src-')[1]+'->'+str(n_samples)

    if not os.path.exists(output_dir):
        os.mkdir(output_dir)
        print("Directory '" + output_dir + "' was created.")
    else:
        print("Directory '" + output_dir + "' already exists.")

    with open(src_filepath, 'r', encoding='utf8') as src_file, open(tgt_filepath, 'r', encoding='utf8') as tgt_file:
        src_text = [line for line in src_file]
        tgt_text = [line for line in tgt_file]


    for seed in range(1,n_files+1):

        src_out = open(output_dir+'/'+src_filename.replace(src_filename.split('-')[-1], str(n_samples))+'-resampled-s'+str(seed), 'w', encoding='utf8')
        tgt_out = open(output_dir+'/'+tgt_filename.replace(tgt_filename.split('-')[-1], str(n_samples))+'-resampled-s'+str(seed), 'w', encoding='utf8')

        src_boot = resample(src_text, replace=True, n_samples=n_samples, random_state=seed)
        tgt_boot = resample(tgt_text, replace=True, n_samples=n_samples, random_state=seed)

        for line in src_boot:
            print(line, end='', file=src_out)

        for line in tgt_boot:
            print(line, end='', file=tgt_out)

        src_out.close()
        tgt_out.close()


if __name__ == "__main__":
   main(sys.argv[1:])

    
