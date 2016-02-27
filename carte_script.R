library(sp)
library(shapefiles)
library(maptools)
library(ggplot2)
library(plyr)
library(rgdal) 
gpclibPermit() 
#########################
suisse.map <- readOGR("/Users/raf/Desktop/carte/CHE_adm/", layer = "CHE_adm1") 
str(suisse.map)
Sys.setlocale("LC_ALL", locale="C") 
suisse.ggmap <- fortify(suisse.map, region="NAME_1") 
str(suisse.ggmap)
ggplot(suisse.ggmap,aes(x = long, y = lat))+geom_polygon()

states <- subset(suisse.ggmap, id %in% c( "Fribourg"))

ggplot(suisse.ggmap, aes(long, lat))+ geom_polygon(aes(group=group), filled.contour="black", colour="white", size=.3) + coord_map()
ggplot(states, aes(long, lat))+ geom_polygon(aes(group=group), fill="white", colour="white", size=.3) + coord_map()+theme_minimal()
