
                                                
  library(MASS)
  bv    <- read.csv("https://raw.githubusercontent.com/bongsongkim/BLUP/master/raw_data/K-BLUP_estimates.csv",header=T)      
  g.kin <- read.csv("https://raw.githubusercontent.com/bongsongkim/BLUP/master/raw_data/genomic_kinship_matrix.CSV",row.names=1)

  z <- read.csv("https://raw.githubusercontent.com/bongsongkim/BLUP/master/raw_data/z_matrix.csv",header=T)
  z <- as.matrix(z)                      # Z matrix 

  y  <- as.matrix(as.numeric(read.csv("https://raw.githubusercontent.com/bongsongkim/BLUP/master/raw_data/pheno.csv",header=T)[,3]))   # phenotypic vector
  m.y <- as.matrix(rep(mean(y),dim(y)[1]))                       # a vector containing the phenotypic averages

  naive_var_cov <- (ginv(t(z) %*% z) %*% t(z) %*% (y - m.y) %*% t(y - m.y) %*% (z %*% ginv(t(z) %*% z))) / dim(ginv(t(z) %*% z) %*% t(z) %*% (y - m.y))[1]
   # kk = a kinship matrix of the Naive-BLUP

#  var_cov <- read.csv(text=getURL("https://raw.githubusercontent.com/bongsongkim/BLUP/master/raw_data/variance-covariance.csv"),row.names=1)

  g.kin <- g.kin[match(bv[,1],rownames(g.kin)),match(bv[,1],rownames(g.kin))] 
  k_blup_var_cov <- 1.076 * g.kin  

  cnt   <- 0
  vec_1 <- NULL
  vec_2 <- NULL
  for (i in 1:107){
    for (j in i:107){
       cnt        <- cnt + 1
       vec_1[cnt] <- naive_var_cov[i,j]
       vec_2[cnt] <- k_blup_var_cov[i,j]
  }}
  plot(vec_1,vec_2,xlab="Var(u) calculated by Equation 7",ylab="Var(u) calculated by λK (λ = 1.076)")
