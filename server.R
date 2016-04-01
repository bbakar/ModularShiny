shinyServer(function(input, output) {
  
  output$table <- DT::renderDataTable(as.data.frame(diamonds))
  
  callModule(pricesModule, "ideal", diamonds, cutQual = "Ideal")
  callModule(pricesModule, "premium", diamonds, cutQual = "Premium")
  callModule(pricesModule, "good", diamonds, cutQual = "Good")
  callModule(pricesModule, "veryGood", diamonds, cutQual = "Very Good")
  callModule(pricesModule, "fair", diamonds, cutQual = "Fair")
  
})