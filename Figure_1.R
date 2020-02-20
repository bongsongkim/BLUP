                                          
# Figure 1(A) Correlation between Naive-BLUP and K-BLUP   

   dat1 <- read.csv("https://raw.githubusercontent.com/bongsongkim/BLUP/master/raw_data/Naive-BLUP_estimates.csv",header=T)
   dat2 <- read.csv("https://raw.githubusercontent.com/bongsongkim/BLUP/master/raw_data/K-BLUP_estimates.csv",header=T)   
   plot(dat1[,2],dat2[,2],xlab="Naive-BLUP",ylab="Conventional BLUP")
   
