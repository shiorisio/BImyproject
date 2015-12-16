# ---------------------
# Name: Shiori Hikichi
# Last Update: 2015-12-16
# ---------------------

#!/bin/bash
set -euo pipefail

#cd ../scripts
#python atgc.py

cd ../../ncbiGenomeList

echo "Kingdom"
#grep -v "^#" data/overview.txt | cut -f2 | sort | uniq -c > ../BImyproject/analysis/kingdom.txt
grep -v "^#" data/overview.csv | cut -d, -f2 | sort | uniq -c
tr '  ' ',' <../BImyproject/analysis/kingdom.txt> ../BImyproject/analysis/kingdom.csv
echo $'\nBacteria'
#grep "Bacteria" data/overview.txt | cut -f3,4 | sort | uniq -c > ../BImyproject/analysis/bacteria.txt
grep "Bacteria" data/overview.csv | cut -d, -f3,4 | sort | uniq -c
#tr '  ' ',' <../BImyproject/analysis/bacteria.txt> ../BImyproject/analysis/bacteria.csv
