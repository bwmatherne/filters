#!/bin/bash

############################################################################

# Analysis Driver for filter data using Riffomonas.org instructions
# Settings are inabled for running on the LSU HPC

############################################################################

# 1. Demultiplex the raw data files from Illumina run 4 at  IEG
qsub code/demux.pbs
#########################################################
# 2. Train sequence classifier
  # Check if the most release of the Silva database needs to be downloaded
  # trun-lens may need to be ammended depending on type of sequences
  # This step is memory instensive and may need to be run on nodes with more RAM
  # Calculate reads-per batch by dividing n sequences by n processors

qsub code/trainset.pbs

########################################################
# 3. Taxonomic Analysis
  # Create phylogenetic trees
qsub code/phytree.pbs
  # Generate taxa bar plot file and collapse taxa
qsub code/taxa.pbs

########################################################
# 4. Alpha and beta diversity analysis
	# Addapted from this tutorial https://docs.qiime2.org/2019.7/tutorials/moving-pictures/
### * First choose sampling depth by viewing the information presented in the table.qzv file that was created above.
### * Choose a value that is as high as possible (so you retain more sequences per sample) while excluding as few samples as possible.
### * Insert the value into core-metrics-phylogenetic command in the code/diversity.pbs file

qsub code/diversity.pbs

########################################################
# 5. Download and analyze your data in R
  # Export BIOM File for R stats
bash code/export.bash
  # Convert Biom file to tsv
bash code/biom_convert.bash
########################################################
exit 0
