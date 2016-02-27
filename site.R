library ("plyr")
library ("ggplot2")
library ("reshape")
library ("xtable")
library("XML")
#####données rougeole
data <- readHTMLTable ("http://www.bag.admin.ch/k_m_meldesystem/00733/00813/index.html?webgrab_path=aHR0cDovL3d3dy5iYWctYW53LmFkbWluLmNoL2luZnJlcG9ydGluZy9kYXRlbmRldGFpbHMvZi9tYXNlcm4uaHRt&lang=fr",which = 6, header = TRUE)
dd1 <-data[-1, ] 
 names(dd1)[names(dd1)==""] <- "cantons"
str(dd1)
names(dd1[,1])<-"Cantons"
dd1[,c(2,12)]
plot(dd1)
str(dd1)
dd2<-melt(dd1, id="cantons")
ggplot(dd2,aes(dd2$cantons,dd2$value))+geom_histogram()+facet_grid(~ dd2$variable)
str(dd2)
dd2$value<-as.numeric(as.character(dd2$value))
write.csv(dd2, file = "dd2.csv",fileEncoding = "mac")
##############################################################################
qplot(variable,value, data = dd2, geom = "histogram")+ facet_wrap(~ cantons)
##############################################################################
qplot(variable,value, data = dd2, geom = "histogram")+ facet_wrap(~ cantons)+ opts(title = "Evaluation journée Genre 2011",axis.text.x=theme_text(angle=50),hjust=0)

ggplot(dd2,aes(variable,value))+geom_histogram()+facet_wrap(~cantons)









################################################
#################################################
data <- readHTMLTable ("http://www.encyclopedia-titanica.org/titanic-survivors/",skip.rows = integer(1),which = 1, header = TRUE)
y<-"http://www.encyclopedia-titanica.org/titanic-survivors/"
qw<-readHTMLTable (y,header = TRUE,sep=":")
summary(qw)
fd<-as.data.frame(qw)
summary(fd)
plot(fd)


























#############
######plyr#########
#############
?baseball
pieces <- split(baseball[,6:9], baseball$year)
summary(pieces[1:10])
print (baseball)



summary(esoph)
plot(print.table(summary(esoph)))
plot(esoph)