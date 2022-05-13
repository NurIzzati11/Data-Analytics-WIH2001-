library(mlbench)
library(caret)
library(Hmisc)
library(dplyr)
library(lattice)
library(ggplot2)

data("BreastCancer")
breast <- BreastCancer
breast <- select(breast, -1)
breast$Bare.nuclei<-as.numeric(breast$Bare.nuclei)
breast$Bare.nuclei[is.na(breast$Bare.nuclei)] <-round(mean(breast$Bare.nuclei, na.rm = T),digits = 0)
breast$Class<-as.character(breast$Class)
breast$Class<- replace(breast$Class,breast$Class=='benign', "1")
breast$Class<- replace(breast$Class,breast$Class=='malignant', "2")

breast$Class<-as.factor(breast$Class)

trainControl <- trainControl(method="repeatedcv", number=10, repeats=3)
metric <- "Accuracy"

# LG
set.seed(7)
fit.glm<- train(Class~.,data=breast, method="glm", metric=metric,
              trControl=trainControl)

# LDA
lda.fit = train(Class ~ ., data=breast, method="lda",metric=metric,
                trControl=trainControl)

# GLMNET
glmnet.fit<-train(Class ~ ., data=breast, method="glmnet",metric=metric,
           trControl=trainControl)

# KNN
knn.fit<-train(Class ~ ., data=breast, method="knn",metric=metric,
                  trControl=trainControl)


# CART
cart.fit<-train(Class ~ ., data=breast, method="rpart",metric=metric,
               trControl=trainControl)


# NB
set.seed(2)
nb.fit<-train(Class ~ ., data=breast, method="naive_bayes",metric=metric,
                trControl=trainControl)


#printing all results
print(fit.glm)
print(lda.fit)
print(glmnet.fit)
print(knn.fit)
print(cart.fit)
print(nb.fit)
