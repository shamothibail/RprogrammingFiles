myProject=read.csv("C:/Users/MGIT/Desktop/rprograms/CardioGoodFitness.csv")
print(head(myProject))
summary(myProject)
summary(myProject[c('Age','Income','Miles')])
#install ggplot
install.packages("ggplot2")
library(ggplot2)
#histogram

packageVersion("ggplot2")
version
ggplot(myProject, aes(x = Age)) +
  geom_histogram(binwidth = 2, fill = "blue", color = "red", alpha = 0.9)+
  labs(title="Age Distribution",X="Age",y="Frequency")


#mean
mean1=mean(myProject$Age)
print(mean1)


#median
median1=median(myProject$Age)
print(median1)


#for mode install the packagemodeest
install.packages("modeest")
library(modeest)
mode1=mode(myProject$mode)
print(mode1)


#Boxplot of Miles by Gender
ggplot(myProject, aes(x = Gender, y = Miles, fill = Gender)) +
  geom_boxplot() +
  labs(title = "Miles Distribution by Gender", x = "Gender", y = "Miles") +
  theme_minimal()
#Bar Chart of Education Levels
ggplot(myProject, aes(x = factor(Education), fill = factor(Education))) +
  geom_bar() +
  labs(title = "Education Distribution", x = "Education Level", y = "Count") +
  theme_minimal()




# Calculate the maximum
max = max(myProject$Age)
# Calculate the minimum
min = min(myProject$Age)
# Calculate the range
range = max - min

cat("Range is:\n")
print(range)

# Alternate method to get min and max
r = range(myProject$Age)
print(r)

#Variance 
variance = var(myProject$Age)
print(variance)

#Standard Deviation 
std = sd(myProject$Age)
print(std)

#Some more R function used in Descriptive Statistics in R
#Quartiles 
quartiles = quantile(myProject$Age)
print(quartiles)

#Interquartile Range 
IQR = IQR(myProject$Age)
print(IQR)

#summary() function in R
summary = summary(myProject$Age)
print(summary)

#Summary of the data frame 
# Calculating summary
summary = summary(myProject)
print(summary)

