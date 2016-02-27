
# Une année de question CIAO soit 3857 questions:
# Profil par sexe:
xtable(table(data$sex))

aa<-data.frame(sort(table((data$region))))
xtable(table(data$region,data$sex))
table(data$Freq)
frequency(data$pseudo)
