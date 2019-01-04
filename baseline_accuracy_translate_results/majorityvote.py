import os, sys, getopt


def most_common(lst):
    return max(set(lst), key=lst.count)

def main(argv):

    if len(argv) != 4:
        print("Usage: python majorityvote.py -i <inputfolder> -o <outputfile>")
        sys.exit(2)
        
    inputfolder = ''
    outputfile = ''
    try:
      opts, args = getopt.getopt(argv,"hi:o:",["ifile=","ofile="])
    except getopt.GetoptError:
      print("Usage: python majorityvote.py -i <inputfolder> -o <outputfile>")
      sys.exit(2)
    for opt, arg in opts:
      if opt == '-h':
         print("python majorityvote.py -i <inputfolder> -o <outputfile>")
         sys.exit()
      elif opt in ("-i", "--ifile"):
         inputfolder = arg
      elif opt in ("-o", "--ofile"):
         outputfile = arg
         
    os.chdir(inputfolder)
    directory = os.fsencode(os.getcwd()) 
    outputs = []
    outfile = open(outputfile, "w")

    print('Input folder is:', inputfolder.split("/")[0])
    print('Output file is:', outputfile)
    print("\nOutput file '{}' was created in the directory '{}'.".format(outputfile, inputfolder.split("/")[0]))
    print("\nMajority voting is done with following files:")

    for file in os.listdir(directory):
        filename = os.fsdecode(file)
        
        if filename.startswith("pred_") and not os.path.isdir(filename):
            print(filename)
            with open(filename,"r", encoding = "utf8") as infile:
                outputs.append(infile.readlines())

    for line in zip(*outputs):
        outfile.write(most_common(line))

    outfile.close()

    print("\nDone.")

if __name__ == "__main__":
   main(sys.argv[1:])
