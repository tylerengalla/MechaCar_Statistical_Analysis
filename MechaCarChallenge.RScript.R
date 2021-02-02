library(jsonlite)
library(tidyverse)
library(dplyr)

# Import Data 
MechaCar_mpg <- read_csv("challenge_data/MechaCar_mpg.csv")

# Linear Regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg)

# Determing p-value and r-squared value with summary
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg))
