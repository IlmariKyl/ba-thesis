import matplotlib.pyplot as plt
import numpy as np
from matplotlib import rc
import sys, os 
    
def main(argv):
    
    if len(argv) != 3:
        print("Usage: python plot_dev_data_ccuracies.py <acc_file1> <acc_file2> <exp_num>")
        sys.exit(2)
    
    acc_file1 = argv[0]
    acc_file2 = argv[1]
    exp_num = str(argv[2])

    with open(acc_file1, 'r') as v_file, open(acc_file2, 'r') as wv_file:
        voted_acc = v_file.readlines()
        voted_acc = [float(i) for i in voted_acc]

        weighted_voted_acc = wv_file.readlines()
        weighted_voted_acc = [float(i) for i in weighted_voted_acc]

    plt.rc('text', usetex=True)
    plt.rc('font', family='serif')
        
    fig, ax1 = plt.subplots()#figsize=(12, 9))

    language_names = ["Arabic", "Finnish", "Georgian", "German", "Hindi", "Italian", "Khaling", "Navajo", "Russian", "Turkish"]
    x = np.arange(10)

    ax1.set_axisbelow(True)
    ax1.set_title(r'\textbf{Experiment '+exp_num+'}', fontsize=11)
    ax1.set_ylabel(r'\textbf{Accuracy (\%)}', fontsize=11)
    ax1.yaxis.grid(True, linestyle='-', which='major', color='lightgrey', alpha=0.5)
    top = 100.5
    bottom = 80
    plt.yticks(np.arange(bottom, top, 2.5))
    ax1.set_ylim(bottom, top)
    ax1.set_xticks(x)
    ax1.set_xticklabels(np.repeat(language_names, 1),
                        rotation=45, fontsize=9)

    ax1.plot(x, voted_acc, '.', color='green', label='Majority voted output')
    ax1.plot(x, weighted_voted_acc, '.', color='red', label='Weighted majority voted output')

    # Annotate values
    # for i, value in enumerate(voted_acc):
    #     ax1.text(i+0.1, value-0.1, value, transform=ax1.transData)

    # for i, value in enumerate(weighted_voted_acc):
    #     ax1.text(i-0.45, value-0.1, value, transform=ax1.transData)

    plt.legend(loc=3)

    plt.show()
    fig.savefig(acc_file1[:5]+acc_file1.split('_')[-3]+"_acc.pdf", bbox_inches='tight')
    
if __name__ == "__main__":
   main(sys.argv[1:])