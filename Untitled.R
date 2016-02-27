library(lubridate)
library(plyr)
library(googleVis)
ciao2014 <- read.csv("~/Desktop/projet ciao/ciao2014.csv")
ciao2014 <- ciao2014[,c(2,3,4,5,6,7,8,9,10,15)]
dd<-subset(dd,age< "26")
# 1.1 ---------------------------------------------------------------------
ciao2015 <- read.csv("~/Desktop/projet ciao/QR2015.csv")

# 1.1.1 -------------------------------------------------------------------

dd<-as.data.frame(table(ciao2014$region,ciao2014$date))
dd$Var2 <- as.Date(dd$Var2, format="%Y-%m-%d")
ggplot(dd,aes(dd$Var2,dd$Freq,group=dd$Var1))+geom_line(aes(colour=dd$Var1))
# 1.1.1 -------------------------------------------------------------------

str(ciao2014)
ciao2014$datenew<-as.Date(ciao2014$date)
ciao2014$daterep<-as.Date(ciao2014$daterep)

hist(month(ciao2014$date))
ciao2014$dat<-as.Date(ciao2014$date)
hist(ciao2014$datenew,breaks = "weeks",freq = TRUE)
frequency(ciao2014$dat)
week(ciao2014$daterep)
hist(week(ciao2014$daterep)
)
dd<-subset(ciao2014,ciao2014$date>input$dates[1] & ciao2014$date<input$dates[2])

# modification DATE plot() = FREQPOLY -------------------------------------
ciao2014$date <- as.Date(ciao2014$date, format="%Y-%m-%d")
ggplot(myData, aes(x=date, y=..count..)) + geom_histogram(alpha=0.9,fill="#000000",binwidth=1,linetype="dashed",size=0.1)
ggplot(myData, aes(x=date, y=..count.., group=theme)) + geom_freqpoly(aes(colour=theme))

ciao2014$date <- as.Date(ciao2014$date, format="%Y-%m-%d")
ggplot(ciao2014, aes(x=date, y=..count..)) + geom_histogram(alpha=0.9,fill="#000000",binwidth=1,linetype="dashed",size=0.1)

# 2 -----------------------------------------------------------------------

ggplot(data=dd2, aes(x=as.Date(date), y=Freq, group=value, colour=value)) +
  geom_line() +
  geom_point()

m <- ggplot(dd2, aes(y=as.numeric(Freq), x=as.Date(date)))
m + stat_smooth()

#################test donnees 2015
qr2015_2 <- read.csv("~/Desktop/projet ciao/qr2015_2.csv")
dnut<-as.data.frame(table(dd$app))
dnut<-as.data.frame(table(dd$sex))
dnut<-as.data.frame(table(dd$region))
library(googleVis)
## Doughnut chart - a pie with a hole
doughnut <- gvisPieChart(dnut, 
                         options=list(
                           width=500,
                           height=500,
                           slices="{0: {offset: 0.2},
                           1: {offset: 0.2},
                           2: {offset: 0.2}}",
                           title='Questions par sexe',
                           legend='none',
                           colors="['black','orange', 'blue', 
                           'red', 'purple', 'green']",
                           pieSliceText='label',
                           pieHole=0.5,footer='False
                           '))
plot(doughnut)




