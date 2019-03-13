#Title: make-shots-data-script
#Description: This script is a script for manipulating the shot data of the starting five of the GSW
#Inputs: five CSV files, one for each starter (Curry, Durant, Iguodala, Green, Thompson)
#Outputs: ########do this#########

#imports
library(dplyr)

#read in files
iguodala<-read.csv("../data/andre-iguodala.csv",colClasses=c("character","character","integer","integer","integer","integer","character","character","character","integer","character","real","real"),stringsAsFactors = FALSE)
green<-read.csv("../data/draymond-green.csv",colClasses=c("character","character","integer","integer","integer","integer","character","character","character","integer","character","real","real"),stringsAsFactors = FALSE)
durant<-read.csv("../data/kevin-durant.csv",colClasses=c("character","character","integer","integer","integer","integer","character","character","character","integer","character","real","real"),stringsAsFactors = FALSE)
thompson<-read.csv("../data/klay-thompson.csv",colClasses=c("character","character","integer","integer","integer","integer","character","character","character","integer","character","real","real"),stringsAsFactors = FALSE)
curry<-read.csv("../data/stephen-curry.csv",colClasses=c("character","character","integer","integer","integer","integer","character","character","character","integer","character","real","real"),stringsAsFactors = FALSE)

#add name column
mutate(iguodala, name = "Andre Iguodala")
mutate(green, name = "Draymond Green")
mutate(durant, name = "Kevin Durant")
mutate(thompson, name = "Klay Thompson")
mutate(curry, name = "Stephen Curry")

#y/n to yes/no
iguodala$shot_made_flag[iguodala$shot_made_flag=="n"] <- "shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag=="y"] <- "shot_yes"
green$shot_made_flag[green$shot_made_flag=="n"] <- "shot_no"
green$shot_made_flag[green$shot_made_flag=="y"] <- "shot_yes"
durant$shot_made_flag[durant$shot_made_flag=="n"] <- "shot_no"
durant$shot_made_flag[durant$shot_made_flag=="y"] <- "shot_yes"
thompson$shot_made_flag[thompson$shot_made_flag=="n"] <- "shot_no"
thompson$shot_made_flag[thompson$shot_made_flag=="y"] <- "shot_yes"
curry$shot_made_flag[curry$shot_made_flag=="n"] <- "shot_no"
curry$shot_made_flag[curry$shot_made_flag=="y"] <- "shot_yes"

#minute adjustment with period
iguodala$minute=iguodala$period*12-iguodala$minutes_remaining
green$minute=green$period*12-green$minutes_remaining
durant$minute=durant$period*12-durant$minutes_remaining
thompson$minute=thompson$period*12-thompson$minutes_remaining
curry$minute=curry$period*12-curry$minutes_remaining

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
sink(file = '../data/shots-data.csv')
rbind(summary(iguodala), summary(green), summary(durant), summary(thompson), summary(curry))
sink()

#row bind function (txt version)
sink(file = '../output/shots-data-summary.txt')
summary(rbind(summary(iguodala), summary(green), summary(durant), summary(thompson), summary(curry)))
sink()


