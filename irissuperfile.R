myData = read.csv("/Users/soundaryaveni/Desktop/7aug/Iris.csv")
print(head(myData))
# Load necessary libraries
install.packages("ggplot2")
library(ggplot2)

# Load the iris dataset
data(iris)

# Perform linear regression
myData <- lm(Sepal.Width ~ Sepal.Length, data = iris)

# Print the summary of the model
summary(myData)

# Create predictions
iris$predicted <- predict(myData)

# Plot the data points and the regression line
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(color = 'blue') +  # Data points
  geom_line(aes(y = predicted), color = 'red') +  # Regression line
  labs(title = 'Linear Regression on Iris Dataset',
       x = 'Sepal Length (cm)',
       y = 'Sepal Width (cm)') +
  theme_minimal()




# Load necessary libraries
install.packages("ggplot2")
install.packages("dplyr")
library(ggplot2)
library(dplyr)


# Convert Species to a factor for logistic regression
iris$Species <- as.factor(iris$Species)

# Fit logistic regression model (using Sepal.Length and Sepal.Width as predictors)
myData <- glm(Species ~ Sepal.Length + Sepal.Width, data = iris, family = "binomial", 
              control = list(maxit = 100))

# Create a grid of values for prediction
grid <- expand.grid(Sepal.Length = seq(min(iris$Sepal.Length), max(iris$Sepal.Length), length.out = 100),
                    Sepal.Width = seq(min(iris$Sepal.Width), max(iris$Sepal.Width), length.out = 100))

# Predict probabilities
grid$prob <- predict(myData , newdata = grid, type = "response")

# Convert probabilities to species (for binary classification)
grid$Species <- ifelse(grid$prob > 0.5, "versicolor", "setosa")

# Plot the data points and the decision boundary
ggplot() +
  geom_point(data = iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species), size = 3) +
  geom_raster(data = grid, aes(x = Sepal.Length, y = Sepal.Width, fill = Species), alpha = 0.3) +
  labs(title = "Logistic Regression Decision Boundary",
       x = "Sepal Length (cm)",
       y = "Sepal Width (cm)") +
  scale_fill_manual(values = c("setosa" = "blue", "versicolor" = "red")) +
  theme_minimal()



# Load necessary libraries
install.packages("class")

library(class)  # For KNN
library(ggplot2)  # For visualization
library(dplyr)  # For data manipulation


# Set seed for reproducibility
set.seed(42)

# Split the data into training and testing sets
train_indices <- sample(1:nrow(iris), 0.7 * nrow(iris))  # 70% training data
train_data <- iris[train_indices, ]
test_data <- iris[-train_indices, ]

# Prepare the training and testing data
train_x <- train_data[, 1:4]  # Features
train_y <- train_data[, 5]     # Target
test_x <- test_data[, 1:4]     # Features
test_y <- test_data[, 5]        # Target

# Apply KNN
k <- 3  # Number of neighbors
predictions <- knn(train = train_x, test = test_x, cl = train_y, k = k)

# Print the predictions
print(predictions)

# Create a confusion matrix
confusion_matrix <- table(test_y, predictions)
print(confusion_matrix)

# Calculate accuracy
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
cat("Accuracy:", accuracy, "\n")

# Visualize the results
ggplot(test_data, aes(x = Sepal.Length, y = Sepal.Width, color = predictions)) +
  geom_point(size = 3) +
  labs(title = "K-Nearest Neighbors Classification",
       x = "Sepal Length (cm)",
       y = "Sepal Width (cm)") +
  theme_minimal()
