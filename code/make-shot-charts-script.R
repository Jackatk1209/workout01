#title: make-shots-charts-script.R
#Description: make a visual display of shots made on top of jpeg
#Input: Datasets containing shots made or not made by each of the starting five on GSW
#Output: Images

#libraries
library(jpeg)
library(grid)
library(ggplot2)

setwd("~/Desktop/stats133/workout01/code")

#court file as background
court_file <- "../images/nba-court.jpg"
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

#shot charts
#thompson
thompson_shot_chart <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50,420) +
  ggtitle("Shot Chart: Klay Thompson (2016 season)") +
  theme_minimal()
ggsave(filename = "../images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)

#iguodala
iguodala_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image,-250,250,-50,420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Andre Iguodala (2016 season)") +
  theme_minimal()
ggsave(filename = "../images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)

#green
green_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Draymond Green (2016 season)") +
  theme_minimal()
ggsave(filename = "../images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)

#durant
durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Kevin Durant (2016 season)") +
  theme_minimal()
ggsave(filename = "../images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)

durant_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Stephen Curry (2016 season)") +
  theme_minimal()
ggsave(filename = "../images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)

#facetted shot chart
all_data <- rbind(iguodala, green, thompson, durant, curry)
all_shots <- ggplot(data = all_data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50,420) +
  ggtitle("Shot Charts: GSW (2016 season)") +
  theme_minimal() + facet_wrap(~name)
ggsave(filename = "../images/gsw-shot-charts.pdf", width = 8, height = 7)

