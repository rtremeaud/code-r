library(ggplot2)
library(lubridate)
library(reshape)
library(xtable)
library(pastecs)
library (reporttools)
# PREINDICATION---------------------------------------------------------------------
data <- read.csv("~/Desktop/analyse ciao/data.csv", sep=",")
data <- read.csv("/Users/raf/Desktop/analyse ciao/ciao06_2013_06_2014.csv")
#optionX <- data[-which(data$app == ""), ]
###marche pasX$date<-as.Date(X$date, format = "%Y/%m/%d %H:%M")  
###########ca marche#######
data$date <- ymd_hm(as.character(data$date))
dd<-subset(data,select=c(app,age,sex,region,theme,pseudo,date))
#str(dd)
dddd<-as.data.frame(table(dd$pseudo))
dddd$pseudo<-dddd$Var1
table(dd$pseudo)
data<-merge.data.frame(dd,dddd)
#dddd<-table(dsa$pseudo)
print(xtable(table(data$age)))
###########REPORTTOOLS###############
NN<-data[,2:6]
tableNominal(vars = NN, cap = "Questions réponses CIAO Juin 2013-2014", vertical = FALSE, lab ="tab: nominal1", longtable = FALSE)
##########################
data2<-subset(data,age<25)
data2<-data
levels(data2$theme)<-c("argent","boire-fum","Discr_Racism","Fonct_CIAO","Form_Trav","Moi_Toi","Relig","Santé","Sexual","Violent")
##############
ggplot(data2[data2$age<21,],aes(age))+geom_histogram()+facet_wrap(~theme)
################
asd<-(count(data$Freq)
      + )

ggplot(data=data, aes(as.factor(data$age),data$Freq))+geom_point()
######################################################################
ggplot(data=data, aes(x=age, y=Freq, color=theme)) + 
  +     geom_point(pch=19, alpha=0.6, position='jitter', size=6)
#######################################################################
ggplot(data=data, aes(x=as.factor(age), y=Freq, color=factor(theme))) + 
  geom_point(pch=20, alpha=0.99, position='jitter', size=7)+theme_bw()+
  ggtitle('Primary School Enrollment - Regional Mean')
#######################################################################
ggplot(data=data, aes(x=factor(age), y=Freq, color=factor(theme))) + 
       geom_point(pch=20, alpha=0.99, position='jitter', size=7)+theme_bw()+facet_wrap( ~ theme)+
       ggtitle('Primary School Enrollment - Regional Mean')
########################################################################

options(scipen=100)
options(digits=2)
stat.desc(data$Freq)







aa<-names(data[,5:13])
data[, aa] <- sapply(data[, aa], as.numeric)
data$new <- rowSums( data[,4:12] )
summary(data)



ggplot(X,aes(X$Age))+geom_point()
X$age<-as.numeric(X$age)
hist(data$Age)
ggplot(data,aes(data$Age))+geom_density(aes(data$Age))




# 
# 
# 
# 
# # CIAO ----------------------------------------------------------------------
# data <- read.csv("~/Desktop/analyse ciao/data.csv")
# str(data)
# data$age<-as.numeric(data$age)
# data$date<-as.character(data$date)
# data$date<-ydm_hm(data$date)
# dotchart(data$age,groups=(data$pseudo))
# qplot(data$age,binwidth=0.1)+scale_x_discrete(breaks=13:25)
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# data[,5:13]        
# dd$ID<-1:33
# dd<-subset(data,select=c(AVS,Tremplin,RFSM,Radeau,Torry,Tremplinsocial,Tremplin.PH,CTA,REPER,Tremplin.Atelier))
# 
# # d ----------------------------------------------------------------------
# 
# 
#                                
#                                
# # graph et analyse --------------------------------------------------------
# as<-subset(ds,value=="1")
# plot(as$variable,labels = TRUE)
# ggplot(as,aes(as$variable))+geom_histogram()
# ggplot(ddd,aes(ddd$Var1,ddd$Freq),label_value())+geom_histogram()
# # -- ----------------------------------------------------------------------
# 
# 
# # fonction ----------------------------------------------------------------
# convert.magic <- function(obj, type){
#   +     FUN1 <- switch(type,
#                    +                    character = as.character,
#                    +                    numeric = as.numeric,
#                    +                    factor = as.factor)
#   +     out <- lapply(obj, FUN1)
#   +     as.data.frame(out)
#   + }
#   ------------------------------------------------------------------------
# #  ------------------------------------------------------------------------
# #  ------------------------------------------------------------------------
# #  ------------------------------------------------------------------------
