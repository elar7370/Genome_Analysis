# Performed in R studio

BiocManager::install("DESeq2")
library("DESeq2")
library(gplots)
library("RColorBrewer")
library("genefilter")
library("plyr")
library("pheatmap")
library("ggplot2")

sampleFiles <- c('serum_ERR1797969_counts.txt', 'serum_ERR1797970_counts.txt', 'serum_ERR1797971_counts.txt', 'hb_ERR1797972_counts.txt','hb_ERR1797973_counts.txt', 'hb_ERR1797974_counts.txt')
sampleCondition <- c('Serum', 'Serum', 'Serum', 'BH', 'BH', 'BH')
sampleNames <- c("Serum_01", "Serum_02", "Serum_03", "BH_01", "BH_02", "BH_03")
sampleTable <- data.frame(sampleName = sampleNames, fileName = sampleFiles, condition = sampleCondition)

directory <- "C:/Users/eleni/Desktop/Master's/Genome Analysis/results"
ddsHTSeq  <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable, directory = directory, design= ~ condition)

# Differential Expression analysis
dds <- DESeq(ddsHTSeq) #normalise-variance stabilisation
res <- results(dds)
rld <- rlog(dds, blind=FALSE)


significant_result <- res[ which(res$padj < 0.001 & abs(res$log2FoldChange)>=1), ]
summary(significant_result)

# Nice simple heatmap to illustrate the differences
mat = assay(rld)[ head(order(res$padj),20), ] # select the top 20 genes with the lowest padj
mat = mat - rowMeans(mat) # Subtract the row means from each value

# Optional, but to make the plot nicer:
df = as.data.frame(colData(rld)[,c("condition")]) # Create a dataframe with a column of the conditions
colnames(df) = "condition" # Rename the column header
rownames(df) = colnames(mat) # add rownames
# and plot the actual heatmap
pheatmap(mat, annotation_col=df)
