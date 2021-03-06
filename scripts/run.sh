# -----------------------

# Last Update: 2016-1-23

# -----------------------

#!/bin/bash
set -euo pipefail

uname -a

cd ../
#python atgc.py

# Downloading data
wget -P data/ ftp://ftp.ncbi.nlm.nih.gov/genomes/GENOME_REPORTS/prokaryotes.txt
# Alternatively, you can use:
#curl ftp://ftp.ncbi.nlm.nih.gov/genomes/GENOME_REPORTS/prokaryotes.txt > data/prokaryotes.txt

#cd ../../ncbiGenomeList/
#awk -F "\t" '{ print $2 "," $3 "," $4 "," $5 }' data/overview.txt > data/overview_size.csv

#if [ ! -e data/overview.csv ]; then
#tr '\t' ',' <data/overview.txt> data/overview.csv
#fi

#echo "Kingdom"
#grep -v "^#" data/overview.csv | cut -d, -f2 | sort | uniq -c | awk '{ print $0,$1 }'
#echo $'\nBacteria (Phylum)'
#grep "Bacteria" data/overview.csv | cut -d, -f3 | sort | uniq -c
#echo $'\nBacteria (Species)'
#grep "Bacteria" data/overview.csv | cut -d, -f3,4 | sort | uniq -c

#cd ../BImyproject/scripts
#python MyBIanalysis.py ../data/overview_size.csv

cd data/

if [ ! -e prokaryotes_r.csv ]; then
touch prokaryotes_r.txt
cut -f1,5-6,8 prokaryotes.txt > prokaryotes_r.txt
tr '\t' ',' <prokaryotes_r.txt> prokaryotes_r.csv
fi

#cd ../../BImyproject/scripts
#python MyBIanalysis.py ../../ncbiGenomeList/data/prokaryotes_r.csv

cd ../analysis
if [ ! -e `date '+%Y-%m-%d'` ]; then
  mkdir `date '+%Y-%m-%d'`
fi

cd ../scripts
python MyBIanalysis.py ../data/prokaryotes_r.csv

#cd ../../ncbiGenomeList/
#Rscript --vanilla ../BImyproject/scripts/GCcheck.R
cd ../analysis/`date '+%Y-%m-%d'`/
Rscript --vanilla ../../scripts/GCcheck.R

#cd ../analysis
#mv GCcheckoutput.pdf $(date +%F)/
#mv MyBIanalysisoutput.png $(date +%F)/


#cd ../../ncbiGenomeList/
#tr '\t' ',' <data/prokaryotes.txt> data/prokaryotes.csv
#NAME="ssRNA viruses"
#grep -ic $NAME data/*.txt
#grep -i $NAME data/prokaryotes.txt | cut -f6 | sort | uniq -c | sort -n
#head -1 data/prokaryotes.txt | cut -f1,5-8,15,16,19 > analysis/output.txt
#grep -i $NAME data/prokaryotes.txt | cut -f1,5-8,15,16,19 >> analysis/output.txt
#head -n 10 analysis/output.txt

#NAME="Firmicutes"
#grep -ic $NAME data/*.txt
#grep -i $NAME data/prokaryotes.txt | cut -f6 | sort | uniq -c | sort -n
#head -1 data/prokaryotes.txt | cut -f1,5-8,15,16,19 > analysis/output_firmicutes.txt
#grep -i $NAME data/prokaryotes.txt | cut -f1,5-8,15,16,19 >> analysis/output_firmicutes.txt
#head -n 10 analysis/output_firmicutes.txt
