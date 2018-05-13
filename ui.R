fluidPage(
  
  # App title ----
  titlePanel("A simple app to observe your data! Enjoy!"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    sidebarPanel(
      p('This is a simple app for you to observe your CSV file. You can check the mean and produce a histogram using the columns inside the dataset.'),
      fileInput("file1", "Choose CSV File, make sure your file in CSV format!"),
      p('You can add your own title in the textbox below!'),
      textInput("title", label = "Title:", value = "", placeholder = "Enter your title here"),
      p('Choose how many data you want to display.'),
      numericInput(inputId = "obs",label = "Number of observations to view:",value = 10),
      p('Choose which column you want to know the mean.'),
      selectInput("col", "Select a column: ", character(0)),
      p('Chose which column you want to produce a histogram.'),
      selectInput("col1", "Select a column: ", character(0))
    ),
    mainPanel(
      h1(textOutput("caption", container = span)),
      h2(textOutput("text1")),
      verbatimTextOutput("summary"),
      h2(textOutput("text2")),
      tableOutput("view"),
      h2(textOutput("text3")),
      textOutput("selected"),
      h2(textOutput("text4")),
      textOutput("text"),
      plotOutput("histogram")
      
    )
  )
)