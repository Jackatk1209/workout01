#Title: make-shots-data-script
#Description: This script is a script for manipulating the shot data of the starting five of the GSW
#Inputs: five CSV files, one for each starter (Curry, Durant, Iguodala, Green, Thompson)
#Outputs: ########do this#########

#set working directory
getwd()
setwd("~/Desktop/stats133/workout01/code")
library(dplyr)

#read in files
iguodala <- read.csv('../data/andre-iguodala.csv', stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)

#name column
curry$name <- rep("Stephen Curry", length(curry$team_name))
iguodala$name <- rep("Andre Iguodala", length(iguodala$team_name))
green$name <- rep("Draymond Green", length(green$team_name))
durant$name <- rep("Kevin Durant", length(durant$team_name))
thompson$name <- rep("Klay Thompson", length(thompson$team_name))

#replace y/n with shot_yes/ shot_no
curry$shot_made_flag[curry$shot_made_flag == "y"] = "shot_yes"
curry$shot_made_flag[curry$shot_made_flag == "n"] = "shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag == "y"] = "shot_yes"
iguodala$shot_made_flag[iguodala$shot_made_flag == "n"] = "shot_no"
green$shot_made_flag[green$shot_made_flag == "y"] = "shot_yes"
green$shot_made_flag[green$shot_made_flag == "n"] = "shot_no"
durant$shot_made_flag[durant$shot_made_flag == "y"] = "shot_yes"
durant$shot_made_flag[durant$shot_made_flag == "n"] = "shot_no"
thompson$shot_made_flag[thompson$shot_made_flag == "y"] = "shot_yes"
thompson$shot_made_flag[thompson$shot_made_flag == "n"] = "shot_no"

curry$minute = 12 * curry$period - curry$minutes_remaining
iguodala$minute = 12*iguodala$period - iguodala$minutes_remaining
green$minute = 12*green$period - green$minutes_remaining
durant$minute = 12*durant$period - durant$minutes_remaining
thompson$minute = 12*thompson$period - thompson$minutes_remaining

## Using sink for output
sink(file = '../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

sink(file = '../output/draymond-green-summary.txt')
summary(green)
sink()

sink(file = '../output/kevin-durant-summary.txt')
summary(durant)
sink()

sink(file = '../output/klay-thompson-summary.txt')
summary(thompson)
sink()

sink(file = '../output/stephen-curry-summary.txt')
summary(curry)
sink()

#row bind function to stack summaries for csv
shots_data_og <- rbind(curry, iguodala, green, durant, thompson)
shots_data <- as.data.frame(shots_data_og)
write.csv(shots_data, "../data/shots-data.csv")

#row bind function (txt version)
sink(file = '../output/shots-data-summary.txt')
summary(rbind(summary(iguodala), summary(green), summary(durant), summary(thompson), summary(curry)))
sink()


