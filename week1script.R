# Env710 Lab Week 1 Script
# Elizabeth Miles-Flynn
# 1/14/2026

#### Intro ####
# Create a new variable.
pizza <- 10

#### Setup ####

# Load Packages
library(tidyverse)
library(palmerpenguins)

# Load Data
df <- penguins

# Inspect Data
View(df)

#### Data Exploration ####

# How many different kinds of penguin species are there? 
unique(df$species)

# What are the minimum and maximum bill lengths (in millimeters)?
# Use na.rm = TRUE to remove NAs from a dataset
min(df$bill_len, na.rm = TRUE)
max(df$bill_len, na.rm = TRUE)

# What is their mean bill length (in millimeters)?
mean(df$bill_len, na.rm = TRUE)

# What is their median bill depth (in millimeters)?
median(df$bill_len, na.rm = TRUE)

# What is the standard deviation in flipper length (in millimeters)?
sd(df$flipper_len, na.rm = TRUE)

# Assign standard deviation of flipper length a name
flipper_sd <- sd(df$flipper_len, na.rm = TRUE)

## Practice Problem: Dataset list of all column names and their data types ##
class(df)

# species (qualitative, discrete, nominal)
# island (qualitative, discrete, nominal)
# bill_len (quantitative, continuous)
# bill_dep (quantiative, continuous)
# flipper_len (quantiative, continuous)
# body_mass (quantitative, continuous)
# sex (qualitative, discrete, binary)
# year (quantitative, discrete)

# Create a scatterplot
fig1 <- ggplot(data = df, #specify data
               aes(x = bill_len, # x axis
                   y = bill_dep, # y axis
                   color = species)) + # and coloration to create base plot
  geom_point() +
  scale_color_manual(values = c("darkorange",
                                "purple",
                                "cyan4")) + #customize colors
  labs(x = "Bill Length (mm)",
       y = "Bill Depth (mm)",
       title = "Penguin Data from Antarctica LTER") + # add labels
  theme_bw() # remove grey background
  
# Print plot
fig1

# Export plot
ggsave(fig1, # reference the plot you are exporting
       filename = "penguin_plot.jpg", #figure filename
       height = 12,
       width = 15,
       units = "cm") # units can also be in 'in', 'mm', and 'px'