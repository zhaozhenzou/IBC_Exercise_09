setwd('~/Documents/Teaching/Biocomputing/Tutorials/11-22-19/')

install.packages("ggmap")
install.packages("maps")
install.packages("mapdata")
install.packages("usmap")

library(maps)
library(ggplot2)

states<-map_data("state")

ggplot(data=states)+
  geom_polygon(aes(x=long,y=lat,group=group),color="black",fill="white")+
  coord_quickmap()

# CHALLENGE: plot only your home state
head(states)

wisc=states[states$region=="florida",]

ggplot(data=wisc)+
  geom_polygon(aes(x=long,y=lat,group=group),color="black",fill="red")+
  coord_quickmap()

# adding point data
statell<-read.csv("stateLatLong.csv",stringsAsFactors=FALSE)

ggplot(data=states)+
  geom_polygon(aes(x=long,y=lat,group=group),color="black",fill="white")+
  coord_quickmap()+
  geom_point(data=statell,aes(x=Longitude,y=Latitude))

# CHALLENGE:
ggplot(data=states)+geom_polygon(aes(x=long,y=lat,group=group),color="black",fill="white")+coord_quickmap()+
  geom_point(data=statell,aes(x=Longitude,y=Latitude,size=hockeyPlayers))+labs(size="Hockey Players")


library(usmap)
plot_usmap(regions="states")

head(as.data.frame(statepop))

plot_usmap(data=statepop,values="pop_2015",color="red")+
  scale_fill_continuous(name="Population (2015)")+
  theme(legend.position="right")

head(as.data.frame(statepop))  # these data are a tibble...

# CHALLENGE: make a filled color plot of the hockey data *** ok to ignore Alaska and Hawaii
hockey2plot<-as.data.frame(statepop)
dim(hockey2plot)
dim(statell)
hockey2plot=hockey2plot[hockey2plot$abbr!="AK",]
hockey2plot=hockey2plot[hockey2plot$abbr!="HI",]
hockey2plot=hockey2plot[hockey2plot$abbr!="DC",]

hockey2plot=hockey2plot[order(hockey2plot$full),]
statell=statell[order(statell$Place.Name),]
sum(hockey2plot$full==statell$Place.Name)

hockey2plot$players=statell$hockeyPlayers

plot_usmap(data=hockey2plot,values="players",color="red")+
  scale_fill_continuous(name="Hockey players")+
  theme(legend.position="right")


# ggplot challenges
iris=read.csv("iris.csv",header=TRUE,stringsAsFactors=FALSE)

#1) Density plot with a density line for sepal width of each species
ggplot(data=iris)+geom_density(aes(x=Sepal.Width,color=Species))+theme_classic()

#2) Boxplot for sepal length
ggplot(data=iris)+geom_boxplot(aes(x=Species,y=Sepal.Length))+theme_classic()

#3) Scatterplot of sepal length vs sepal width
ggplot(data=iris)+geom_point(aes(x=Sepal.Length,y=Sepal.Width))+theme_classic()

#4) hexplot of sepal length vs sepal width
install.packages("hexbin")
library(hexbin)
ggplot(data=iris)+geom_hex(aes(x=Sepal.Length,y=Sepal.Width))+theme_classic()



