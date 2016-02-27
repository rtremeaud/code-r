library(ggplot2)
library(lubridate)
library(reshape)
# xx ----------------------------------------------------------------------
aa <- read.csv("~/Desktop/R/rfsm.csv")
aa<-subset(aa,pref=="MB",drop=TRUE)

rfsm<-subset(aa, Diagnostic.principal %in% c("F100","F101","T510"))
rfsm<-rfsm[,1:39]
##########################################################################################################
rfsm$pref<-                        as.factor(rfsm$pref)
rfsm$Prise.en.charge.apres.la.sortie<- as.factor(rfsm$Prise.en.charge.apres.la.sortie)
rfsm$AGE_ADMIN<-                       as.factor(rfsm$AGE_ADMIN)
rfsm$Mode.d.admission<-                as.factor(rfsm$Mode.d.admission)
rfsm$Date.et.heure.d.admission<-                as.factor(rfsm$Date.et.heure.d.admission)
rfsm$Decision.d.envoi<-                as.factor(rfsm$Decision.d.envoi)

levels(rfsm$SEXE)[levels(rfsm$SEXE)=="2"] <- "Femme"
levels(rfsm$SEXE)[levels(rfsm$SEXE)=="1"] <- "Homme"
levels(rfsm$Sejour.avant.l.admission)[levels(rfsm$Sejour.avant.l.admission)=="2"] <- "Domicile avec soins"
levels(rfsm$Sejour.avant.l.admission)[levels(rfsm$Sejour.avant.l.admission)=="1"] <- "Domicile"
levels(rfsm$Sejour.avant.l.admission)[levels(rfsm$Sejour.avant.l.admission)=="3"] <- "Etbl.sante.non.hospital.med"
levels(rfsm$Sejour.avant.l.admission)[levels(rfsm$Sejour.avant.l.admission)=="4"] <- "Etbl.sante.non.hospital.non.med"
levels(rfsm$Sejour.avant.l.admission)[levels(rfsm$Sejour.avant.l.admission)=="5"] <- "Hopital.psy"
levels(rfsm$Sejour.avant.l.admission)[levels(rfsm$Sejour.avant.l.admission)=="6"] <- "Autre.Hopital"
levels(rfsm$Sejour.avant.l.admission)[levels(rfsm$Sejour.avant.l.admission)=="7"] <- "IE.Peines"
levels(rfsm$Sejour.avant.l.admission)[levels(rfsm$Sejour.avant.l.admission)=="8"] <- "Autre"
levels(rfsm$Sejour.avant.l.admission)[levels(rfsm$Sejour.avant.l.admission)=="9"] <- "inconnu"

levels(rfsm$Mode.d.admission)[levels(rfsm$Mode.d.admission)=="1"] <- "urgence"
levels(rfsm$Mode.d.admission)[levels(rfsm$Mode.d.admission)=="2"] <- "annonce"
levels(rfsm$Mode.d.admission)[levels(rfsm$Mode.d.admission)=="3"] <- "naissance"
levels(rfsm$Mode.d.admission)[levels(rfsm$Mode.d.admission)=="4"] <- "transfert intern"
levels(rfsm$Mode.d.admission)[levels(rfsm$Mode.d.admission)=="5"] <- "transfert 24h"
levels(rfsm$Mode.d.admission)[levels(rfsm$Mode.d.admission)=="8"] <- "Autre"
levels(rfsm$Mode.d.admission)[levels(rfsm$Mode.d.admission)=="9"] <- "inconnu"

levels(rfsm$Decision.d.envoi)[levels(rfsm$Decision.d.envoi)=="1"] <- "Propre.initiative.proche"
levels(rfsm$Decision.d.envoi)[levels(rfsm$Decision.d.envoi)=="2"] <- "Service de sauvetage"
levels(rfsm$Decision.d.envoi)[levels(rfsm$Decision.d.envoi)=="3"] <- "Médecin"
levels(rfsm$Decision.d.envoi)[levels(rfsm$Decision.d.envoi)=="4"] <- "Thérapeutn"
levels(rfsm$Decision.d.envoi)[levels(rfsm$Decision.d.envoi)=="5"] <- "Servicesociaux"
levels(rfsm$Decision.d.envoi)[levels(rfsm$Decision.d.envoi)=="6"] <- "Inst.judiciaires"
levels(rfsm$Decision.d.envoi)[levels(rfsm$Decision.d.envoi)=="8"] <- "Autre"
levels(rfsm$Decision.d.envoi)[levels(rfsm$Decision.d.envoi)=="9"] <- "Inconnu"

