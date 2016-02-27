
# !!! symbole => ca veut dire commentaire ;) A LIRE !

# avec comme base un tableau excel genre : (j'ai eu ton ficher : sympathique le format xlsx lit donc un truc ou deux, sur la recherche reproductible....)
#sépulture A       2      bracelet       bronze
#sépulture A       5      perle          verre
#sépulture A       1      vase           céramique
#sépulture B       3      bracelet       fer
#je te donne des valeurs style : un bracelet vaut 2, une perle 2, 
#un vase 1, et les matériaux sont en bonus genre verre =+5 
#(attention la c complexe, je veux que ce soit la ligne qui vaille +5 pas chaque perle)
#ce qui donnerai au final : sépulture A = 20, sépulture B = 6
########################################################################
#### “et hop !“ le nouveau language informatique de caroline trémeaud ##
########################################################################
# un truc qui serait trop de la balle c'est un script que je pourrais modifier 
#-> BEN OUAIS : SI TU SAIS LE LIRE, TU EN AS UN DEVANS TOI !!!

#(moui car les valeurs dépendront de la chrono : genre au bronze ancien 
#ou on met quasi rien dans les sépultures avoir un vase c'est déjà top classe 
# 1500 ans après avoir un vase c'est le bouseux du coin)
# ->SANS DECONNER, JE ME DEMANDAIS SI T'ALLAIS BOSSER !!! REGARDES LES ECHELLES LogarithmiqueS:


#comme ça je fais mon tableau pour chaque nécropole, 
#je vais voir dans le script pour genre mettre 2 à vase et 5 a bracelet et hop  je le lance et
#il m'ouvre une nouvelle feuille  avec un tableau sépulture a = XXXX sépulture b = XXX
# -> là je pense que tu devrais introduire 
# un critère de "site_ranking" genre: gros site bien exploité= 20, petit de merde = 2 ?

#encore meme mieu si j'ai oublié une valeur : genre je lui ai pas dit combien valait  "verre" ben il me met ERRORsur la ligne de la sépulture A 
#et hop je sais ou vérifier
## (blague perceval)C e serait pas plus simple de t'exporter le tableau des sites id où y'a un os ???


#DEBUT D'ANALYSE'
# dans R j'utilise on "library" qui ont l'avantage de fournir des outils : chalumeau, perceuse, meuleuse, etc. 
# le jour ou il fait la vaisselle il peut dormir à la maison.

library ("plyr")
library ("ggplot2")
library ("reshape")
library("XML")
library("knitr")

data <- read.csv("~/Desktop/data.csv")
# attention aux accents
# structure du jeu de donnée
str(data)

ggplot(data,aes(data$mat�riau))+geom_histogram()

ggplot(data,aes(data$mat�riau,data$datation))+geom_point(aes(size = data$mat�riau)) +
opts(axis.text.x=theme_text(angle=90))

ggplot(data,aes(data$datation,data$mat�riau))+geom_point(aes(size = data$mat�riau)) +  
  theme(axis.text.x=theme_text(angle=90)) +
  theme(legend.text=theme_text(size=14))

plot(data$mat�riau~data$datation)+
  axis(2, las=2, cex.axis=0.8)

  title(main="BUCY plot(data$mat�riau~data$datation)", col.main="red", font.main=4)
xaxis(3,cex.axis=0.7)
  
  as

