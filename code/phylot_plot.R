# Align publicly available S. muticum COI and mito genomes for haplotype analysis


# Load libraries ----------------------------------------------------------
library(msaR)
library(ape)
library(muscle)
library(Biostrings)
library(pegas)

# run alignment

seqs <- read.FASTA(file = "data/allSequences.fasta", 
                   type = "DNA")

sar.aln <- re
# plot tree from Clustal alignment 
sar.tree <- read.tree(file = "data/clustalo-I20260212-135551-0474-11828568-p2m.ph")

plot.phylo(x = sar.tree, 
           type = "phylogram",
           edge.width = 3,
           y.lim = c(1,30))

write.nexus(sar.tree, file = "data/COI_aln.nex")
