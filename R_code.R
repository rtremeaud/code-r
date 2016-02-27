library(ggplot2)
library(lubridate)
library(reshape)
# xx ----------------------------------------------------------------------
aa <- read.csv("~/Desktop/R/stats/rfsm.csv")
alc<-subset(aa, Diagnostic.principal %in% c("F100","F101","T510"))
alc<-alc[,1:39]
##########################################################################################################
alc$pref<-                        as.factor(alc$pref)
alc$Prise.en.charge.apres.la.sortie<- as.factor(alc$Prise.en.charge.apres.la.sortie)
alc$AGE_ADMIN<-                       as.factor(alc$AGE_ADMIN)
alc$Mode.d.admission<-                as.factor(alc$Mode.d.admission)
alc$Date.et.heure.d.admission<-                as.factor(alc$Date.et.heure.d.admission)
alc$Decision.d.envoi<-                as.factor(alc$Decision.d.envoi)

levels(alc$SEXE)[levels(alc$SEXE)=="2"] <- "Femme"
levels(alc$SEXE)[levels(alc$SEXE)=="1"] <- "Homme"
levels(alc$Sejour.avant.l.admission)[levels(alc$Sejour.avant.l.admission)=="2"] <- "Domicile avec soins"
levels(alc$Sejour.avant.l.admission)[levels(alc$Sejour.avant.l.admission)=="1"] <- "Domicile"
levels(alc$Sejour.avant.l.admission)[levels(alc$Sejour.avant.l.admission)=="3"] <- "Etbl.sante.non.hospital.med"
levels(alc$Sejour.avant.l.admission)[levels(alc$Sejour.avant.l.admission)=="4"] <- "Etbl.sante.non.hospital.non.med"
levels(alc$Sejour.avant.l.admission)[levels(alc$Sejour.avant.l.admission)=="5"] <- "Hopital.psy"
levels(alc$Sejour.avant.l.admission)[levels(alc$Sejour.avant.l.admission)=="6"] <- "Autre.Hopital"
levels(alc$Sejour.avant.l.admission)[levels(alc$Sejour.avant.l.admission)=="7"] <- "IE.Peines"
levels(alc$Sejour.avant.l.admission)[levels(alc$Sejour.avant.l.admission)=="8"] <- "Autre"
levels(alc$Sejour.avant.l.admission)[levels(alc$Sejour.avant.l.admission)=="9"] <- "inconnu"

levels(alc$Mode.d.admission)[levels(alc$Mode.d.admission)=="1"] <- "urgence"
levels(alc$Mode.d.admission)[levels(alc$Mode.d.admission)=="2"] <- "annonce"
levels(alc$Mode.d.admission)[levels(alc$Mode.d.admission)=="3"] <- "naissance"
levels(alc$Mode.d.admission)[levels(alc$Mode.d.admission)=="4"] <- "transfert intern"
levels(alc$Mode.d.admission)[levels(alc$Mode.d.admission)=="5"] <- "transfert 24h"
levels(alc$Mode.d.admission)[levels(alc$Mode.d.admission)=="8"] <- "Autre"
levels(alc$Mode.d.admission)[levels(alc$Mode.d.admission)=="9"] <- "inconnu"

levels(alc$Decision.d.envoi)[levels(alc$Decision.d.envoi)=="1"] <- "Propre.initiative.proche"
levels(alc$Decision.d.envoi)[levels(alc$Decision.d.envoi)=="2"] <- "Service de sauvetage"
levels(alc$Decision.d.envoi)[levels(alc$Decision.d.envoi)=="3"] <- "Médecin"
levels(alc$Decision.d.envoi)[levels(alc$Decision.d.envoi)=="4"] <- "Thérapeutn"
levels(alc$Decision.d.envoi)[levels(alc$Decision.d.envoi)=="5"] <- "Servicesociaux"
levels(alc$Decision.d.envoi)[levels(alc$Decision.d.envoi)=="6"] <- "Inst.judiciaires"
levels(alc$Decision.d.envoi)[levels(alc$Decision.d.envoi)=="8"] <- "Autre"
levels(alc$Decision.d.envoi)[levels(alc$Decision.d.envoi)=="9"] <- "Inconnu"


