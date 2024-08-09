myData = read.csv("C:/Users/MGIT/Desktop/rprograms/Iris.csv")
print(head(myData))
# Install necessary packages
install.packages("caret")
install.packages("randomForest")
install.packages("e1071")  # For SVM and Naive Bayes
install.packages("class")   # For KNN
install.packages("rpart")   # For Decision Tree
install.packages("nnet")    # For multinomial logistic regression

# Load necessary libraries
library(ggplot2)
library(caret)
library(randomForest)
library(e1071)  # For SVM and Naive Bayes
library(class)  # For KNN
library(rpart)  # For Decision Tree
library(nnet)   # For multinomial logistic regression

# Load the Iris dataset
data(iris)

# Split the dataset into training and testing sets
set.seed(123)
#proportion of the dataset that will be used for training the model.
trainIndex <- createDataPartition(iris$Species, p = .8, 
                                  list = FALSE, 
                                  times = 1)
irisTrain <- iris[trainIndex, ]
irisTest <- iris[-trainIndex, ]

# 1. Linear Regression (predicting Petal.Length)
lm_model <- lm(Petal.Length ~ Sepal.Length + Sepal.Width + Petal.Width, data = irisTrain)
summary(lm_model)

# 2. Logistic Regression (predicting Species)
logistic_model <- multinom(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, 
                           data = irisTrain)
summary(logistic_model)

# 3. Random Forest
rf_model <- randomForest(Species ~ ., data = irisTrain)
print(rf_model)

# 4. Decision Tree
dt_model <- rpart(Species ~ ., data = irisTrain)
print(dt_model)

# 5. Support Vector Machine (SVM)
svm_model <- svm(Species ~ ., data = irisTrain)
print(svm_model)

# 6. K-Nearest Neighbors (KNN)
knn_model <- knn(train = irisTrain[, -5], test = irisTest[, -5], 
                 cl = irisTrain$Species, k = 3)
knn_confusion <- table(knn_model, irisTest$Species)
print(knn_confusion)

# 7. Naive Bayes
nb_model <- naiveBayes(Species ~ ., data = irisTrain)
print(nb_model)

# Evaluate models
# Predictions for Logistic Regression
logistic_pred <- predict(logistic_model, irisTest)
logistic_confusion <- table(logistic_pred, irisTest$Species)
print(logistic_confusion)

# Predictions for Random Forest
rf_pred <- predict(rf_model, irisTest)
rf_confusion <- table(rf_pred, irisTest$Species)
print(rf_confusion)

# Predictions for Decision Tree
dt_pred <- predict(dt_model, irisTest)
print(length(dt_pred))
print(length(irisTest$Species))


# Predictions for SVM
svm_pred <- predict(svm_model, irisTest)
svm_confusion <- table(svm_pred, irisTest$Species)
print(svm_confusion)


# Predictions for Naive Bayes
nb_pred <- predict(nb_model, irisTest)
nb_confusion <- table(nb_pred, irisTest$Species)
print(nb_confusion)

# Print accuracy for each model
cat("Accuracy for Logistic Regression:", sum(diag(logistic_confusion)) / sum(logistic_confusion), "\n")
cat("Accuracy for Random Forest:", sum(diag(rf_confusion)) / sum(rf_confusion), "\n")
cat("Accuracy for Decision Tree:", sum(diag(dt_confusion)) / sum(dt_confusion), "\n")
cat("Accuracy for SVM:", sum(diag(svm_confusion)) / sum(svm_confusion), "\n")
cat("Accuracy for Naive Bayes:", sum(diag(nb_confusion)) / sum(nb_confusion), "\n")
