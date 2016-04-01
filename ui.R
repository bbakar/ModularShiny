library(shiny)

shinyUI(fluidPage(
  titlePanel("Price distributions - Modularized"),
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
  ),
  tabsetPanel(id = "cuts", 
              tabPanel("Data", dataTableOutput("table")),
              tabPanel("Ideal Cut", pricesModuleUI("ideal")),
              tabPanel("Premium Cut", pricesModuleUI("premium")),
              tabPanel("Good Cut", pricesModuleUI("good")),
              tabPanel("Very Good Cut", pricesModuleUI("veryGood")),
              tabPanel("Fair Cut", pricesModuleUI("fair"))
  )
))
