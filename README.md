---
title: "SKNN"
author: "Shujaat Khan, Seongyong Park"
date: "2016년 10월 14일"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
**SKNN: Reuse of imputed data in microarray analysis increases imputation efficiency**

<br>

**Introduction:**

SKNN is an imputation tool, design for the imputation of gene missing entries, the tool is available as an R package.

<br>

**Algorithms:**

Two novel algorithms for the gene microarray data imputation are proposed in SKNN.  The proposed algorithms are the extension of k-nearest neighborhood (KNN) algorithm named as sequential KNN (SKNN) and expectation maximization SKNN (EM-SKNN).  The EM-SKNN is the recursive application of SKNN algorithm, both methods are compared with KNN, maximum likelihood estimation (MLE) and multiple imputations (MI) algorithms for the imputation accuracy and computation speed on different datasets.

<br>

**Working:**

In SKNN method, 
1-The genes are ordered by their missing rates and the imputation was performed sequentially from a gene that had a least missing rate.
2-The sequentially imputed genes were then used in the imputation of other missing genes.

The SKNN utilizes two sets for imputation 1) complete set and 2) incomplete set. Initially, all complete and incomplete genes were placed in set 1 and 2 respectively, once a gene is fully imputed it is moved from incomplete set to complete set.

The process can be executed in parallel for all missing values of a gene.  This reduces the execution time compared to the other KNN based methods

<br>

**Performance:**

In this paper, five methods for the imputation of gene microarray data are discussed namely KNN, MLE, MI, SKNN, and EM-SKNN.  All mentioned algorithm are compared for imputation accuracy and execution time on a different dataset with missing rates varies from (10% to 60%).  The datasets consist of three types of data including Time-series, non-time series and mixed data.  For the evaluation of imputation accuracy two performance measures i.e. root mean squared error (RMS) and Pearson correlation coefficients were used.

<br>

**Conclusion:**

For a gene expression with the high missing rates, the EM-SKNN is shown to outperform the SKNN, MLE, MI and KNN methods.  In terms of accuracy and computational complexity, the SKNN showed the best performance compared to all other methods and MLE as the worst.

<br>

**Example**

<br>

1. Install
```{r SKNN}
install.packages("http://143.248.33.195/Bisyn-Lab-Tools/SKNN/SKNN_1.0.0.tar.gz", repos=NULL, type="source")
```

The function included in the package SKNN: **SeqKNN**
```{r SKNN-f}
library(SKNN)
SKNN::SeqKNN
```

<br>

2. Working Example
```{r SKNN-E}
data <- read.table("http://143.248.33.195/Bisyn-Lab-Tools/SKNN/Example.txt")
library(knitr)
kable(head(data[,1:5]))
dim(data)
sum(is.na(data))

library(SKNN)
k=10
Imp <- SeqKNN(data,k);
kable(head(Imp[,1:5]))
dim(Imp)
sum(is.na(Imp))
```

<br>

**Citation Trend**
```{r SKNN-c, echo=F}
library(knitr)
kable(read.csv("http://143.248.33.195/Bisyn-Lab-Tools/SKNN/Citation-Trend.csv"))
```

<br>

**Extras**

Matlab version <https://kr.mathworks.com/matlabcentral/fileexchange/60128-sequential-knn-imputation-method>

<br>

**Comparison of Imputation Algorithms**

LSimpute: accurate estimation of missing values in microarray data with least squares methods, Trond Hellem Bo et. al., NAR, 2004 <http://nar.oxfordjournals.org/content/32/3/e34>

Missing value imputation using a fuzzy clustering-based EM approach, Md. Geaur Rahman et. al., Know. Inf. Syst., 2016 <http://link.springer.com/article/10.1007/s10115-015-0822-y>

Comparative analysis of missing value imputation methods to improve clustering and interpretation of microarray experiments, Magalie et. al., BMC Genomics, 2010 <http://bmcgenomics.biomedcentral.com/articles/10.1186/1471-2164-11-15>

Missing value imputation for gene expression data: computational techniques to recover missing data from available information, Alan Wee-Chung Liew et. al., Briefings in Bioinformatics, 2010 <http://bib.oxfordjournals.org/content/12/5/498.long>

An experimental study on the use of nearest neighbor-based imputation algorithms for classification tasks, Jonathan de andrade silva et. al., Data & Know. Engineering, 2013 <http://www.sciencedirect.com/science/article/pii/S0169023X12001176>


<br>

**Application of Imputation Algorithms**

Imputing gene expression from selectively reduced probe sets, Yoni Donner et. al., Nature Methods, 2012 <http://www.nature.com/nmeth/journal/v9/n11/full/nmeth.2207.html>
