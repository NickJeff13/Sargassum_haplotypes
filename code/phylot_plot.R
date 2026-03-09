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

sar.tree$tip.label <- c("S. horridum|JX560110.1",sar.tree$tip.label[2:30])
sar.tree$tip.label <- gsub("Sargassum","S. muticum",sar.tree$tip.label)
#Rename our specific sequence
sar.tree$tip.label[20] <- "Halifax Harbour query|S. muticum"


plot.phylo(x = sar.tree, 
           type = "phylogram",
           font=4,
           edge.width = 3,
           y.lim = c(1,30),
           root.edge = T,
           tip.color = c(rep("black",19),"red",rep("black",10)),
           cex=0.7)

write.nexus(sar.tree, file = "data/COI_aln.nex")



# ITS alignment -----------------------------------------------------------

#First need to reverse complement the sequence Evan sent
library(seqinr)

its <- readDNAStringSet(filepath =  "data/TUBES917_1_extraction_ITS.fasta", format = "fasta")

its.rev <- reverseComplement(its)
write.fasta(its.rev,names = "Sargassum_muticum_ITSrevcomp", file.out = "data/SargassumITS_revComp.fasta")
