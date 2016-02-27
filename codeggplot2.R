library(XML)
library(ggplot2)
library(reshape)
library(plyr)
roug<-'http://www.bag.admin.ch/k_m_meldesystem/00733/00813/index.html?webgrab_path=aHR0cDovL3d3dy5iYWctYW53LmFkbWluLmNoL2luZnJlcG9ydGluZy9kYXRlbmRldGFpbHMvZi9tYXNlcm4uaHRt&lang=fr'
tbl_roug <- readHTMLTable(roug, which=6)
d_roug<-tbl_roug[-1, ]

names(d_roug)[1]<-'canton'
droug<-d_roug
dr<-melt(droug,id='canton')
dr$variable <- as.Date(dr$variable, format="%Y")
dr$value<-as.numeric(as.character(dr$value))
ggplot(dr, aes(dr$variable,dr$value)) + geom_histogram() 
ggplot(dr, aes(x=variable, y=value)) + geom_histogram() + facet_wrap(~canton)



ggplot(myData, aes(x=YEARS, y=VALEURS)) + geom_bar(stat="identity") + facet_wrap(~Canton);
ggplot(myData, aes(x=YEARS, y=VALEURS)) + geom_bar(stat="identity") + facet_wrap(~Canton)