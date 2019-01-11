import os, sys, getopt
from statistics import mode


n_draws = 0

def most_common(lst):
    # In case of draw, raises a StatisticsError
    try:
      return mode(lst)

    # Adds one to draw count and randomly picks from the most common elements
    except:
      global n_draws
      n_draws += 1

      print("\nDraw", str(n_draws)+":\n"+''.join(str(e)[:-1].replace(" ", "")+" | " for e in lst))

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
    inputfoldername = inputfolder.split("/")[0]
    directory = os.fsencode(os.getcwd()) 
    outputs = []
    outfile = open(outputfile, "w")

    print('Input folder is:', inputfoldername)
    print('Output file is:', outputfile)
    print("\nOutput file '{}' was created in the directory '{}'.".format(outputfile, inputfoldername))
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

    print("\nAmount of draws:", str(n_draws))
    print("\nMajority voting done.\n")

if __name__ == "__main__":
   main(sys.argv[1:])

