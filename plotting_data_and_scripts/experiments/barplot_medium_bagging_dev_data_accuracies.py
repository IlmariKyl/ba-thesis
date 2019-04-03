import numpy as np
import matplotlib.pyplot as plt
import sys


def main(argv):
    
    if len(argv) != 4:
        print("Usage: python plot_dev_data_ccuracies.py <acc_file1> <acc_file2> <acc_file3> <acc_file4>")
        sys.exit(2)
    
    acc_file1 = argv[0]
    acc_file2 = argv[1]
    acc_file3 = argv[2]
    acc_file4 = argv[3]

    with open(acc_file1, 'r') as v_file1, open(acc_file2, 'r') as wv_file1, open(acc_file3, 'r') as v_file2, open(acc_file4, 'r') as wv_file2:
        voted_acc1 = v_file1.readlines()
        voted_acc1 = [float(i) for i in voted_acc1]
        weighted_voted_acc1 = wv_file1.readlines()
        weighted_voted_acc1 = [float(i) for i in weighted_voted_acc1]
        
        voted_acc2 = v_file2.readlines()
        voted_acc2 = [float(i) for i in voted_acc2]
        weighted_voted_acc2 = wv_file2.readlines()
        weighted_voted_acc2 = [float(i) for i in weighted_voted_acc2]
        
        
    plt.rc('text', usetex=True)
    plt.rc('font', family='serif')
        
        
    fig, ax1 = plt.subplots()
    
    ax1.set_axisbelow(True)
    ax1.set_title(r'\textbf{Medium training data}', fontsize=11)
    ax1.set_ylabel(r'\textbf{Accuracy (\%)}', fontsize=11)
    ax1.yaxis.grid(True, linestyle='-', which='major', color='lightgrey', alpha=0.5)
    

    data = [voted_acc1, weighted_voted_acc1, voted_acc2, weighted_voted_acc2]
    language_names = ["Arabic", "Finnish", "Georgian", "German", "Hindi", "Italian", "Khaling", "Navajo", "Russian", "Turkish"]
    x = np.arange(start=0.30, step=1, stop=12)
    
    top = 100.3
    bottom = 40
    plt.yticks(np.arange(bottom, top, 5))
    ax1.set_ylim(bottom, top)
    
    
    ax1.set_xticks(x)
    
    labels = ["MV 10 models", "WMV 10 models", "MV 100 models", "WMV 100 models"]
    
    ax1.set_xticklabels(np.repeat(language_names, 1),
                        rotation=45, fontsize=9)

    color_list = ['#59ea9f', '#369363', '#53aee2', '#346f91']
    gap = .8 / len(data)
    for i, row in enumerate(data):
      X = np.arange(len(row))
      plt.bar(X + i * gap, row,
        width = gap,
        color = color_list[i % len(color_list)],
        label = labels[i])
    
    
    plt.legend(loc=3, prop={'size': 6})
    plt.show()
    
    fig.savefig("barplot_medium_training_data_dev_accuracies.pdf", bbox_inches='tight')
    
    
if __name__ == "__main__":
   main(sys.argv[1:])