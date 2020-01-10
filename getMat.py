import sys
import os
import numpy as np
import pandas as pd


def read_gc(gc_file):
    ifile = open(gc_file)
    d = {}
    for line in ifile:
        tmp = line.strip().split("\t")
        ID = tmp[3]
        if tmp[5] == "+":
            pos = int(tmp[7]) - int(tmp[1])
        elif tmp[5] == "-":
            pos = int(tmp[2]) - int(tmp[8])
        cov = int(tmp[9])
        try:
            # add up the cov
            d[ID][pos] += cov
        except KeyError:
            d[ID] = np.zeros(int(tmp[2])-int(tmp[1]))
            d[ID][pos] += cov
    ifile.close()
    return d


def write_mat(d,output):
    ofile = open(output,'w')
    for key in d:
        vec = list(d[key])
        ofile.write(key+"\t"+"\t".join(list(map(str,vec)))+"\n")
    ofile.close()

def main(gc_file,output):
    d = read_gc(gc_file)
    write_mat(d,output)


args = sys.argv
main(args[1],args[2])


