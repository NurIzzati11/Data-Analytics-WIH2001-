# install & load packages from the library
install.packages("mlbench")
install.packages("caret")
library(mlbench)
library(caret)
data("BreastCancer")

#displays the dimension of the “BreastCancer” dataset.
dim(BreastCancer)

# displays the first 20 recods of the “BreastCancer” dataset.
head(BreastCancer,20)

#displays the data types for the attributes in the “BreastCancer” dataset
#PROBLEM: Id is shown as chr instead of integer
sapply(BreastCancer, class)

#removes the “Id” attribute from the “BreastCancer” dataset 
NoId_BreastCancer = subset(BreastCancer,select = -(Id))

#convert the data types of the remaining attributes to “numeric”
breast=NoId_BreastCancer
indx <- sapply(breast, is.factor)
breast[indx] <- lapply(breast[indx], function(x) as.numeric(as.character(x)))

#displays the summary information of the data in the “BreastCancer” dataset
summary(BreastCancer)
summary(breast)
#comment on summary information

#displays the distribution of classes in the “BreastCancer” dataset
#comment on the distribution

#displays the correlation of attributes in the “BreastCancer” dataset. 
breast_correlation<-round(cor(breast),2)

#displays the distribution of individual attributes in the “BreastCancer” dataset.
#Hint: Plot the histogram and density plots and comment on these graphs. 

#histogram
library(Hmisc)
hist.data.frame(breast)

#density plots
