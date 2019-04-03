import matplotlib.pyplot as plt
from matplotlib import gridspec
import numpy as np
from matplotlib import rc


with open("arabic_valid_accuracies", "r") as arab_v_file, open("arabic_steps", "r") as arab_s_file, open("arabic_perplexity", "r") as arab_p_file, \
    open("finnish_valid_accuracies", "r") as fin_v_file, open("finnish_steps", "r") as fin_s_file, open("finnish_perplexity", "r") as fin_p_file:

    arab_valids = arab_v_file.readlines()
    arab_valids = [float(i) for i in arab_valids]
    arab_steps = arab_s_file.readlines()
    arab_steps = [float(i) for i in arab_steps]
    arab_perpxs = arab_p_file.readlines()
    arab_perpxs = [float(i) for i in arab_perpxs]

    fin_valids = fin_v_file.readlines()
    fin_valids = [float(i) for i in fin_valids]
    fin_steps = fin_s_file.readlines()
    fin_steps = [float(i) for i in fin_steps]
    fin_perpxs = fin_p_file.readlines()
    fin_perpxs = [float(i) for i in fin_perpxs]

with open("georgian_valid_accuracies", "r") as geor_v_file, open("georgian_steps", "r") as geor_s_file, open("georgian_perplexity", "r") as geor_p_file, \
    open("german_valid_accuracies", "r") as ger_v_file, open("german_steps", "r") as ger_s_file, open("german_perplexity", "r") as ger_p_file:

    geor_valids = geor_v_file.readlines()
    geor_valids = [float(i) for i in geor_valids]
    geor_steps = geor_s_file.readlines()
    geor_steps = [float(i) for i in geor_steps]
    geor_perpxs = geor_p_file.readlines()
    geor_perpxs = [float(i) for i in geor_perpxs]

    ger_valids = ger_v_file.readlines()
    ger_valids = [float(i) for i in ger_valids]
    ger_steps = ger_s_file.readlines()
    ger_steps = [float(i) for i in ger_steps]
    ger_perpxs = ger_p_file.readlines()
    ger_perpxs = [float(i) for i in ger_perpxs]

with open("hindi_valid_accuracies", "r") as hin_v_file, open("hindi_steps", "r") as hin_s_file, open("hindi_perplexity", "r") as hin_p_file, \
    open("italian_valid_accuracies", "r") as ita_v_file, open("italian_steps", "r") as ita_s_file, open("italian_perplexity", "r") as ita_p_file:

    hin_valids = hin_v_file.readlines()
    hin_valids = [float(i) for i in hin_valids]
    hin_steps = hin_s_file.readlines()
    hin_steps = [float(i) for i in hin_steps]
    hin_perpxs = hin_p_file.readlines()
    hin_perpxs = [float(i) for i in hin_perpxs]

    ita_valids = ita_v_file.readlines()
    ita_valids = [float(i) for i in ita_valids]
    ita_steps = ita_s_file.readlines()
    ita_steps = [float(i) for i in ita_steps]
    ita_perpxs = ita_p_file.readlines()
    ita_perpxs = [float(i) for i in ita_perpxs]


with open("khaling_valid_accuracies", "r") as kha_v_file, open("khaling_steps", "r") as kha_s_file, open("khaling_perplexity", "r") as kha_p_file, \
    open("navajo_valid_accuracies", "r") as nav_v_file, open("navajo_steps", "r") as nav_s_file, open("navajo_perplexity", "r") as nav_p_file:

    kha_valids = kha_v_file.readlines()
    kha_valids = [float(i) for i in kha_valids]
    kha_steps = kha_s_file.readlines()
    kha_steps = [float(i) for i in kha_steps]
    kha_perpxs = kha_p_file.readlines()
    kha_perpxs = [float(i) for i in kha_perpxs]

    nav_valids = nav_v_file.readlines()
    nav_valids = [float(i) for i in nav_valids]
    nav_steps = nav_s_file.readlines()
    nav_steps = [float(i) for i in nav_steps]
    nav_perpxs = nav_p_file.readlines()
    nav_perpxs = [float(i) for i in nav_perpxs]

