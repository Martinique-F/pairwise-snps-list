alignment_to_snpslist <- function(file, ...) {
  #gets distances from alignment
  d <- stringDist(file, method="hamming")  
  #turns distances into matrix
  x <- as.matrix(d)  
  #turns matrix into unified pairwise list
  l <- melt(x)[melt(upper.tri(x))$value,]
  #sort list horizontically
  l <- as.data.frame(t(apply(l, 1, sort)))
  #rename columns
  names(l) <- c("SNPs", "Isolate1", "Isolate2")
  #there are spaces before numbers like "0" and "1", which should be removed
  l$SNPs <- gsub(' ', '', l$SNPs)
  return(data.frame(l))
}



