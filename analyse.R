library("plyr")
library("ggplot2")
library("reshape")
library("xtable")
mobspp <- read.csv("~/Desktop/BDD_caro/mobspp.csv", sep=";")
head(mobspp)IDEA
dd<-melt(mobspp,id=c("IDEA","IDSP"),measure.vars=c("IDchronodebut","IDchronofin","objet","NMI2","categorie.fonctionnelle","materiau"))
head(mobspp)
levels(dd$value)
summary(dd)
cor(mobspp$objet,mobspp$materiau)
####################################################################
#####################creer des frequences pour facteur        ######
dsa<-as.data.frame(table(mobspp$materiau))      #####################
ddfreq<-merge(mobspp,dsa,by.x="materiau",by.y="Var1")       ##########
####################################################################
function(j) {
for i in j
k<-as.data.frame(table(i))
l<-merge(j,k,by.x="materiau",by.y="Var1")
#####a noter
at(names(mobspp))##chpe les noms
cat(names(mobspp[2]))####chope le deuxi�me nom
#################
chisq.test(mobspp)
###########################################################

mosaicplot(mobspp$categorie.fonctionnelle,mobspp$materiau)

xx<-as.data.frame(xx)
dd<-merge.data.frame(xx,mobspp,by.x=row.names(xx),by.y=mobspp$objet)
dd<-melt(mobspp,id.vars=c("IDEA","IDSP"), measured = c("IDchronodebut","IDchronofin","objet","categorie.fonctionnelle","materiau"))
write.table(dd,"dd")
View(dd)
ddd<-ddply(mobspp, c("IDEA","objet"), function(df)mean(df$v1))
ordered(ddd$objet)















########################################################################################################################################################
########################################################################################################################################################
ggplot(mobspp, aes(x=IDchronodébut, y=..count..)) + geom_histogram()+opts(title="comptage par période")############################################################################
########################################################################################################################################################
ggplot(mobspp, aes(x=objet, y=..count..)) + geom_histogram()+opts(title="objet",axis.text.x=theme_text(angle=-90,hjust=0))############################################################################
aa+opts(axis.text.x=theme_text(angle=-90,hjust=0))
########################################################################################################################################################
bb<-ggplot(mobspp, aes(x=catégorie.fonctionnelle, y=..count..)) + geom_histogram()+opts(title="catégorie.fonctionnelle")############################################################################
bb+opts(axis.text.x=theme_text(angle=-90,hjust=0))
########################################################################################################################################################
cc<-ggplot(mobspp, aes(x=catégorie.fonctionnelle, y=..count..,group=IDchronodébut)) + geom_histogram(aes(fill=IDchronodébut))+opts(title="catégorie.fonctionnelle")
cc+opts(axis.text.x=theme_text(angle=-90,hjust=0))
####################################################################################################################################################################################################################################
dd<-ggplot(mobspp, aes(x=IDchronodebut, y=..count..))+geom_histogram()+facet_wrap(~catégorie.fonctionnelle,ncol = 7)+opts(title="catégorie.fonctionnelle")
ddd+opts(axis.text.x=theme_text(angle=45,hjust=1,size=6))
dd####################################################################################################################################################################################################################################
dd+facet_grid(catégorie.fonctionnelle~.,scales = "free", space = "free")
########################################################################################################################################################
chisq.test(mobspp$catégorie.fonctionnelle,mobspp$IDchronodébut)
plot(mobspp$IDchronodebut)
####################################################################################################################################################################################################################################
