#------------------------------------------------------
library(ggplot2)
library(plyr)
library(lubridate)
library(reshape2)
library(amap)
library(xtable)
library(data.table)

#dd <- read.csv("~/Desktop/CIAO/coder_rapp_activ_2014/Untitled 1.csv")
dd <- read.csv("~/Desktop/CIAO/coder_rapp_activ_2014/QR.csv")
dd<-dd[,1:10]
# Mise en forme date ------------------------------------------------------

dd$date<-as.character(dd$date)
dd$date<-as.POSIXct(dd$date, format="%Y-%m-%d %H:%M")
dd$daterep<-as.character(dd$daterep)
dd$daterep<-as.POSIXct(dd$daterep, format="%Y-%m-%d %H:%M")
dd$age<-as.numeric(as.character(dd$age))
dd$jours<-weekdays(dd$date)
dd$mois<-month(dd$date)
pseudo<-data.frame(table(dd$pseudo))
pseudo$Freq<-as.numeric(pseudo$Freq)
d<-merge(dd,pseudo)

# -- ----------------------------------------------------------------------

# -- visiteurs unique----------------------------------------------------------------------
pseudo<-data.frame(table(dd$pseudo))
pseudo$Freq<-as.numeric(pseudo$Freq)
plot(as.factor(pseudo$Freq),cex.axis=0.5)

# -- ----------------------------------------------------------------------
qq<-subset(pseudo,subset = pseudo$Freq >2)
pseudo$pseudo<-pseudo$Var1
d<-merge(dd,pseudo)

# -- visiteurs unique----------------------------------------------------------------------
pseudo<-data.frame(table(dd$pseudo))
pseudo$Freq<-as.numeric(pseudo$Freq)
qplot(data=pseudo,x = as.factor(pseudo$Freq),geom ="bar" )

# -- visiteurs unique----------------------------------------------------------------------
pseudo<-data.frame(table(dd$pseudo))
pseudo$Freq<-as.numeric(pseudo$Freq)

# -- ----------------------------------------------------------------------
qq<-subset(pseudo,subset = pseudo$Freq >2)
xtable(table(hus$sex,hus$app),caption = "+ de 3questions",)
hus<-subset(dd,subset = dd$Freq >3)

hus<-subset(dd,subset = pseudo$pseudo >3)
hus<-subset(dd,subset = ddFreq >3)

