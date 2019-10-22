library(shiny)
library(shinydashboard)



source("helperfunctions.R")



ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  
  dashboardBody(
    # Use a fluid Bootstrap layout
    fluidPage(    
      
      # Give the page a title
      titlePanel("Amount of Food by Year"),
      
      # Generate a row with a sidebar
      sidebarLayout(
        
        # Define the sidebar with one input
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
  
  # Fill in the spot we created for a plot
  output$foodplot <- renderPlot({
    helperfunction1(input$year)})
}
  


shinyApp(ui, server)

