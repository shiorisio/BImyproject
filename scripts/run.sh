# -----------------------

# Last Update: 2015-12-21

# -----------------------

#!/bin/bash
set -euo pipefail

#cd ../scripts
#python atgc.py

cd ../../ncbiGenomeList
#awk -F "\t" '{ print $2 "," $3 "," $4 "," $5 }' data/overview.txt > data/overview_size.csv

echo "Kingdom"
#grep -v "^#" data/overview.txt | cut -f2 | sort | uniq -c > ../BImyproject/analysis/kingdom.txt
grep -v "^#" data/overview.csv | cut -d, -f2 | sort | uniq -c | awk '{ print $0,$1 }'
#tr '  ' ',' <../BImyproject/analysis/kingdom.txt> ../BImyproject/analysis/kingdom.csv
echo $'\nBacteria (Genus)'
#grep "Bacteria" data/overview.txt | cut -f3,4 | sort | uniq -c > ../BImyproject/analysis/bacteria.txt
grep "Bacteria" data/overview.csv | cut -d, -f3 | sort | uniq -c
#tr '  ' ',' <../BImyproject/analysis/bacteria.txt> ../BImyproject/analysis/bacteria.csv
echo $'\nBacteria (Species)'
grep "Bacteria" data/overview.csv | cut -d, -f3,4 | sort | uniq -c

cd ../BImyproject/scripts
python MyBIanalysis.py ../../ncbiGenomeList/data/overview_size.csv
