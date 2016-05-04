#!/usr/bin/python

from subprocess import call

f = open('datos.dat', 'r+')


TotalTT = 0
execTime = 0
for line in f:
    if "StdDevTT" in line:
        line = line.split(",")
        for elem in line:
            if "TotalTT" in elem:
                aux = elem.split(" ")
                TotalTT = TotalTT + int(aux[2])
    if "execution" in line:
        aux = line.split(" ")
        execTime = execTime + int(aux[2])
print "TotalTT/proves " + str(TotalTT/15)
print "execTime/proves " + str(execTime/15)
