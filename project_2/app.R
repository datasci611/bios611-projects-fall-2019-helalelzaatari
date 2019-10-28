
library(shinydashboard)
source("helper_function.R")

# Loading helper functions

ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody(
    fluidPage(    
      
      # Give the page a title
      
      titlePanel("Amount of Food by Year"),
      
      # Generate a row with a sidebar
      sidebarLayout(
        
        # Define the sidebar with one input which is the years from 2008-2018
        sidebarPanel(
          selectInput("year", "Year:", 
                      choices=list("2008" = 2008, "2009" = 2009, "2010" = 2010, "2011"= 2011,
                                   "2012" = 2012, "2013" = 2013, "2014" = 2014, "2015"= 2015,
                                   "2016" = 2016, "2017" = 2017, "2018" = 2018)),
          hr(),
          helpText("Data from Urban Ministries of Durham.")
        ),
        
        # Create a spot for the barplot
        mainPanel(
          plotOutput("foodplot")  
        )
        
      )
    )
  )
)

server <- function(input, output) {
  # renderPlot creates barplot and links to ui
  output$foodplot <- renderPlot({
    helper_function(as.numeric(input$year))
  })
  
}

shinyApp(ui, server)