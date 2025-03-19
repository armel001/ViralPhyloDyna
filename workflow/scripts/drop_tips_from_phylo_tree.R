
#setwd("~/Dropbox/Workshops/VEME2022_Phylogeny_Inference/VEME-2023/14_Ancestral_State_Reconstruction_Practical/infiles/")

# load libraries

library(dplyr)
library(data.table)
library(ape)
library(treeio)

# load tree file
tree <- read.tree("/Users/armel001/Documents/SARS-CoV-2-Manuscrit-Guinea/Phylogenetic-analysis/dataset/ba5/ba5.sequences.fasta.treefile")

# create vector list of seqIDs to drop from the tree
drop_tip <- c("hCoV-19/Guinea/CERFIG-37756/2022"
              )

# now drop the tips from the tree
new_tree <- drop.tip(tree, drop_tip, trim.internal = TRUE)

# write the tree to file
write.tree(new_tree, file="/Users/armel001/Documents/SARS-CoV-2-Manuscrit-Guinea/Phylogenetic-analysis/dataset/ba5/ba5.sequences.fasta.nwk", append = FALSE)
    
