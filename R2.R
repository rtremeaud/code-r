#------------------------------------------------------
library(ggplot2)
library(plyr)
library(lubridate)
library(reshape2)
library(amap)
library(xtable)
library(data.table)
#------------------------------------------------------
dd <- read.csv("~/Desktop/CIAO/CIAO_2ans_Q&R/CORPUS/export_2010_01_01_2014_01_012.csv", sep=";")
dd<-data.table(dd)
dd <- read.csv("~/Desktop/CIAO/ciao2014.csv")
dd<-dd[,1:10]
# Mise en forme date ------------------------------------------------------
dd$date<-as.character(dd$date)
dd$date<-as.POSIXct(dd$date, format="%Y-%m-%d %H:%M")
dd$daterep<-as.character(dd$daterep)
dd$daterep<-as.POSIXct(dd$daterep, format="%Y-%m-%d %H:%M")
da<-as.data.frame(table(dd$date))
da$date<-as.POSIXct(da$Var1, format="%Y-%m-%d %H:%M")
dd$age<-as.numeric(as.character(dd$age))
dd<-subset(dd,dd$age<26)
dd$jours<-weekdays(dd$date)

# Frequence des questions par pseudos & par sex ---------------------------
ff<-data.frame(table(dd$pseudo,dd$sex))
a<-subset(ff,ff$Freq>0)
table(a$Var2)
# Frequence par pseudo 2014----------------------------------------------------
dd$annee<-year(dd$date)
da<-subset(dd,dd$annee>2013)
aa<-data.frame(table(da$pseudo))
aa<-droplevels(aa)
plot(aa)
####################################################################################################
dda<-merge.data.frame(dd,da)
dd$jours<-weekdays(dd$date)
dda$age<-as.numeric(dda$age)
dd<-data.table(dda)
####################################################################################################
dd$age<-as.numeric(dd$age)
dd<-subset(dda,dda$age<26)
dd$jours<-as.factor(dd$jours)
dd$jours<-factor(dd$jours,levels = c("Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi","Dimanche"))
dda$année<-year(dda$date)
dda$mois<-month(dda$date)
#dda$mois<-factor(dda$mois,levels = c("Jan","Fev","Mars","Avr","Mai","Juin","Juil","Aout","Sept","Oct","Nov","Dec"))
###transformation
dda2<-subset(x = dda,dda$sex=="Masculin" |dda$sex=="Feminin")

###Graphiques
ggplot(dda)+geom_freqpoly(aes(dda$date))
ggplot(dda)+geom_bar(aes(dda$date,fill=dda$theme))
table(dda$theme)
###transformation
dda2<-subset(x = dda,dda$sex=="Masculin" |dda$sex=="Feminin")
ggplot(dda2)+geom_bar(aes(dda2$date,fill=dda2$theme))
ggplot(dda2, aes(dda2$date, ..count.., colour = dda2$theme)) +
  geom_freqpoly()+ scale_colour_brewer(palette="Set1")

