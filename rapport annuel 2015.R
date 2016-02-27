library(googleVis)
library(lubridate)
library(plyr)
library(googleVis)
library(ggplot2)
#ciao2014 <- read.csv("~/Desktop/projet ciao/ciao2014.csv")
#ciao2014 <- ciao2014[,c(2,3,4,5,6,7,8,9,10,15)]
dd <- read.csv("~/Desktop/projet ciao/qr2015_2.csv")
dd<-subset(dd,age< "26")
plot(as.data.frame(table(dd$repondant)))
###########################################################
dnut3<-as.data.frame(table(dd$app))
dnut2<-as.data.frame(table(dd$sex))
dnut<-as.data.frame(table(dd$region))
###graph par date####################
dd2<-as.data.frame(table(dd$region,dd$date))
dd2$Var2 <- as.Date(dd2$Var2, format="%Y-%m-%d")
ggplot(dd2,aes(dd2$Var2,dd2$Freq))+geom_line()
ggplot(dd2, aes(x=Var2, y=..count..)) + geom_histogram(alpha=0.9,fill="#000000",binwidth=1,linetype="dashed",size=0.1)

######################################Doughnut chart - a pie with a hole

# donuts fonction gvis ------------------------------------------------------------------
doughnut <- gvisPieChart(dnut, 
                         options=list(
                           width=500,
                           height=500,
                           slices="{0: {offset: 0.2},
                           1: {offset: 0.2},
                           2: {offset: 0.2},
                           3: {offset: 0.2}}",
                           title='Questions par régions',
                           legend='none',
                           colors="['black','orange', 'blue', 
                           'red', 'purple', 'green']",
                           pieSliceText='label',
                           pieHole=0.5,footer='FALSE'))
doughnut2 <- gvisPieChart(dnut2, 
                         options=list(
                           width=800,
                           height=800,
                           slices="{0: {offset: 0.2},
                           1: {offset: 0.2},
                           2: {offset: 0.2}}",
                           title='Questions par sexe',
                           legend='-------',
                           colors="['black','orange', 'blue', 
                           'red', 'purple', 'green']",
                           pieSliceText='label',
                           pieHole=0.5,footer='FALSE'))
doughnut3 <- gvisPieChart(dnut3, 
                          options=list(
                            width=300,
                            height=300,
                            slices="{0: {offset: 0.2},
                            1: {offset: 0.2},
                            2: {offset: 0.2}}",
                            title='Questions par app',
                            legend='none',
                            colors="['red', 'green']",
                            pieSliceText='label',
                            pieHole=0.5,footer='FALSE'))
plot(gvisMerge(doughnut,doughnut2))
