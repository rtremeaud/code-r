library(XML)
u<-"http://www.suchtmonitoring.ch/fr/table/802.html"
u<-readHTMLTable(u,header=TRUE,skip.rows=1)
dd<-u[[1]]
 d<-dd[2:6,2:8]
 