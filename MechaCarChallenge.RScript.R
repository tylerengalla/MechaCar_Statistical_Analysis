library(jsonlite)
library(tidyverse)
library(dplyr)

## Deliverable 1 -----
# Import Data 
MechaCar_mpg <- read_csv("challenge_data/MechaCar_mpg.csv")

# Linear Regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg)

# Determing p-value and r-squared value with summary
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg))


## Deliverable 2 -----
#Import Suspension_Coil.csv
Suspension_Coil <- read_csv("challenge_data/Suspension_Coil.csv")

# Create a total_summary df using summarize() func of PSI column
total_summary <- Suspension_Coil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

#Create a lot_summary df using group_by() 
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))


## Deliverable 3 -----
#t-tests to determine if PSI across all lots is statistically different from the pop mean of 1,500 PSI
#All lots 
t.test(Suspension_Coil$PSI,mu=as.numeric(total_summary[1:1]))

#Lot 1
t.test(subset(Suspension_Coil, Manufacturing_Lot == "Lot1")$PSI, mu=as.numeric(total_summary[1:1]))

#Lot 2
t.test(subset(Suspension_Coil, Manufacturing_Lot == "Lot2")$PSI, mu=as.numeric(total_summary[1:1]))

#Lot 3
t.test(subset(Suspension_Coil, Manufacturing_Lot == "Lot3")$PSI, mu=as.numeric(total_summary[1:1]))


