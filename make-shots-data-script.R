#Title: make-shots-data-script
#Description: This script is a script for manipulating the shot data of the starting five of the GSW
#Inputs: five CSV files, one for each starter (Curry, Durant, Iguodala, Green, Thompson)
#Outputs: ########do this#########

#imports
library(dplyr)
library(ggplot2)

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


