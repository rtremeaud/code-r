library(ggplot2)
library(lubridate)
library(reshape)
library(digest)
library(stargazer)
# xx ----------------------------------------------------------------------
aa <- read.csv("E/stats/HFRstamed_v3/HFR.csv")
# aa <- read.csv("~/Desktop/R/rfsm.csv")
aa<-read.csv("E:\\stats\\HFRstamed_v3\\HFR.csv")
aa<-subset(aa,pref=="MB",drop=TRUE)
#mp<-subset(stat_h,pref=="MP",drop=TRUE)
alc<-subset(aa, Diagnostic.principal %in% c("F100","F101","T510"))
alc<-alc[,1:39]
names(alc)
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

levels(alc$Type.de.prise.en.charge)[levels(alc$Type.de.prise.en.charge)=="1"] <- "Ambulatoire"

levels(alc$Centre.de.prise.en.charge.des.couts)[levels(alc$Centre.de.prise.en.charge.des.couts)=="100"] <- "Médecin. interne"
levels(alc$Centre.de.prise.en.charge.des.couts)[levels(alc$Centre.de.prise.en.charge.des.couts)=="200"] <- "Chirurgie"
levels(alc$Centre.de.prise.en.charge.des.couts)[levels(alc$Centre.de.prise.en.charge.des.couts)=="400"] <- "Pediatrie"
levels(alc$Centre.de.prise.en.charge.des.couts)[levels(alc$Centre.de.prise.en.charge.des.couts)=="900"] <- "Geriatrie"

levels(alc$Decision.de.sortie)[levels(alc$Decision.de.sortie)=="1"] <- "initiative du traitant"
levels(alc$Decision.de.sortie)[levels(alc$Decision.de.sortie)=="2"] <- "initiative du patient"
levels(alc$Decision.de.sortie)[levels(alc$Decision.de.sortie)=="3"] <- "tierce personne"
levels(alc$Decision.de.sortie)[levels(alc$Decision.de.sortie)=="4"] <- "Transfert interne"
levels(alc$Decision.de.sortie)[levels(alc$Decision.de.sortie)=="8"] <- "Autre"
alc$Sejour.apres.la.sortie<-as.factor(alc$Sejour.apres.la.sortie)
levels(alc$Sejour.apres.la.sortie)[levels(alc$Sejour.apres.la.sortie)=="1"] <- "Domicile"
levels(alc$Sejour.apres.la.sortie)[levels(alc$Sejour.apres.la.sortie)=="2"] <- "établ. de santé non hospit. médicalise"
levels(alc$Sejour.apres.la.sortie)[levels(alc$Sejour.apres.la.sortie)=="3"] <- "id. non médicalise"
levels(alc$Sejour.apres.la.sortie)[levels(alc$Sejour.apres.la.sortie)=="4"] <- "institution psychiatrique"
levels(alc$Sejour.apres.la.sortie)[levels(alc$Sejour.apres.la.sortie)=="5"] <- "institution de réadaptation"
levels(alc$Sejour.apres.la.sortie)[levels(alc$Sejour.apres.la.sortie)=="6"] <- "autre hopitaln"
levels(alc$Sejour.apres.la.sortie)[levels(alc$Sejour.apres.la.sortie)=="7"] <- "institution d’exécution des peines"
levels(alc$Sejour.apres.la.sortie)[levels(alc$Sejour.apres.la.sortie)=="8"] <- "autre"
levels(alc$grpage)[alc$grpage<=25] <- "-25ans"
levels(alc$grpage)[alc$grpage>25 & alc$grpage<=50] <- "-50ans"
levels(alc$grpage)[alc$grpage>50] <- "+50ans"

alc<-droplevels(alc)
alc$entree<-as.character(alc$Date.et.heure.d.admission)
alc$sortie<-as.character(alc$Date.et.heure.de.sortie)
alc$entree<-ymd_h(alc$entree)
alc$sortie<-ymd_h(alc$sortie)
alc$es<-interval(alc$entree,alc$sortie)
table(wday(alc$entree,label=TRUE))
tm<-hours(alc$es)/3600

alc$heure<-as.numeric(as.character(alc$es@.Data))
alc$nbheures<-(alc$heure/3600)
alc$age<-as.numeric(as.character(alc$AGE_ADMIN))
alc$grpage<-alc$age
#####################################################
require(sjPlot)
sjt.frq(alc$age,highlightQuartiles = TRUE,autoGroupAt=10)
sjt.frq(alc$entree)
sjt.xtab(alc$age,alc$SEXE)
###############groupe PCA
###############groupe PCA
###############groupe PCA
###############groupe PCA
alc$agepca<-alc$age
alc$agepca[alc$agepca<18] <- "-18"
alc$agepca[alc$agepca>=18 & alc$agepca<=24] <- "-24ans"
alc$agepca[alc$agepca>24 & alc$agepca<=34] <- "25ans-34ans"
alc$agepca[alc$agepca>34 & alc$agepca<=65] <- "34ans-65ans"
alc$agepca[alc$agepca>65] <- "+65ans"

plot(alc$nbheures)

table(wday(alc$entree,label=TRUE))

alc18<-subset(alc,agepca=="-18",drop=TRUE)










