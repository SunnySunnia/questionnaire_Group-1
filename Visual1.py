# -*- coding: utf-8 -*-
# <nbformat>3.0</nbformat>

# <codecell>

import numpy as np  
import pandas as pd
from pylab import *
import matplotlib
import matplotlib.pyplot
import matplotlib.pyplot as plt
from matplotlib.backends.backend_agg import FigureCanvasAgg as fc

# <codecell>

%pylab inline

# <codecell>

import csv

# <codecell>

csvf = open("counts.csv", "r")
data = list(csv.reader(csvf))

# <codecell>

n=[]
Visual = []
Aural=[]
RorW=[]
Kines=[]
for row in data[1:]:
    n.append(row[0])
    Visual.append(row[1])
    Aural.append(row[2])
    RorW.append(row[3])
    Kines.append(row[4])
print n,Visual,Aural,RorW,Kines

# <codecell>

for i in range(0,16):
    Visual[i]=int(Visual[i])
for i in range(0,16):
    Aural[i]=int(Aural[i])
for i in range(0,16):
    RorW[i]=int(RorW[i])
for i in range(0,16):
    Kines[i]=int(Kines[i])
for i in range(0,16):
    n[i]=int(n[i])
print Visual, Aural, RorW, Kines, n

# <codecell>

fig, axes = plt.subplots(1, 4, figsize=(12,3))
axes[0].bar(n, Visual, align="center", width=0.5, alpha=0.5)
axes[0].set_xlabel('Visual')
axes[1].bar(n, Aural, align="center", width=0.5, alpha=0.5,color='r')
axes[1].set_xlabel('Aural')
axes[1].set_title("Summaries of")
axes[2].bar(n, RorW, align="center", width=0.5, alpha=0.5,color='green')
axes[2].set_xlabel('Read/Write')
axes[2].set_title("Learning Styles")
axes[3].bar(n, Kines, align="center", width=0.5, alpha=0.5,color='purple')
axes[3].set_xlabel('Kinesthetic');

# <codecell>

prop = open("frac.csv", "r")
frac = list(csv.reader(prop))
print frac

# <codecell>

import ast

# <codecell>

proportion=[]
for row in frac[1:]:
    proportion.append(row[1])
for i in range(0,4):
    proportion[i]=ast.literal_eval(proportion[i])
print proportion

# <codecell>

mylabels=['Visual', 'Aural', 'Read/Write', 'Kinesthetic']
mycolors=['blue', 'red', 'green', 'purple']
pie(proportion,labels=mylabels,colors=mycolors,autopct='%1.1f%%', shadow=True, startangle=90)
title('Class Proportion of each Learning Styles', bbox={'facecolor':'0.8', 'pad':5});

# <codecell>

personal = open("perexp.csv", "r")
perexp = list(csv.reader(personal))
print perexp

# <codecell>

nn=[]
perlabels = []
cts=[]
for row in perexp[1:]:
    nn.append(int(row[0]))
    perlabels.append(row[1])
    cts.append(int(row[2]))
print nn, perlabels, cts

# <codecell>

fig, ax = plt.subplots()
ax.bar(nn, cts, align="center", width=0.5, alpha=0.5,color='grey')
ax.set_title("Where did you gain Personal Experiences")
ax.set_xlabel("Categories")
ax.set_ylabel("Counts");
#unable to add legends
# 1:Friends or Family
# 2:Projects
# 3:Jobs or Internships
# 4:Classes
# 5:Interests or Curiosity
# 6:Other

# <codecell>


