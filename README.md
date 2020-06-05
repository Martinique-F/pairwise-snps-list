# pairwise-snps-list
Get pairwise SNP-distances from a multi FASTA alignment

## Requirements
To be able to load a FASTA-file in R and subsequently calculate the pairwise distances from it, the Biostrings package is required. You can download it from this site:
https://bioconductor.org/packages/release/bioc/html/Biostrings.html

```
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("Biostrings")

library(Biostrings)
```
To convert the distance matrix into a unified pairwise distance list, the reshape package is required:
```
install.packages("reshape2")
library(reshape2)
```

## Get pairwise distances as dataframe from alignment 
To load a multi FASTA file into R, use:
```
file <- readDNAStringSet("test.fasta")
head(file)

  A DNAStringSet instance of length 6
    width seq                                                               names               
[1]    64 CGAAATAGCACACGTCATTGTACAGATCCATGCCGTCAGAATGTAACGGAAAGATGAATACCTG  dummy1
[2]    64 CGAAATAGCACACGTCACTGTACAGATCCATGCCGTCAGAATGTAACGGAAAGATGAATACCTG  dummy2
[3]    64 CGAAATAGCACACGTCACTGTACAGATCCATGCCGTCAGAATGTAACGGAAAGATGAATACCTG  dummy3
[4]    64 CGAAATAGCACACGTCACTGTACAGATCCATGCCGTCAGAATGTAACGGAAAGATGAATACCTG  dummy4
[5]    64 CGAAATAGCACACGTCACTGTACAGATCCATGCCGTCAGAATGTAACGGAAAGATGAATACCTG  dummy5
[6]    64 CGAAATAGCACACGTCACTGTACAGATCCATGCCGTCAGAATGTAACGGAAAGATGAATACCTG  dummy6

```
Then use the function alignment_to_snpslist to get a dataframe containing pairwise SNP distances

```
snps_list <- alignment_to_snpslist(file)
head(snps_list)

   SNPs Isolate1 Isolate2
14    1   dummy1   dummy2
27    1   dummy1   dummy3
28    0   dummy2   dummy3
40    1   dummy1   dummy4
41    0   dummy2   dummy4
42    0   dummy3   dummy4

```



