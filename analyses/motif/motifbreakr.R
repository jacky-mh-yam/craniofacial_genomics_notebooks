###############################################################################################################

# MotifbreakR analysis for identifing the impact of regulatory SNPs on TF binding motifs

# This script is adapted from the motifbreakR tutorial: https://www.bioconductor.org/packages/release/bioc/vignettes/motifbreakR/inst/doc/motifbreakR-vignette.html

###############################################################################################################

# Load libraries and data
library(motifbreakR)
library(BSgenome)
library(SNPlocs.Hsapiens.dbSNP155.GRCh37) # dbSNP155 in hg19
library(BSgenome.Hsapiens.UCSC.hg19)
library(readr)
library(MotifDb)



# Read in Single Nucleotide Variants
available.SNPs()
snps.file <- system.file("extdata", "snps.bed", package = "motifbreakR") 
read.delim(snps.file, header = FALSE)

regulatory_snp <- read_delim("data/regulatory-snp.txt", 
                             delim = "\t", escape_double = FALSE, 
                             trim_ws = TRUE, col_names = FALSE)

snps.mb <- snps.from.rsid(rsid = regulatory_snp$X1,
                          dbSNP = SNPlocs.Hsapiens.dbSNP155.GRCh37,
                          search.genome = BSgenome.Hsapiens.UCSC.hg19)



# Find Broken Motifs
MotifDb
data(motifbreakR_motif)
motifbreakR_motif
data(hocomoco)
hocomoco

subset(MotifDb,dataSource %in% c("HOCOMOCOv11-core-A", "HOCOMOCOv11-core-B", "HOCOMOCOv11-core-C"))

results <- motifbreakR(snpList = snps.mb, filterp = TRUE,
                       pwmList = subset(MotifDb, 
                                        dataSource %in% c("HOCOMOCOv11-core-A", "HOCOMOCOv11-core-B", "HOCOMOCOv11-core-C")),
                       threshold = 1e-4,
                       method = "ic",
                       bkg = c(A=0.25, C=0.25, G=0.25, T=0.25),
                       BPPARAM = BiocParallel::SerialParam())

save(results, file = "outputs/motifbreakr-result.rdata")



# Extract SNP with strong effect on motif for further analysis
results_strong <- results[results$effect == "strong"]
results_strong_df <- as.data.frame(results_strong, row.names = NULL)
write.table(apply(results_strong_df,2,as.character), file = "outputs/results_strong-effect.tsv", quote = F, sep = "\t", row.names = F)
