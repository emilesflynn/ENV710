# Env710 Lab Week 1 Script
# Elizabeth Miles-Flynn
# 1/14/2026

#### Setup ####

# Load Packages
library(tidyverse)
library(palmerpenguins)

# Load Data
df <- penguins

# Inspect Data
View(df)

#### Measures of Location ####

##### 1A) What is the mean penguin body mass (in kilograms)? (1pt) ####
mean_bodymass.g <- mean(df$body_mass_g, na.rm = TRUE)
mean_bodymass.kg <- mean_bodymass.g/1000
# The mean penguin body mass is 4.202 kilograms.

##### 1B) What is the median penguin body mass (in kilograms)? (1 pt) ####
med_bodymass.g <- median(df$body_mass_g, na.rm = TRUE)
med_bodymass.kg <- med_bodymass.g/1000
# The median penguin body mass is 4.050 kilograms.

##### 1C) What are the 5th and 95th percentile penguin body masses (in kilograms)? ####
quantile(df$body_mass_g, probs = seq(0,1,1/20), na.rm = TRUE)
fifth_kg <- 3150.00/1000
nintyfifth_kg <- 5650.00/1000
# The 5th percentile penguin body mass is 3.150 kilograms and 95th percentile...
# ...penguin body mass is 5.650 kilograms.

#### Measures of Spread ####

##### 2A) What is the range in penguin body mass (in kilograms)? (1 pts) ####
range(df$body_mass_g, na.rm = TRUE)
range_kg <- (6300-2700)/1000
# The range in penguin body mass is 3.600 kilograms.

##### 2B) What is the standard deviation in penguin body mass (in kilograms)? (1 pt) ####
sd_g <- sd(df$body_mass_g, na.rm = TRUE)
sd_kg <- sd_g/1000
# The standard deviation in penguin body mass is 0.8020 kilograms.

##### 2C) What is the variance in penguin body mass (in kilograms)? (1 pt) ####
var_g <- var(df$body_mass_g, na.rm = TRUE)
var_kg <- var_g/1000
# The variance in penguin body mass is 643.1 kilograms.

#### Visualize Data ####

##### 3A) Make a scatterplot of penguin body mass (in kilograms, on the y axis) ####
## by island (on the x axis) and color the points by species. Use geom_jitter() 
## instead of geom_point() to spread the points out and better see their distribution. (4 pts)
fig_mass_island <- ggplot(data = df,
               aes(x = island,
                   y = body_mass_g/1000,
                   color = species)) +
  geom_jitter() +
  scale_color_manual(values = c("darkorange",
                                "purple",
                                "cyan4")) + #customize colors
  labs(x = "Island Type",
       y = "Body Mass (kg)",
       title = "Penguin Body Mass in Each Island from Antarctica LTER by Species Type") +
  theme_bw()

fig_mass_island

ggsave(fig_mass_island,
       filename = "lab1_figure_EMF.jpg",
       height = 12,
       width = 15,
       units = "cm")

##### 3B) Write a figure caption describing the contents of the figure. (3 pts) ####
fig_mass_island <- ggplot(data = df,
                          aes(x = island,
                              y = body_mass_g/1000,
                              color = species)) +
  geom_jitter() +
  scale_color_manual(values = c("darkorange",
                                "purple",
                                "cyan4")) + #customize colors
  labs(x = "Island Type",
       y = "Body Mass (kg)",
       title = "Penguin Body Mass in Each Island from Antarctica LTER by Species Type",
       caption = "Figure 1. Penguin Body Mass (ranging between 2.7 and 6.3 kg) in Each Island (Biscoe, Dream, Torgersen) from Antarctica LTER, from the 'palmerpenguins' dataset.") +
  theme_bw()

fig_mass_island

ggsave(fig_mass_island,
       filename = "lab1_figure_EMF.jpg",
       height = 12,
       width = 30,
       units = "cm")

##### 3C) What do you notice about the species distribution across the islands? (3 pts) ####
# All three islands share the same penguin species, Adelie, that have a similar
# range of body masses roughly between 2.7 and 5 kg. Meanwhile, the Biscoe is the
# only island with the Gentoo penguin species type with a larger range of body 
# masses (between 4 to 6.3 kg) compared to the Adelie species. Dream is the
# only island with the Chinstrap species which share a similar range of body masses. 
# Overall, Biscoe and Dream are more diverse with two seperate penguin species
# types present compared the Torgersen with only one species type. 

##### 3D) How do the raw values of penguin body mass compare to the mean penguin ####
## body mass you calculated above? (3 pts)
summary(df$species)
# The mean penguin body mass calculated previously was 4.202 kilograms. Comparing
# this value with the jitter plot is interesting because it appears as though the
# most abundant species is Adelie found across all three islands and Chinstrap
# species have body masses ranging from 2.7 to 5 kg. Visually, we would expect the
# mean to be close to the halfway point between that range (2.7+5/2=3.85 kg). Yet, 
# Gentoo species has a higher range of body masses between 4 and 6.3 kg and many
# value points (abundance) that increases our total mean body masses for the entire
# dataset (ranging between 2.7 and 6.3 kg overall).