alc<-droplevels(alc)
alc$entree<-as.character(alc$Date.et.heure.d.admission)
alc$sortie<-as.character(alc$Date.et.heure.de.sortie)
alc$entree<-ymd_h(alc$entree)
alc$sortie<-ymd_h(alc$sortie)
alc$es<-interval(alc$entree,alc$sortie)
table(wday(alc$entree,label=TRUE))
tm<-hours(alc$es)/3600
########################################################################################################
#ac<-subset(stat_h,pref=="MB",drop=TRUE)
#mp<-subset(stat_h,pref=="MP",drop=TRUE)
##########################################################################################################
p<-ggplot(alc,aes(alc$AGE_ADMIN, fill=alc$SEXE))+geom_histogram(binwidth=.5, alpha=.5, position="identity")+
  theme(axis.title.x = element_text(face="bold", colour="#990000", size=20), axis.text.x  = element_text(angle=90, vjust=0.5, size=9))+
  xlab("Age des personnes à l'admission")+ #theme_bw()+
  scale_y_continuous(breaks=seq(0, 8, 1))+
  ggtitle("Age des personnes lors de l'admission pour coma alcolique statistiques hospitalières 2012")
pp<-p + annotate("segment", x = "25", xend = 10, y = 0, yend = 25,
             colour = "blue")
ppp<-pp + annotate("text", x = "20", y = 5, label = "- de 25 ans")
ppp+ annotate("text", x = "64", y = 6, label = " Min= 13 Mean= 45.47  Max=89 ")+
  annotate("text", x = "64", y = 5.75, label = "1stQu= 31 Median= 48 3rdQu= 56 ")+
  annotate("rect", xmin = "55", xmax = "75", ymin = 5.5, ymax = 6.5, alpha = .1)
##########################################################################################################
pp<-ggplot(alc,aes(alc$Mode.d.admission))+geom_histogram()+
  theme(axis.title.x = element_text(face="bold", colour="#990000", size=20),
        axis.text.x  = element_text(angle=45, vjust=0.9, size=9))+
  scale_x_discrete(labels=c("urgence","Planifiée","Naissances","Transfert","autre","Inconnu"))+
  xlab("My x label")+
  ggtitle("Mode d'admission statistiques hospitalières 2012")
##########################################################################################################
library(ggplot2)
library(grid)

data_x <- 5:10
data_y <- 6:11
a <- qplot(data_x, data_y, xlim=c(0, 15), ylim=c(0, 15), size=data_x)
b <- qplot(data_x, data_y, xlim=c(5, 10), ylim=c(5, 10), size=data_x) + theme(legend.position="none")
c <- qplot(data_y, data_y, xlim=c(7.5, 9.5), ylim=c(7.5, 10.5),  size=data_x) + theme(legend.position="none")

vpb <- viewport(width = 0.3, 
                height = 0.3, 
                x = 0.3, 
                y = 0.8)

vpc <- viewport(width = 0.3, 
                height = 0.3, 
                x = 0.9, 
                y = 0.3)

# print and overlap
print(a)
print(b, vp = vpb)
print(c, vp = vpc)

main<-ggplot(alc,aes(alc$age,alc$nbheures))+geom_point()+labs(x=NULL,y=NULL)+scale_x_continuous("", breaks=NA)+scale_y_continuous("", breaks=NA)
alc2<-subset(alc,alc$nbheures<100)
sub<-ggplot(alc2,aes(alc2$age,alc2$nbheures))+geom_point()
vpb <- viewport(width = 0.2 
                height = 0.2, 
                x = 0.1, 
                y = 0.1)
xquiet<- scale_x_continuous("", breaks=NA) yquiet<-scale_y_continuous("", breaks=NA) quiet<-list(xquiet, yquiet)
+ theme(axis.ticks.length = unit(0.001, "mm")) + labs(x=NULL, y=NULL)
print(sub)
print(main, vp = vpc)



























