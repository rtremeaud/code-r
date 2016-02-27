shinyUI(fluidPage(
  titlePanel("Ciao Q&R"),
  as.character(img("logo_ciao_rvb.png")),
  sidebarLayout(
    sidebarPanel(
      helpText("Monitoring des questions réponses sur CIAO"),
     
      #dateInput("date", label = "Date input", value = "2014-01-01"),
      
      dateRangeInput("dates",language = "fr", label = "Période prise en compte",start = "2014-01-01",end = "2015-01-01",min ="2014-01-01",max = "2015-01-01" ),
     
      selectInput("var", 
                 label = "Nombre de questions par region",
                  choices = levels(ciao2014$region),
                  selected =)
    #  actionButton("var2",label = "Q&R par sexe")
      
      ),
 # Ordre d’apparition des graphiques ---------------------------------------
    
    mainPanel(textOutput("text2"),
              plotOutput(outputId = "dates"),
              textOutput("text1"),
              plotOutput(outputId = "sex"),
              plotOutput(outputId = "var")
              



                            )
  )
))