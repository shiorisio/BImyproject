#!/usr/bin/env python

# -----------------------
# Last Update: 2016-1-20
# -----------------------

import os,commands,csv,sqlite3
from sys import argv
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

def help():
    '''help message'''
    print ""
    #print "Usage: %s [input_file]" %argv[0]
    print "Usage: %s [program_file]" %argv[0]
    print "Usage: %s [csv_file]" %argv[1]
    print ""
    print "This command eliminates something... in the input file."
    sys.exit(1)

def MyBIanalysis(anInputFile):

    anFile1List = []

    with open(anInputFile, "r") as File1:
        anReader1 = csv.reader(File1)
        anHeader1Str = next(anReader1)
        for row in anReader1:
            if len(row) == 4:
                anFile1List.append(row)

    SQLdataArray = np.array(anFile1List)

# sql data

#    SQLdataArray = np.c_[anFile1Array]
#    print SQLdataArray

# sqlite create table/ insert value

    conn = sqlite3.connect(":memory:")
    c = conn.cursor()
    c.execute('''DROP TABLE IF EXISTS MyBIanalysisDB;''')
    c.execute('''CREATE TABLE MyBIanalysisDB(
        Kingdom text,
        Groupname text,
        SubGroupname text,
        Size_Mb float
        );''')

# sqlite insert

    def sqlinsert(table_name,data):
        for row in data:
            ph = "?," * (len(row) - 1) + "?"
            conn.execute("INSERT INTO %(table_name)s VALUES(%(ph)s)" % locals(), tuple(row))
    sqlinsert("MyBIanalysisDB", SQLdataArray)

#    c.execute("SELECT Kingdom,COUNT(*) FROM MyBIanalysisDB GROUP BY Kingdom;")
#    print "\n===== Input Kingdom count ====="
#    InputKingdomList = []
#    for row in c:
#        InputKingdomList.append([str(unicode(row[0])),row[1]])
#        print str(unicode(row[0])) + ", " + str(row[1])

    c.execute("SELECT Groupname,COUNT(*) FROM MyBIanalysisDB GROUP BY Groupname;")
    print "\n===== Input Groupname count ====="
    InputGroupnameList = []
    for row in c:
        InputGroupnameList.append([str(unicode(row[0])),row[1]])
        print str(unicode(row[0])) + ", " + str(row[1])
    InputGroupnameList.sort(key=lambda x:(x[1]))
    InputGroupnameList.reverse()

    Top10GroupnameList = []
    for a in range(0,10):
        Top10GroupnameList.append(InputGroupnameList[a])

    def bargraphfunction(xyList):
        xList = []
        xnameList = []
        yList = []
        xele = 0
        for a in range(0,len(xyList)):
            xList.append(xele)
            xele += 0.5
            xnameList.append(xyList[a][0])
            yList.append(xyList[a][1])
        plt.bar(xList,yList,width=0.4,align="center")
        plt.ylabel("Number of metadata",fontsize=18)
        plt.xticks(xList,xnameList,rotation=90,fontsize='medium')
        plt.yticks(fontsize=15)

    '''
    plt.figure('Input Kingdom count')
    plt.xlabel("Kingdom",fontsize=18)
    bargraphfunction(InputKingdomList)
    '''

    fig = plt.figure('Input Top10 Bacteria (phylum) count')
    plt.xlabel("Bacteria (phylum)",fontsize=18)
    bargraphfunction(Top10GroupnameList)
    fig.tight_layout()
    fig.savefig('../analysis/MyBIanalysisoutput.png')


    '''
    print "Kingdom"
    #a = commands.getoutput('pwd')
    os.system('pwd')
    os.chdir("../../ncbiGenomeList/data/")
    os.system('grep -v "^#" overview.csv | cut -d, -f2 | sort | uniq -c')
    a = commands.getoutput('grep -v "^#" overview.csv | cut -d, -f2 | sort | uniq -c')
    print "ans\n" + str(a)
    '''

if __name__=='__main__':
    if len(argv)!=2:
        help()
    MyBIanalysis(argv[1])
    #plt.show()
