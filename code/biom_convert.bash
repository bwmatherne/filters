#!/bin/bash

source activate qiime2-2021.11

#biom convert -i data/7-exported-table/feature-table.biom -o data/references/tax_table.tsv --to-tsv

biom convert -i data/exported/exported-table/feature-table.biom -o data/references/feature-table.tsv --to-tsv
biom head -i data/references/feature-table.tsv


exit 0
