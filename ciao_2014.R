library(lubridate)
library(reshape2)
library(amap)
library(xtable)
library(data.table)
library(ggplot2)

dd <- read.csv("~/Desktop/CIAO/rapport 2014/dd.csv")
#dd<- read.csv("E:/CORPUS/export_2010_01_01_2014_11_01.csv", sep=";")
#dd <- read.csv("~/Desktop/dd.csv", sep=",")
da<-dd[,2:11]

#############DATES AU FORMAT
dd$date<-as.POSIXct(dd$date, format="%Y-%m-%d %H:%M")
dd$daterep<-as.POSIXct(dd$daterep, format="%Y-%m-%d %H:%M")

dd$date <- dmy_hm(as.character(dd$date))
dd$daterep <- dmy_hm(as.character(dd$daterep))





dda2<-subset(x = dd,dd$sex=="Masculin" |dd$sex=="Feminin")
dda2<-droplevels(dda2)

###les ann?es
dd$annee<-year(dd$date)
dda2$parjour<-round_date(dda2$date,"day")
dda2$age<-as.numeric(dda2$age)
###
dda2$jourssemaine<-wday(dda2$date,TRUE)
xtable(table(dda2$jourssemaine))
table(dda2$mois,dda2$annee)
###les moins de 18 ans sur ciao
dd$age<-as.numeric(as.character(dd$age))
dda3<-subset(x = dd,dd$age<19)
dda3<-droplevels(dda3)

ddd<-dda2[,c(2,3,6,7,8,9,10,11,12)]

sa<-cut(x = yy$Freq,breaks = c(0,1,2,5,10,20,30,40,50,60,70,80,90))

dda2<-droplevels(dda2)
table(dda2$app,dda2$sex)
hist(dda3$age)
# table et graphe
dsa<-data.frame(table(dda2$annee,dda2$theme))
dsa<-melt(dsa)
ggplot(dsa,aes(dsa$Var1,dsa$value,group=dsa$Var2))+geom_line(aes(colour=dsa$Var2))+ scale_fill_brewer(palette="Set1")+
  labs(title = " Q&R Evolution sur 4 ans", x="ann?e", y="valeurs",colour="Th?mes")
