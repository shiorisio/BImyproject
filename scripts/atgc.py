#!/usr/bin/env python

def Count(seq):
    n = {}
    for c in seq:
        if c not in n:
            n[c] = 0
        n[c] += 1
    return n
seq = 'atgattcgcc'
print Count(seq)

def gccontent(seq,option):
    counts = Count(seq)
    g = counts['g']
    c = counts['c']
    n = len(seq)
    if option == 'gccontent':
        return float(g+c)/float(n)
    elif option == 'gcskew':
        return float(g-c)/float(g+c)
print 'GC content: ' + str(gccontent(seq,'gccontent'))
print 'GC skew: ' + str(gccontent(seq,'gcskew'))

'''
def gcskew(seq):
    counts = Count(seq)
    g = counts['g']
    c = counts['c']
    return float(g-c)/float(g+c)
print gcskew(seq)
'''
