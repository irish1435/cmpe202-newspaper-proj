#!/usr/bin/env python
# plot already normalized data
# first column is time stamp
#plot-normalized.py taken from PMU-tools
import csv
import matplotlib.pyplot as plt
import sys
import argparse

ap = argparse.ArgumentParser(usage='Plot already normalized CSV data')
ap.add_argument('--output', '-o', help='Output to file. Otherwise show.',
                nargs='?')
ap.add_argument('inf', nargs='?', default=sys.stdin, type=argparse.FileType('r'),
                help='input CSV file')
args = ap.parse_args()

inf = args.inf

rc = csv.reader(inf)

num = 0
timestamps = []
columns = dict()
for r in rc:
    num += 1
    if num == 1:
        for j in r[1:]:
            columns[j] = []
        continue
    timestamps.append(r[0])
    c = 1
    for j in columns:
        try:
            columns[j].append(float(r[c]))
        except ValueError:
            columns[j].append(float('nan'))
        c += 1

#edit PMU-tools plot-normalized.py to get IPC

IPC = []
for j, k in zip(columns['instructions'],columns['cycles']):
    if(j==0):
        IPC.append(IPC[-1])
        continue
    else:
        ipc_val = float(k)/float(j)
        IPC.append(ipc_val)

plt.plot(timestamps,IPC,'g-',label='IPC')
plt.title('Time vs Instructions per Cycle')
plt.xlabel('Seconds')
plt.ylabel('IPC')
leg = plt.legend()
leg.get_frame().set_alpha(0.5)

if args.output:
    plt.savefig(args.output)
    #plt.show()
else:
    plt.show()