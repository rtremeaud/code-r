
load("/Users/raf/Desktop/BDD_caro/FormSPprincières.csv")
Dataset <- read.table("/Users/raf/Desktop/BDD_caro/FormSPprincières.csv", 
  header=TRUE, sep=";", na.strings="NA", dec=".", strip.white=TRUE)
results=catdes(Dataset[,c("SEXEARC", "NMI", "SEXEANT")] ,num.var=1,
  proba=0.05)
results$test.chi
results$quanti
results$category
Dataset.MCA<-Dataset[, c("IDEA", "AGE", "IDSP", "FIAB", "SEXEARC", 
  "SEXEANT", "ENCLOS", "orientation", "PF", "TBPLAT", "TERTRE", "CERCEUIL", 
  "structure", "situation", "SPDEV", "TAGE", "AGEPREC", "datation", 
  "SPETRANGER", "pays", "REUTILIS", "ADVENT", "NECTUM", "TTER", "HIERCH", 
  "MODIF76", "MODIF78", "TSPISOL", "CIMET")]
res<-MCA(Dataset.MCA, ncp=5, graph = FALSE)
plot.MCA(res, axes=c(1, 2), col.ind="black", col.ind.sup="blue", 
  col.var="darkred", col.quali.sup="darkgreen", label=c("ind", "ind.sup", 
  "quali.sup", "var", "quanti.sup"), invisible=c(""))
plot.MCA(res, axes=c(1, 2), choix="var", col.var="darkred", 
  col.quali.sup="darkgreen", label=c("var", "quali.sup"), invisible=c(""))
plot.MCA(res, axes=c(1, 2), choix="quanti.sup", col.quanti.sup="blue", 
  label=c("quanti.sup"))
remove(Dataset.MCA)
results<-HCPC(Dataset ,nb.clust=0,consol=0,min=3,max=10,cluster.CA="rows",
  graph=1)
results$data.clust[,ncol(results$data.clust),drop=F]
results$desc.var
results$desc.axes
results$desc.ind
Dataset.MFA<-Dataset[, c("AGE", "SEXEARC", "orientation")]
res<-MFA(Dataset.MFA, group=c(1, 1, 1), type=c("n", "n", "n"), ncp=5, 
  name.group=c("Gq1", "Gq2", "Gq3"), num.group.sup=c(), graph=FALSE)
plot.MFA(res, axes=c(1, 2), choix="group", lab.grpe=TRUE)
plot.MFA(res, axes=c(1, 2), choix="axes", habillage="group")
plot.MFA(res, axes=c(1, 2), choix="ind", lab.ind.moy=TRUE, lab.par=TRUE, 
  lab.var=TRUE, habillage=1, partial=c("1"))
remove(Dataset.MFA)
Dataset$ObsNumber <- 1:398
Hist(Dataset$ObsNumber, scale="frequency", breaks="Sturges", col="darkgray")
library(abind, pos=4)
.Table <- xtabs(~ ADVENT , data= Dataset )
.Table
prop.test(rbind(.Table), alternative='two.sided', p=.5, conf.level=.95, 
  correct=FALSE)
barplot(table(Dataset$ADVENT), xlab="ADVENT", ylab="Frequency")
library(colorspace, pos=4)
pbinom(c(0.25), size=1, prob=0.5, lower.tail=TRUE)
Dataset.PCA<-Dataset[, c("NMI", "ObsNumber")]
res<-PCA(Dataset.PCA , scale.unit=TRUE, ncp=5, graph = FALSE)
plot.PCA(res, axes=c(1, 2), choix="ind", habillage="none", col.ind="black", 
  col.ind.sup="blue", col.quali="magenta", label=c("ind", "ind.sup", "quali"))
plot.PCA(res, axes=c(1, 2), choix="var", col.var="black", 
  col.quanti.sup="blue", label=c("var", "quanti.sup"), lim.cos2.var=0)
remove(Dataset.PCA)