levels(rfsm$Type.de.prise.en.charge)[levels(rfsm$Type.de.prise.en.charge)=="1"] <- "Ambulatoire"

levels(rfsm$Centre.de.prise.en.charge.des.couts)[levels(rfsm$Centre.de.prise.en.charge.des.couts)=="100"] <- "Médecin. interne"
levels(rfsm$Centre.de.prise.en.charge.des.couts)[levels(rfsm$Centre.de.prise.en.charge.des.couts)=="200"] <- "Chirurgie"
levels(rfsm$Centre.de.prise.en.charge.des.couts)[levels(rfsm$Centre.de.prise.en.charge.des.couts)=="400"] <- "Pediatrie"
levels(rfsm$Centre.de.prise.en.charge.des.couts)[levels(rfsm$Centre.de.prise.en.charge.des.couts)=="900"] <- "Geriatrie"
rfsm$Decision.de.sortie=as.factor(rfsm$Decision.de.sortie)

levels(rfsm$Decision.de.sortie)[levels(rfsm$Decision.de.sortie)=="1"] <- "initiative du traitant"
levels(rfsm$Decision.de.sortie)[levels(rfsm$Decision.de.sortie)=="2"] <- "initiative du patient"
levels(rfsm$Decision.de.sortie)[levels(rfsm$Decision.de.sortie)=="3"] <- "tierce personne"
levels(rfsm$Decision.de.sortie)[levels(rfsm$Decision.de.sortie)=="4"] <- "Transfert interne"
levels(rfsm$Decision.de.sortie)[levels(rfsm$Decision.de.sortie)=="8"] <- "Autre"
rfsm$Sejour.apres.la.sortie<-as.factor(rfsm$Sejour.apres.la.sortie)
levels(rfsm$Sejour.apres.la.sortie)[levels(rfsm$Sejour.apres.la.sortie)=="1"] <- "Domicile"
levels(rfsm$Sejour.apres.la.sortie)[levels(rfsm$Sejour.apres.la.sortie)=="2"] <- "établ. de santé non hospit. médicalise"
levels(rfsm$Sejour.apres.la.sortie)[levels(rfsm$Sejour.apres.la.sortie)=="3"] <- "id. non médicalise"
levels(rfsm$Sejour.apres.la.sortie)[levels(rfsm$Sejour.apres.la.sortie)=="4"] <- "institution psychiatrique"
levels(rfsm$Sejour.apres.la.sortie)[levels(rfsm$Sejour.apres.la.sortie)=="5"] <- "institution de réadaptation"
levels(rfsm$Sejour.apres.la.sortie)[levels(rfsm$Sejour.apres.la.sortie)=="6"] <- "autre hopitaln"
levels(rfsm$Sejour.apres.la.sortie)[levels(rfsm$Sejour.apres.la.sortie)=="7"] <- "institution d’exécution des peines"
levels(rfsm$Sejour.apres.la.sortie)[levels(rfsm$Sejour.apres.la.sortie)=="8"] <- "autre"
rfsm$grpage<-rfsm$age
rfsm$grpage[rfsm$age<=25] <- "-25ans"
rfsm$grpage[rfsm$age>25 & rfsm$age<=50] <- "-50ans"
rfsm$grpage[rfsm$age>50] <- "+50ans"

rfsm<-droplevels(rfsm)
rfsm$entree<-as.character(rfsm$Date.et.heure.d.admission)
rfsm$sortie<-as.character(rfsm$Date.et.heure.de.sortie)
rfsm$entree<-ymd_h(rfsm$entree)
rfsm$sortie<-ymd_h(rfsm$sortie)
rfsm$es<-interval(rfsm$entree,rfsm$sortie)
table(wday(rfsm$entree,label=TRUE))
tm<-hours(rfsm$es)/3600

rfsm$heure<-as.numeric(as.character(rfsm$es@.Data))
rfsm$nbheures<-(rfsm$heure/3600)
rfsm$age<-as.numeric(as.character(rfsm$AGE_ADMIN))
rfsmpp<-rfsm[,c("age","CRYPT","nbheures","grpage","SEXE","NATIONALITeS", "Sejour.avant.l.admission","Decision.d.envoi" ,"Decision.de.sortie","Sejour.apres.la.sortie","Prise.en.charge.apres.la.sortie")]
aa<-count(rfsmpp,"CRYPT")
 rfsmpp<-merge(rfsmpp,aa,by="CRYPT")