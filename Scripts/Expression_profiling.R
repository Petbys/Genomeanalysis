install.packages("BiocManager")
BiocManager::install("DESeq2")

install.packages("locfit")

library(limma)
library(edgeR)
library(DESeq2)
BiocManager::install("apeglm")
library(apeglm)
library(Biobase)
library(ggplot2)


#Initiate DESeq2 dataset
setwd("/Users/petterbystrom/Documents/VT23/Genomanalys")
samplefiles <- list.files(".", pattern = "RNA")
samplefiles
samplecondition <- c("BH","BH","BH","Serum","Serum","Serum")

sampleTable <- data.frame(sampleName = samplefiles,
                          fileName = samplefiles,
                          condition = samplecondition)
sampleTable$condition <- factor(sampleTable$condition)
dds <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
                                       directory = ".",
                                       design= ~ condition)
# 1. Prefiltering - remove all rows with reads less than 10

keep <- rowSums(counts(dds)) >= 10
dds <- dds[keep,]
print(dds)

### Differential expression analysis
dds <- DESeq(dds, minReplicatesForReplace = Inf)
res <- results(dds, cooksCutoff = False, independentFiltering = False)


res_df <- data.frame(res)

# distribution plot
ggplot(res_df,aes(x=log(baseMean) ) ) + geom_histogram(color="black", fill="white")

# Taking the genes with highest difference in expression
difRes <- res[which(res$padj < 0.001 & (res$log2FoldChange < -1| res$log2FoldChange > 1)),]
difRes

sigRes <- res[which(res$padj < 0.001 & (res$log2FoldChange < -5 | res$log2FoldChange > 7)),]
sigRes
min(sigRes$log2FoldChange)


# print to csv to recover genes from assembly
Significant_genes <- rownames(sigRes)
capture.output(Significant_genes, file = "significant.txt")
df <- data.frame(c1 = Significant_genes)
write.csv(df, "Significant.csv")
up_reg <-data.frame(c1= sigRes$log2FoldChange >0)
up_reg
write.csv(up_reg, "reg.csv")


resOrdered
# Shrinkage of effect size
resLFC <- lfcShrink(dds, coef="condition_Serum_vs_BH", type="apeglm")

# Order after p-value - remove after 


# Plotting
plotMA(sigRes, ylim=c(-9,9))
plotMA(res, ylim=c(-2,2))


## Apply regularized-log transform to counts
rld <- rlogTransformation(dds)

## Principal component analysis
plotPCA(res, intgroup="condition","sizeFactor")

## Heatmap of sample distances
library("gplots")   # If this fails, run: install.packages("gplots")
library("RColorBrewer")
sampleDists <- dist(t(assay(rld)))
sampleDistMatrix <- as.matrix( sampleDists )
colours <- colorRampPalette(rev(brewer.pal(9, "Blues")))(255)
heatmap.2(sampleDistMatrix, trace="none", col=colours)

## Heatmap of 35 most variable genes
library("genefilter")



heatmap.2(assay(rld)[sigRes, ], scale="row",
          trace="none", dendrogram="column", margins=c(5, 10),
          col=colorRampPalette(rev(brewer.pal(9, "RdBu")))(255))

ntd=normTransform(dds)
library("pheatmap")

sig_genes <- rownames(sigRes)

library(dplyr)
# Select rows with largest difference in expression
selected_rows <- which( rownames(res_df) %in% sig_genes)


df <- as.data.frame(colData(dds)[,c("condition","sizeFactor")])
pheatmap(assay(rld)[selected_rows,], cluster_rows=FALSE, show_rownames=TRUE,
         cluster_cols=FALSE, annotation_col=df)






  #recover the gene identifiers by saving the resulting indices:
#idx <- identify(res$baseMean, res$log2FoldChange)


