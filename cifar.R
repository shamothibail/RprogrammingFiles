install.packages("tensorflow")  # Install the tensorflow package if you haven't already
library(tensorflow)              # Load the tensorflow library
tensorflow::install_tensorflow()          # Install TensorFlow
reticulate::install_python(version = '<version>')
hello <- tf$constant("Hello, TensorFlow!")
print(hello)

# Step 1: Install the keras package from CRAN
install.packages("keras")

# Step 2: Load the keras library
library(keras)

# Step 3: Install Keras and TensorFlow
install_keras()

# Step 1: Install the reticulate package
install.packages("reticulate")

# Step 2: Load the reticulate library
library(reticulate)

# Step 3: Install Python 3.11
reticulate::install_python(version = "3.11")
py_config()
getwd()


# Step 4: Use the installed Python version (you may need to find the actual path to the installed Python)
use_python("C:/Users/MGIT/AppData/Local/r-reticulate/r-reticulate/pyenv/pyenv-win/versions/3.11.9", required = TRUE)

# Step 5: Install the keras package from CRAN
install.packages("keras")

# Step 6: Load the keras library
library(keras)

# Step 7: Install Keras and TensorFlow
install_keras()

# Step 8: Use the dataset_cifar10 function
cifar10 <- dataset_cifar10()
TF_ENABLE_ONEDNN_OPTS=0


# Step 4: Use the dataset_cifar10 function
cifar10 <- dataset_cifar10()

# Step 5: Access the CIFAR-10 dataset
c(c(x_train, y_train), c(x_test, y_test)) %<-% cifar10




# Extract training and test sets
x_train <- cifar10$train$x
y_train <- cifar10$train$y
x_test <- cifar10$test$x
y_test <- cifar10$test$y

# Verify the dataset
str(x_train)
str(y_train)
str(x_test)
str(y_test)
