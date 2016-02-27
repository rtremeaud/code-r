#require(devtools)
#install_github('ramnathv/rCharts')
library(rCharts)
library(shiny)
library(ggplot2)
library(rCharts)
library(reshape)
library(reshape2)
ciao2014 <- read.csv("~/Desktop/projet ciao/ciao2014.csv")
ciao2014 <- ciao2014[,c(2,3,4,5,6,7,8,9,10,15)]
ciao2014$date <- as.Date(ciao2014$date, format="%Y-%m-%d")

dd<-as.data.frame(table(ciao2014$region,ciao2014$date))
dd$Var2 <- as.Date(dd$Var2, format="%Y-%m-%d")
#dd<-subset(ciao2014,region==input$var)
shinyServer(function(input, output) {
   
  # graph total des questions par date --------------------------------------
  output$dates <- renderPlot({ 
    ciao20144<-subset(ciao2014,ciao2014$date > input$dates[1] & ciao2014$date < input$dates[2])
    
    ggplot(ciao20144, aes(x=date, y=..count..)) + geom_histogram(alpha=0.9,fill="#000000",binwidth=1,linetype="dashed",size=0.1)
    })
  
  output$text1 <- renderText({ 
    #paste("You have selected", input$var)
    paste("Répartition par sexe sur la période")
  })
  
  output$text2 <- renderText({ 
    paste("Total des questions réponses sur ciao.ch entre",
          input$dates[1], "to", input$dates[2])
  })
  output$var<-renderPlot({
    dd1<-subset(ciao2014,ciao2014$region == input$var)
    #dd<-as.data.frame(table(dd$region,dd$date))
     # ggplot(dd,aes(dd$date,dd$Freq))+geom_line()
    ggplot(dd1, aes(x=date, y=..count..)) + geom_histogram(alpha=0.9,fill="#000000",binwidth=1,linetype="dashed",size=0.1)
    
  })
  output$sex <- renderPlot({ 
    #input$var2
    #plot(ciao2014$sex)
    ggplot(ciao2014,aes(ciao2014$sex))+geom_bar()
})
}
)


