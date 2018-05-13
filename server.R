server <- function(input, output, session) {
  data <- reactive({
    inFile <- input$file1
    if (is.null(inFile)) return(NULL)
    read.csv(inFile$datapath)
  })
  
  observeEvent(data(), {
    updateSelectInput(session, "col", choices = names(data()))
    updateSelectInput(session, "col1", choices = names(data()))
  })
  
  output$caption <- renderText({
    input$title
  })
  output$summary <- renderPrint({
    dataset <- req(data())
    summary(dataset)
  })
  output$selected <- renderText({
    req(data())
    paste0("You've selected the column named ", input$col, 
           ". The average number of students taking ", input$col," around local universities in Malaysia is : ", mean(data()[[input$col]]))
  })
  output$text <- renderText({
    req(data())
    paste0("You've selected the column named ", input$col1, ". Below is the histogram for ", input$col1 , ".")
  })
  output$histogram <- renderPlot({
    req(data())
    title <- "Histogram"
    hist(data()[[input$col1]])
  })
  
  output$view <- renderTable({
    req(data())
    head(data(), n = input$obs)
  })
  
  output$text1 <- renderText({
    paste0("Summary of dataset")
  })
  output$text2 <- renderText({
    paste0("Observations")
  })
  output$text3 <- renderText({
    paste0("Mean")
  })
  output$text4 <- renderText({
    paste0("Histogram")
  })
  
  
}