pricesModuleUI <- function(id){
  ns <- NS(id)
  tagList(
    radioButtons(ns("clarity"), 
                 "Select Clarity:", 
                 choices = c(claritySelect), 
                 selected = NULL,
                 inline = TRUE),
    plotOutput(ns("priceHist")),
    h4("Summary"),
    verbatimTextOutput(ns("summ")),
    h4("Correlations"),
    verbatimTextOutput(ns("correlation"))
  )
}


pricesModule <- function(input, output, session, data, cutQual) {
  ydata <- reactive({
    temp <- filter(data, cut == cutQual)
    return(filter(temp, clarity == input$clarity))
  })
  
  output$priceHist <- renderPlot({
    qplot(ydata()$price, xlab = "Price (US $)", colour = I("white"))
  })
  
  output$summ <- renderPrint({
    summary(ydata())
  })
  
  output$correlation <- renderPrint({
    cor(ydata()[, sapply(ydata(), is.numeric)])
  })
}

