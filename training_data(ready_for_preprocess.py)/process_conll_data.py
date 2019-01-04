import os, re, sys


def main(argv):

    if len(argv) != 1:
        print("Usage: python process_data.py <data_folder>")
        sys.exit(2)

    data_root_dir = os.getcwd()

    # Create 'processed_data' directory if doesn't already exist
    res_dir_name = 'processed_training_data'

    if not os.path.exists(res_dir_name):
        os.mkdir(res_dir_name)
        print("Directory '" + res_dir_name + "' was created.\n")
    else:
        print("Directory '" + res_dir_name + "' already exists.\n")

    os.chdir(argv[0])
    directory = os.fsencode(os.getcwd())
    print("Processing data in directory '"+argv[0].split("/")[0]+"'..." )

    for file in os.listdir(directory):
        linecount = 0
        infilename = os.fsdecode(file)
        src_outfilename = data_root_dir+"/processed_training_data/"+"src-"+infilename
        tgt_outfilename = data_root_dir+"/processed_training_data/tgt-"+infilename

        with open(infilename,"r", encoding='utf-8') as infile, \
         open(src_outfilename, 'w', encoding='utf-8') as src_outfile, \
         open(tgt_outfilename, 'w', encoding='utf-8') as tgt_outfile:

            for line in infile:
                linecount += 1
                src_line = " ".join(str(line.split("\t")[0])) + " +" + re.sub(";", " +", line.split("\t")[2] + "\n")
                src_line = re.sub("   ", " <SPACE> ", src_line)
                src_outfile.write(src_line[:-1])
                tgt_line = " ".join(line.split("\t")[1])
                tgt_line = re.sub("   ", " <SPACE> ", tgt_line)
                tgt_outfile.write(tgt_line + "\n")

        os.rename(src_outfilename, src_outfilename+'-'+str(linecount))
        os.rename(tgt_outfilename, tgt_outfilename+'-'+str(linecount))
    print("\nDone.")
    

if __name__ == "__main__":
   main(sys.argv[1:])