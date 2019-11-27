# Q1
# load ggplot
library(ggplot2)
# load bmi dataset
bmi <- read.table("BMI.txt", header=TRUE)
# create scatterplot with bmi and systolic bp
ggplot(data = bmi,aes(x = BMI, y = Systolic)) + 
  geom_point() +
  stat_smooth(method = "lm") +
  ylab("Systolic Blood Pressure") +
  theme_classic()

# Q2
# load data
d <- read.csv("data.txt", header=TRUE)
# create barplot
ggplot(data = d, aes(x=region, y=observations)) +
  stat_summary(geom = "bar",fun.y = "mean") +
  theme_classic()
# create scatterplot
ggplot(data = d, aes(x=region, y=observations)) +
  geom_point() +
  geom_jitter()
# The barplot shows that the four regions have similar average observations,
# with little information about variation within a dataset. 
# On the other hand, the scatterplot shows that east and west regions 
# have greater variations of observations than the north region,
# while the south group is divided into two clusters with different means.
