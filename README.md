-----------------------  

Last Update: 2015-12-21

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
      analysis/: contains results of data analyses

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
    data/overview.csv


### Scripts

    scripts/run.sh: project program implementation
    scripts/atgc.py: GC content / GC skew check python program
    scripts/MyBIanalysis.py: metadata count python program

### Usage

In the BImyproject/script/ directory, we run the shell script run.sh with:  

    chmod a+x run.sh (consulting this process only one time)
    ./run.sh

### Progress of this project
- 2015-12-15
  - made the directory as BImyproject

- 2015-12-16
  - checked the overview of ncbiGenomeList
  - made the .csv file of ncbiGenomeList as ncbiGenomeList/data/overview.csv

- 2015-12-21
  - made .csv file (data/overview_size.csv)
        awk -F "\t" '{ print $2 "," $3 "," $4 "," $5 }' data/overview.txt > data/overview_size.csv
  - checked the Kingdom overview of ncbiGenomeList
  - made the python file (scripts/MyBIanalysis.py) to count number of metadata and made the bar graph (analysis/input_kingdom_count.png)
  - scripts/MyBIanalysis.py can make bar graphs of metadata counts depending on  Bacteria(Genus) and Bacteria(Species), but we cannot make the bar graph because Bacteria data has many species. Therefore, this bar graphs should show top 10 bacteria data.

### References

- Ref 1
- Ref 2
- Ref 3
