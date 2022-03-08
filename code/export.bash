#!/bin/bash

mkdir data/exported

unset PYTHONPATH
unset PYTHONUSERBASE
source activate qiime2-2021.11
cd /work/bmath27/sterivex

qiime tools export \
  --input-path data/qiime/table.qza \
  --output-path data/exported/exported-table

qiime tools export \
  --input-path data/references/taxonomy.qza \
  --output-path data/exported/exported-taxonomy

qiime tools export \
  --input-path data/qiime/unrooted-tree.qza \
  --output-path data/exported/exported-tree

tar -zcvf data/exported.tar.gz data/exported

exit 0
