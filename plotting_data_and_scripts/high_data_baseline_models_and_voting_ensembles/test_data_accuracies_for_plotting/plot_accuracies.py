import matplotlib.pyplot as plt
import numpy as np
from matplotlib import rc
import scipy.stats

def mean_confidence_interval(data, confidence=0.95):
    a = 1.0 * np.array(data)
    n = len(a)
    m, se = np.mean(a), scipy.stats.sem(a)
    h = se * scipy.stats.t.ppf((1 + confidence) / 2., n-1)
    return m-h, m+h


with open("arabic_test_data_accuracies", "r") as arab_p_acc_file, open("finnish_test_data_accuracies", "r") as fin_p_acc_file, open("georgian_test_data_accuracies", "r") as geor_p_acc_file, \
    open("german_test_data_accuracies", "r") as ger_p_acc_file, open("hindi_test_data_accuracies", "r") as hin_p_acc_file, open("italian_test_data_accuracies", "r") as ita_p_acc_file, \
    open("khaling_test_data_accuracies", "r") as kha_p_acc_file, open("navajo_test_data_accuracies", "r") as nav_p_acc_file, open("russian_test_data_accuracies", "r") as rus_p_acc_file, \
    open("turkish_test_data_accuracies", "r") as tur_p_acc_file, open("voted_test_data_accuracies", "r") as voted_acc_file, open("weighted_voted_test_data_accuracies", "r") as weighted_voted_acc_file:

    arab_p_acc = arab_p_acc_file.readlines()
    arab_p_acc = [float(i) for i in arab_p_acc]
    fin_p_acc = fin_p_acc_file.readlines()
    fin_p_acc = [float(i) for i in fin_p_acc]
    geor_p_acc = geor_p_acc_file.readlines()
    geor_p_acc = [float(i) for i in geor_p_acc]
    ger_p_acc = ger_p_acc_file.readlines()
    ger_p_acc = [float(i) for i in ger_p_acc]
    hin_p_acc = hin_p_acc_file.readlines()
    hin_p_acc = [float(i) for i in hin_p_acc]
    ita_p_acc = ita_p_acc_file.readlines()
    ita_p_acc = [float(i) for i in ita_p_acc]
    kha_p_acc = kha_p_acc_file.readlines()
    kha_p_acc = [float(i) for i in kha_p_acc]
    nav_p_acc = nav_p_acc_file.readlines()
    nav_p_acc = [float(i) for i in nav_p_acc]
    rus_p_acc = rus_p_acc_file.readlines()
    rus_p_acc = [float(i) for i in rus_p_acc]
    tur_p_acc = tur_p_acc_file.readlines()
    tur_p_acc = [float(i) for i in tur_p_acc]
    voted_accuracies = voted_acc_file.readlines()
    voted_accuracies = [float(i) for i in voted_accuracies]
    weighted_voted_accuracies = weighted_voted_acc_file.readlines()
    weighted_voted_accuracies = [float(i) for i in weighted_voted_accuracies]


plt.rc('text', usetex=True)
plt.rc('font', family='serif')


# construct some data like what you have:
data_to_plot = [arab_p_acc, fin_p_acc, geor_p_acc, ger_p_acc, hin_p_acc, ita_p_acc, kha_p_acc, nav_p_acc, rus_p_acc, tur_p_acc]
language_names = ["Arabic", "Finnish", "Georgian", "German", "Hindi", "Italian", "Khaling", "Navajo", "Russian", "Turkish"]
num_languages = 10
x = np.arange(num_languages)

mins = np.array([min(x) for x in data_to_plot])
maxes = np.array([max(x) for x in data_to_plot])
means = np.array([np.mean(x) for x in data_to_plot])
std = np.array([np.std(x) for x in data_to_plot])

ci_mins = []
ci_maxs = []
for lang_data in data_to_plot:
    ci_min, ci_max = mean_confidence_interval(lang_data)
    ci_mins.append(ci_min)
    ci_maxs.append(ci_max)
    
    
fig, ax1 = plt.subplots()#figsize=(10, 6))

# Hide these grid behind plot objects
ax1.set_axisbelow(True)
ax1.set_title(r'\textbf{High training data}', fontsize=11)
ax1.set_ylabel(r'\textbf{Accuracy (\%)}', fontsize=11)
ax1.yaxis.grid(True, linestyle='-', which='major', color='lightgrey', alpha=0.5)
top = 100.5
bottom = 80
ax1.set_ylim(bottom, top)
ax1.set_xticks(x)
ax1.set_xticklabels(np.repeat(language_names, 1),
                    rotation=45, fontsize=10)

# For plotting standard deviation and mean
# plt.errorbar(np.arange(num_languages), means, std, fmt='ok', lw=3, ecolor='grey')

# For plotting min & max range and mean
# plt.errorbar(np.arange(num_languages), means, [means - mins, maxes - means],
             # fmt='.', ecolor='black', lw=1, solid_capstyle='projecting', capsize=5, label=r'Min \& max accuracy range and mean')
             
# For plotting 95% Confidence interval and mean           
plt.errorbar(np.arange(num_languages), means, [means - ci_mins, ci_maxs - means],
             fmt='.', ecolor='black', lw=1, solid_capstyle='projecting', capsize=5, label=r'0.95 confidence interval \& mean')

plt.xlim(-1, num_languages)
ax1.plot(x, voted_accuracies, '.', color='green', label='Majority voted output')
ax1.plot(x, weighted_voted_accuracies, '.', color='red', label='Weighted majority voted output')

plt.legend(loc=3)
plt.show()

fig.savefig("high_base_test_data_acc.pdf", bbox_inches='tight')