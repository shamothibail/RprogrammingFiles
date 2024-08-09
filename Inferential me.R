myData = read.csv("C:/Users/MGIT/Desktop/rprograms/synthetic_dataset.csv")
print(head(myData))
#Variables:
#Continuous variable: height (in cm)
#Continuous variable: weight (in kg)
#Categorical variable: gender (Male, Female)
#Continuous variable: age (in years)
# Load necessary libraries
set.seed(42)

# Generate synthetic data
sample_size <- 100
heights <- rnorm(sample_size, mean = 170, sd = 10)
weights <- rnorm(sample_size, mean = 70, sd = 15)
ages <- sample(18:64, sample_size, replace = TRUE)
genders <- sample(c("Male", "Female"), sample_size, replace = TRUE)

# Create a data frame
data <- data.frame(height = heights, weight = weights, age = ages, gender = genders)

# Save the dataset to a CSV file
write.csv(data, "synthetic_dataset.csv", row.names = FALSE)

# Display the first few rows of the dataset
head(data)

# Load necessary libraries
library(dplyr)

# Create a sample data frame
data <- data.frame(
  group = c('A', 'A', 'B', 'B'),
  value = c(5, 6, 7, 8)
)

# Perform a t-test
result <- t.test(value ~ group, data = data)

# Print the result
print(result)

# Generate two random samples
set.seed(0)
sample1 <- rnorm(100, mean = 0, sd = 1)
sample2 <- rnorm(100, mean = 0, sd = 1.5)

# Perform F-test
f_statistic <- var(sample1) / var(sample2)
p_value <- 1 - pf(f_statistic, df1 = length(sample1) - 1, df2 = length(sample2) - 1)

# Output the results
cat("F-statistic:", f_statistic, "\n")
cat("p-value:", p_value, "\n")
