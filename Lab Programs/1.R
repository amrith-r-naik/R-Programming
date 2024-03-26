"Read a dataset from a CSV file and perform exploratory data analysis, including summary statistics, data visualization, and identifying missing values."

library(dplyr)
library(ggplot2)
library(tidyr)

# Step 1: Read dataset from CSV file
file_path <- "~/NNM22AD006/R/Downloads/titanic.csv"
data <- read.csv(file_path)

# Step 2: Exploratory Data Analysis (EDA)
# Summary statistics
summary_stats <- summary(data)
print(summary_stats)

# Data Visualization
# For example, let's create a histogram for age
print(ggplot(data, aes(x=Age))+
        geom_histogram(binwidth=5, fill="green", color="white")+
        labs(title="Distribution of Age on Titanic",
             x="Age",
             y="Frequency"))

print(ggplot(data, aes(x=factor(Survived),fill = 
                         factor(Survived))) +
        geom_bar() +
        labs(title="Number of Survivors on Titanic",
             x="Survived",
             y="Count") +
        scale_fill_manual(values=c("darkred","white")))

# Identifying missing values
missing_values <- colSums(is.na(data))
print(missing_values)