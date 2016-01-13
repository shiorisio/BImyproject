-----------------------  

Last Update: 2016-1-13

-----------------------

## BI My Project

Project started 2015-12-15.

### Overview of this project

- Checking the diversity of bacteria (e.g. Species, count)
- Checking the feature of bacteria (e.g. Size, GC%, Genes, Proteins)

### Project directories

    BImyproject/
      README.md: project documentation
      data/: contains all raw and intermediate data
      scripts/: contains general project-wide scripts
      analysis/: contains results of data analyses by python program

    ncbiGenomeList/
      data/: contains all raw and intermediate data
      analysis/: contains results of data analyses by unix commands

### Data

Data downloaded on 2015-12-09 from ftp://ftp.ncbi.nlm.nih.gov/genomes/GENOME_REPORTS/ into ../ncbiGenomeList/data/:

    data/README
    data/overview.txt
    data/eukaryotes.txt
    data/prokaryotes.txt
    data/prok_reference_genomes.txt
    data/prok_representative_genomes.txt
    data/plasmids.txt
    data/viruses.txt
    data/overview.csv:
      tr '\t' ',' <overview.txt> overview.csv
    data/prokaryotes.csv
    data/prokaryotes_r.txt:
      cut -f1,5-6,8 prokaryotes.txt > prokaryotes_r.txt
    data/prokaryotes_r.csv:
      tr '\t' ',' <prokaryotes_r.txt> prokaryotes_r.csv


### Scripts

    scripts/run.sh: project program implementation
    scripts/atgc.py: GC content / GC skew check python program
    scripts/MyBIanalysis.py: metadata count python program
    scripts/GCcheck.R: GC (%) check program

### Usage

In the BImyproject/script/ directory, we run the shell script run.sh with:  

    chmod a+x run.sh (consulting this process only one time)
    ./run.sh

### Progress of this project
- 2016-1-13
  - Revised script scripts/run.sh not to return error. (prokaryotes_r.txt: No such file or directory)
  - Included R program for checking GC contents in run.sh
  - Revised R program using prokaryotes.txt
  - For assessment of reproducibility, other student in this class (B3 Oyama) executed scripts/run.sh -> Some error is returned. (output file is output_oyama.txt)
    - File name error -> Revised ncbiGenomeList-master to ncbiGenomeList
    - Python module error

- 2016-1-6
  - Revised script scripts/MyBIanalysis.py to confirm the metadata count of bacteria (genus)
        cd ../BImyproject/scripts
        cut -f1,5-6,8 ../../ncbiGenomeList/data/prokaryotes.txt > ../../ncbiGenomeList/data/prokaryotes_r.txt
        tr '\t' ',' <prokaryotes_r.txt> prokaryotes_r.csv
        python MyBIanalysis.py ../../ncbiGenomeList/data/prokaryotes_r.csv
  - Created analysis/2016-1-6/input_top10_bacteria_(genus)_count.png and genus_count_output.jpg
  - Future works: mean/meadian GC% (genome size(Mb)) in each bacteria (genus) shows as box plots.


- 2015-12-31
  - revised scripts/MyBIanalysis.py to confirm the repeatability.
  - The last version of scripts/MyBIanalysis.py only can check the diversity of Kingdom (analysis/input_kingdom_count.png), but this improvement also can check the diversity of bacteria (genus).
  - The kinds of bacteria (Genus) is too much to show the result in bar graph. Therefore, analysis/input_top10_bacteria_(genus)_count.png shows the top 10 bacteria data.
  - In each case of Kingdom/Bacteria(Genus), we can obtain the same results of metadata count.
        cd analysis/
         input_kingdom_count_151231.png
         input_kingdom_count_20151221.png
         input_top10_bacteria_(genus)_count151231.png
         input_top10_bacteria_(genus)_count_151231_2.png

- 2015-12-21
  - made .csv file (data/overview_size.csv)
        awk -F "\t" '{ print $2 "," $3 "," $4 "," $5 }' data/overview.txt > data/overview_size.csv
  - checked the Kingdom overview of ncbiGenomeList
  - made the python file (scripts/MyBIanalysis.py) to count number of metadata and made the bar graph (analysis/input_kingdom_count.png)
  - scripts/MyBIanalysis.py can make bar graphs of metadata counts depending on  Bacteria(Genus) and Bacteria(Species), but we cannot make the bar graph because Bacteria data has many species. Therefore, this bar graphs should show top 10 bacteria data.

- 2015-12-16
  - checked the overview of ncbiGenomeList
  - made the .csv file of ncbiGenomeList as ncbiGenomeList/data/overview.csv

- 2015-12-15
  - made the directory as BImyproject

### References

- Relationship between genome size and GC content for sequenced Bacterial and Archaeal genomes. http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2704378/figure/pgen-1000565-g001/
- GC content check program: https://github.com/haruosuz/ncbiGenomeList/blob/master/scripts/run.sh
- Ref 3
