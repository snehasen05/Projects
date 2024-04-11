library(caret)
library(corrr)
install.packages("caret")
install.packages("corrr")
# Load the dataset
setwd("C:\\Users\\Souvik\\Desktop\\MRAA")
data <- read.csv("Factor3.csv")
data
# Calculate the correlation matrix
# Find the variables that have high correlation coefficients

correl <- cor(data)
correl

#for factor analysis
install.packages("psych")
install.packages("openxlsx")
library(openxlsx)
library(psych)
write.xlsx(correl, "correlation_matrix.xlsx")
write.csv(correl, "corr_matrix.csv")
# Bartlett's test of spherecity 

bartlett.test(data)
#cortest.bartlett(correl, n = nrow(FactorC2[, -c(2,4)])) #we can keep removing the redundant variable one by one and check the improvement in the output/result

# KMO (Kaiser-Meyer-Olkin) test for sampling adequacy
KMO(correl)
#pca
?pca
pca1 = pca(correl, nfactors = 31, rotate = "none") 
pca1

pca2 = pca(correl, nfactors = 5, rotate = "none")
print(pca2$loadings, digits = 2, cutoff = .5)

pca3 = pca(correl, nfactors = 5, method = "regression", rotate = "varimax")

print(pca3$loadings, digits = 2, cutoff = .5)


# Finally check for factor loadings, cross loadings, communality, cummulative variance explained (when already threshold values of Bartlet's, KMO & Eigenvalue are met)


###############################
# GIVE APPROPRIATE NAMES
###############################




