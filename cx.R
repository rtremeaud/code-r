
# Données HFR -------------------------------------------------------------

HFR <- read.csv("/Volumes/NO NAME/stats/HFRstamed_v3/HFR.csv")
aa<-subset(HFR,pref=="MB",drop=TRUE)
str(aa$CRYPT)