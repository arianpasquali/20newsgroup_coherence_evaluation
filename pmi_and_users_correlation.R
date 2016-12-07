#install.packages("irr")
library(irr)

user_evaluations = read.csv("users_annotations.csv", header = TRUE,sep = ",",quote = "\"")

users<-c("user1","user2","user3","user4","user5","user6","user7","user8","user9","user10")
d <- user_evaluations

# Spearman correlation : PMI versus users annotations
spearmanCorrelation<-sapply(users,
                            function(a) cor(d$pmi,d[,a],method="spearman")
                            
)
spearmanCorrelation

barplot(t(spearmanCorrelation),beside = T,xlab="Annotators",ylab="Spearman correlation",
        cex.axis=1,cex.names=1,cex.lab=1,
        main="Correlation: PMI versus Human annotations")

# Fleiss kappa
kappam.fleiss(as.matrix(d[,3:12]),detail = T)
