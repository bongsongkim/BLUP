
   bv         <- read.csv(text=getURL("https://raw.githubusercontent.com/bongsongkim/BLUP/master/raw_data/K-BLUP_estimates.csv"),header=T)      
   k_blup.kin <- read.csv(text=getURL("https://raw.githubusercontent.com/bongsongkim/BLUP/master/raw_data/genomic_kinship_matrix.CSV"),row.names=1)

   naive_blup_estimates <- read.csv(text=getURL("https://raw.githubusercontent.com/bongsongkim/BLUP/master/raw_data/Naive-BLUP_estimates.csv"),row.names=1)
   y    <- as.matrix(naive_blup_estimates)      # Naive BLUP estimates
   m.y <- as.matrix(rep(mean(y),length(y)))     # a vector consisting of the averages of Naive BLUP estimates


   kk  <- (ginv(t(z) %*% z) %*% t(z) %*% (y - m.y) %*% t(y - m.y) %*% (z %*% ginv(t(z) %*% z))) / dim(ginv(t(z) %*% z) %*% t(z) %*% (y - m.y))[1]

#  var_cov <- read.csv(text=getURL("https://raw.githubusercontent.com/bongsongkim/BLUP/master/raw_data/variance-covariance.csv"),row.names=1)

   g.kin <- g.kin[match(bv[,1],rownames(g.kin)),match(bv[,1],rownames(g.kin))] 
   colnames(p.kin) <- colnames(g.kin)
   rownames(p.kin) <- rownames(g.kin)


   cnt   <- 0
   vec_1 <- NULL
   vec_2 <- NULL
   for (i in 1:107){
     for (j in i:107){
        cnt        <- cnt + 1
        vec_1[cnt] <- g.kin[i,j]
        vec_2[cnt] <- p.kin[i,j]
   }}
   plot(vec_2,vec_1,xlab="Var(u) calculated by Equation 7",ylab="Var(u) calculated by λK")
