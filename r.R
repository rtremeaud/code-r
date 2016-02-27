library(ggplot2)
library(plyr)
library(lubridate)
library(reshape2)
library(amap)
library(data.table)
####################################################################################################
export_qr12.14 <- read.csv("/Users/raf/Desktop/CIAO/CIAO_2ans_Q&R/export_qr12-14.csv", sep=";")
dd<-export_qr12.14
dd$dateQ<-as.character(dd$date)
dd$dateQ<-as.POSIXct(dd$dateQ, format="%Y-%m-%d %H:%M")
####################################################################################################
da<-as.data.frame(table(dd$dateQ))
da$dateQ<-as.POSIXct(da$Var1, format="%Y-%m-%d %H:%M")
####################################################################################################
dda<-merge.data.frame(dd,da)
dda$jours<-weekdays(dda$dateQ)
dda$age<-as.numeric(dda$age)
####################################################################################################
dda$age<-as.numeric(dda$age)
dd<-subset(dda,dda$age<26)
dd$jours<-as.factor(dd$jours)
dd$jours<-factor(dd$jours,levels = c("Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi","Dimanche"))

# stat --------------------------------------------------------------------
aa<-table(dd$jours,dd$theme)
k2aa<-chisq.test(aa)
k2aa$observed
chisq.test(dd$sex,dd$theme)
chisq.test(dd$theme,as.factor(dd$age))
# Yearth#month --------------------------------------------------------------------
dd$month<-month(dd$dateQ)
dd$month<-as.factor(dd$month)
 dd$year<-year(dd$dateQ)
levels(dd$month)<-c("Jan","Fev","Mars","Avr","Mai","Jun","Juil","Aout","Spt","Oct","Nov","Dec")
hist(dd$month~dd$year)
####################################################################################################
as.factor
("Jan","Fev","Mars","Avr","Mai","Jun","Juil","Aout","Spt","Oct","Nov","Dec")








