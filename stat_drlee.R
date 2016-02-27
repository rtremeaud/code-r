library(ggplot2)

stat_h <- read.csv("~/Desktop/\"R\" ou script/stat_h.csv")
stat_h$pref<-as.factor(stat_h$pref)
aa$Prise.en.charge.apres.la.sortie<-as.factor(aa$Prise.en.charge.apres.la.sortie)
aa<-subset(stat_h,pref=="MB",drop=TRUE)
mp<-subset(stat_h,pref=="MP",drop=TRUE)
aa$AGE_ADMIN<-as.factor(aa$AGE_ADMIN)
summary(aa)
#graph de base 
ggplot(aa,aes(aa$AGE_ADMIN))+geom_bar()+facet_wrap(~SEXE, ncol=1)+
  theme_minimal()
ggplot(aa,aes(aa$AGE_ADMIN))+geom_bar()+facet_wrap(~NATIONALITeS)+
  theme_minimal()


#####################
MS_FR_77354189_2012 <- read.delim("~/Desktop/MS_FR_77354189_2012.CSV")
ms<-MS_FR_77354189_2012
ms$pref<-as.factor(ms$pref)
mss<-subset(ms,pref=="MB",drop=TRUE)
alc<-subset(mss,Diagnostic.principal==c("F10","F100","F101","F1000","F1001","F1002","F1003","F1004","F1005","F1006","F1007"),drop=TRUE)
alc<-subset(mss,mss$Diagnostic.principal==c("Y910","Y911","Y912","Y913"))


ggplot(alc,aes(alc$AGE_ADMIN))+geom_bar()+facet_wrap(~SEXE, ncol=1)+
  theme_minimal()