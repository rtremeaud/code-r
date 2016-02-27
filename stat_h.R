library(ggplot2)
# xx ----------------------------------------------------------------------
mars <- read.csv("~")
aa <- read.csv("~/Desktop/R/stats/HFRstamed_v3/MS_FR_77354189_2012.csv")
alc<-subset(aa, Diagnostic.principal %in% c("F100","F101","T510"))
##########################################################################################################
alc$pref<-                        as.factor(alc$pref)
alc$Prise.en.charge.apres.la.sortie<- as.factor(alc$Prise.en.charge.apres.la.sortie)
alc$AGE_ADMIN<-                       as.factor(alc$AGE_ADMIN)
alc$Mode.d.admission<-                as.factor(alc$Mode.d.admission)
alc$Date.et.heure.d.admission<-                as.factor(alc$Date.et.heure.d.admission)
levels(alc$SEXE)[levels(alc$SEXE)=="2"] <- "Femme"
levels(alc$SEXE)[levels(alc$SEXE)=="1"] <- "Homme"
alc<-droplevels(alc)
##########################################################################################################
#ac<-subset(stat_h,pref=="MB",drop=TRUE)
#mp<-subset(stat_h,pref=="MP",drop=TRUE)
##########################################################################################################
ggplot(alc,aes(alc$AGE_ADMIN))+geom_histogram()+ theme(axis.title.x = element_text(face="bold", colour="#990000", size=20), axis.text.x  = element_text(angle=90, vjust=0.5, size=9))+xlab("My x label")+ ggtitle("Age des personnes lors de l'admission à Marsens\n statistiques hospitalières 2012")

##########################################################################################################
pp<-ggplot(aa,aes(aa$Mode.d.admission))+geom_histogram()+
 theme(axis.title.x = element_text(face="bold", colour="#990000", size=20),
  axis.text.x  = element_text(angle=45, vjust=0.9, size=9))+
  scale_x_discrete(labels=c("urgence","Planifiée","Naissances","Transfert","autre","Inconnu"))+
  xlab("My x label")+
   ggtitle("Mode d'admission à Marsens\n statistiques hospitalières 2012")
##########################################################################################################
pp+facet_wrap(~SEXE)
##########################################################################################################
pp1<-ggplot(aa,aes(aa$Mode.d.admission))+geom_histogram()+
 theme(axis.title.x = element_text(face="bold", colour="#990000", size=20),
  axis.text.x  = element_text(angle=45, vjust=0.9, size=9))+
  scale_x_discrete(labels=c("urgence","Planifiée","Naissances","Transfert","autre","Inconnu"))+
  xlab("My x label")+
   ggtitle("Mode d'admission à Marsens\n statistiques hospitalières 2012")
#########################################################################################################
ac$Date.et.heure.d.admission<-strptime(ac$Date.et.heure.d.admission, format="%Y-%m-%d  %H")
aa$Date.et.heure.de.sortie<-strptime(aa$Date.et.heure.de.sortie, format="%Y-%m-%d  %H")
#########################################################################################################
alc<-subset(aa, Diagnostic.principal %in% c("F100","F101","T510"))
alc$AGE_ADMIN<-as.factor(alc$AGE_ADMIN)
alc$Sejour.apres.la.sortie<-as.factor(alc$Sejour.apres.la.sortie)
alc<-droplevels(alc)
#########################################################################################################
ggplot(alc, aes(AGE_ADMIN)) + geom_dotplot() +
  facet_wrap(~ SEXE)
ggplot(alc, aes(AGE_ADMIN, fill=SEXE)) + geom_histogram(position="dodge")
#########################################################################################################
ggplot(alc,aes(alc$AGE_ADMIN))+geom_dotplot(binwidth = 0.5) +scale_y_continuous(name = "", breaks = 2)
 barchart(alc$AGE_ADMIN)
droplevels(alc)
plot(alc$CRYPT)
