library ("plyr")
library ("ggplot2")
library ("reshape")
library ("xtable")
library("XML")
library("arules")
library("arulesViz")
library("stringr")

#####donn�es rougeole sur le site OFSP
data <- readHTMLTable ("http://www.bag.admin.ch/k_m_meldesystem/00733/00813/index.html?webgrab_path=aHR0cDovL3d3dy5iYWctYW53LmFkbWluLmNoL2luZnJlcG9ydGluZy9kYXRlbmRldGFpbHMvZi9tYXNlcm4uaHRt&lang=fr",which = 6, header = TRUE)
dd1 <-data[-1, ] 
names(dd1)[names(dd1)==""] <- "cantons"
str(dd1)
names(dd1[,1])<-"Cantons"
dd1[,c(2,12)]
plot(dd1)
str(dd1)
dd2<-melt(dd1, id="cantons")
colnames(dd2)[3] <- "incidence"
colnames(dd2)[2] <- "ann�es"
dd2$incidence<-as.numeric(levels(dd2$incidence)[dd2$incidence])
dd2$ann�es<-as.Date(dd2$ann�es, format="y")
ggplot(dd2,aes(dd2$ann�es,dd2$incidence)) + geom_point(color=dd2$cantons)
ggplot(dd2,aes(dd2$ann�es,dd2$incidence))+geom_histogram()+facet_wrap(cantons)
qplot(ann�es,incidence, data = dd2, geom = "histogram") 
+ facet_wrap(incidence ~ )
str(dd2)
dd2$incidence<-as.numeric(levels(dd2$incidence)[dd2$incidence])
