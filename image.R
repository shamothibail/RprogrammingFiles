# Install and load the keras package
install.packages("keras")
library(keras)

install.packages("tensorflow")

# Load the tensorflow library
library(tensorflow)

# Install TensorFlow
install_tensorflow()

# Verify the installation
hello <- tf$constant("Hello, TensorFlow!")
print(hello)
# Load the CIFAR-10 dataset
cifar10 <- dataset_cifar10()

# Extract training and test sets
x_train <- cifar10$train$x
y_train <- cifar10$train$y
x_test <- cifar10$test$x
y_test <- cifar10$test$y

# Check the dimensions of the dataset
dim(x_train)  # Training images: 50000 32x32x3
dim(y_train)  # Training labels: 50000
dim(x_test)   # Test images: 10000 32x32x3
dim(y_test)   # Test labels: 10000

# Example: Display the first image from the training set
library(ggplot2)
library(gridExtra)

# Convert the first image to a format suitable for ggplot2
img <- as.raster(x_train[1,,,])

# Plot the image
ggplot() +
  annotation_raster(img, xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf) +
  theme_void()