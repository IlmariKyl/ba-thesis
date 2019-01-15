import os, sys, getopt, itertools
from statistics import mode


n_draws = 0
n_weighted_draws = 0
weighted_draws = []

def most_common(lst):
    # In case of draw, raises a StatisticsError
    try:
      return mode(lst)

    # Adds one to draw count and randomly picks from the most common elements
    except:
      global n_draws
      n_draws += 1
      # print("\nDraw", str(n_draws)+":\n"+''.join(str(e)[:-1].replace(" ", "")+" | " for e in lst))
      print(''.join(str(e)[:-1].replace(" ", "")+" | " for e in lst)+"\n")

      return max(set(lst), key=lst.count)


def most_common_weighted(lst):
    
    summed_weights = [(sum(i[1] for i in group), key) for key, group in itertools.groupby(sorted(lst, key = lambda i: i[0]), lambda i: i[0])]
    dict_summed_weights = dict([(v,k) for k,v in summed_weights])
    max_candidates = [k for k,v in dict_summed_weights.items() if v == max(summed_weights)[0]]

    if len(max_candidates) > 1:
        global n_weighted_draws
        global weighted_draws
        weighted_draws.append(max_candidates)
        n_weighted_draws += 1

    return str(max(summed_weights)[1])


def main(argv):

    if len(argv) != 3:
        print("Usage: python majorityvote.py <inputfolder> <outputfile> <weighted_outputfile>")
        sys.exit(2)
    
    inputfolder = argv[0]
    outputfile1 = argv[1]
    outputfile2 = argv[2]
         
    os.chdir(inputfolder)
    inputfoldername = inputfolder.split("/")[0]
    directory = os.fsencode(os.getcwd()) 
    outputs = []
    weights_str = []
    outfile1 = open(outputfile1, "w")
    outfile2 = open(outputfile2, "w")

    print('Input folder:', inputfoldername)
    print("Output files '{}' & '{}' were created in the directory '{}'.".format(outputfile1, outputfile2, inputfoldername))
    print("\nMajority voting is done with following files:")

    for file in os.listdir(directory):
        filename = os.fsdecode(file)
        
        if filename.startswith("pred_") and not os.path.isdir(filename):
            print(filename)
            with open(filename,"r", encoding = "utf8") as infile, open("acc_"+filename,"r", encoding = "utf8") as acc_infile:
                outputs.append(infile.readlines())
                weights_str.append(acc_infile.readline())

    print("\nDraws in normal majority voting:\n")
    weights = [float(i) for i in weights_str]

    for line in zip(*outputs):
        outfile1.write(most_common(line))
        outfile2.write(most_common_weighted(zip(line, weights)))        

    outfile1.close()
    outfile2.close()

    print("\nDraws in weighted majority voting:", weighted_draws)
    print("\nAmount of draws in normal voting:", str(n_draws))
    print("Amount of draws in weighted voting:", str(n_weighted_draws))
    print("\n\nAccuracies:\n")

if __name__ == "__main__":
   main(sys.argv[1:])