with open("russian_valid_accuracies", "r") as rus_v_file, open("russian_steps", "r") as rus_s_file, open("russian_perplexity", "r") as rus_p_file, \
    open("turkish_valid_accuracies", "r") as tur_v_file, open("turkish_steps", "r") as tur_s_file, open("turkish_perplexity", "r") as tur_p_file:

    rus_valids = rus_v_file.readlines()
    rus_valids = [float(i) for i in rus_valids]
    rus_steps = rus_s_file.readlines()
    rus_steps = [float(i) for i in rus_steps]
    rus_perpxs = rus_p_file.readlines()
    rus_perpxs = [float(i) for i in rus_perpxs]

    tur_valids = tur_v_file.readlines()
    tur_valids = [float(i) for i in tur_valids]
    tur_steps = tur_s_file.readlines()
    tur_steps = [float(i) for i in tur_steps]
    tur_perpxs = tur_p_file.readlines()
    tur_perpxs = [float(i) for i in tur_perpxs]

plt.rc('text', usetex=True)
plt.rc('font', family='serif')

fig = plt.figure()#figsize=(12,14))
gs = gridspec.GridSpec(2, 1, height_ratios=[1, 1])


ax0 = plt.subplot(gs[0])
ax0.set_title(r'\textbf{High training data}', fontsize=11)

# plt.figure(1, figsize=(30,10))
line0, = ax0.plot(arab_steps, arab_valids, color='blue', linewidth=0.5, label='Arabic')
line1, = ax0.plot(fin_steps, fin_valids, color='red', linewidth=0.5, label='Finnish')
line2, = ax0.plot(geor_steps, geor_valids, color='black', linewidth=0.5, label='Georgian')
line3, = ax0.plot(ger_steps, ger_valids, color='green', linewidth=0.5, label='German')
line4, = ax0.plot(hin_steps, hin_valids, color='yellow', linewidth=0.5, label='Hindi')
line5, = ax0.plot(ita_steps, ita_valids, color='lime', linewidth=0.5, label='Italian')
line6, = ax0.plot(kha_steps, kha_valids, color='orange', linewidth=0.5, label='Khaling')
line7, = ax0.plot(nav_steps, nav_valids, color='cadetblue', linewidth=0.5, label='Navajo')
line8, = ax0.plot(rus_steps, rus_valids, color='grey', linewidth=0.5, label='Russian')
line9, = ax0.plot(tur_steps, tur_valids, color='brown', linewidth=0.5, label='Turkish')


ax0.xaxis.grid(True, linestyle='-', which='major', color='lightgrey', alpha=0.5)
plt.ylabel(r'\textbf{Validation accuracy (\%)}', fontsize=9)
ax0.legend(loc=4, prop={'size': 6})

ax1 = plt.subplot(gs[1], sharex = ax0)

# plt.figure(2, figsize=(20,10), )
line10, = ax1.plot(arab_steps, arab_perpxs, color='blue', linewidth=0.5, label='Arabic')
line11, = ax1.plot(fin_steps, fin_perpxs, color='red', linewidth=0.5, label='Finnish')
line12, = ax1.plot(geor_steps, geor_perpxs, color='black', linewidth=0.5, label='Georgian')
line13, = ax1.plot(ger_steps, ger_perpxs, color='green', linewidth=0.5, label='German')
line14, = ax1.plot(hin_steps, hin_perpxs, color='yellow', linewidth=0.5, label='Hindi')
line15, = ax1.plot(ita_steps, ita_perpxs, color='lime', linewidth=0.5, label='Italian')
line16, = ax1.plot(kha_steps, kha_perpxs, color='orange', linewidth=0.5, label='Khaling')
line17, = ax1.plot(nav_steps, nav_perpxs, color='cadetblue', linewidth=0.5, label='Navajo')
line18, = ax1.plot(rus_steps, rus_perpxs, color='grey', linewidth=0.5, label='Russian')
line19, = ax1.plot(tur_steps, tur_perpxs, color='brown', linewidth=0.5, label='Turkish')
plt.yticks(np.arange(0, 12, 1.0))
plt.xticks(np.arange(0, 12500, 1000))
plt.xlabel(r'\textbf{Steps}', fontsize=9)
plt.ylabel(r'\textbf{Perplexity}', fontsize=9)
ax1.set_ylim(0, 12)
plt.xlim(50, 12550)
# ax1.legend()#loc=1)#, prop={'size': 12})
# plt.ylim(0, 12)
ax1.xaxis.grid(True, linestyle='-', which='major', color='lightgrey', alpha=0.5)
plt.subplots_adjust(hspace=.0)

plt.show()

fig.savefig("devloss_high_plot.pdf", bbox_inches='tight')