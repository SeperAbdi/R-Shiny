# Load R packages
library(shiny)
library(shinythemes)


  # Define UI
  ui <- fluidPage(theme = shinytheme("cerulean"),
    navbarPage(                     # <------ the header of app
      # theme = "cerulean",  # <--- To use a theme, uncomment this
      "My first app",
      tabPanel("Navbar 1",          # <------ we have 3 taps here
               sidebarPanel(        # <------ you can put 
                 tags$h3("Input:"),
                 textInput("txt1", "First Name:", ""),
                 textInput("txt2", "Last Name:", ""),
                 
               ), # sidebarPanel
               mainPanel(
                            h1("Header 1"),
                            
                            h4("Output 1"),
                            verbatimTextOutput("txtout"),

               ) # mainPanel
               
      ), # Navbar 1, tabPanel
      tabPanel("Navbar 2", "This panel is intentionally left blank"),  # <------ we have another taps
      tabPanel("Navbar 3", "This panel is intentionally left blank")
  
    ) # navbarPage
  ) # fluidPage

  
  # Define server function  
  server <- function(input, output) {
    
    output$txtout <- renderText({
      paste( input$txt1, input$txt2, sep = " " )
    })
  } # server
  

  # Create Shiny object
  shinyApp(ui = ui, server = server)
