library(shiny)
library(shinydashboard)
library(DT)
library(data.table)

data <- readRDS('C:\\users\\UJJVAL\\Desktop\\european_soccer.rds');

ui <- 
  
  dashboardPage(
    dashboardHeader(),
    dashboardSidebar(),
    
    dashboardBody(
      fluidRow(
        
        box(
          title = "League",
          selectInput("league","selectleague", c(data$home_team, data$away_team))
          
        ),
        DT::dataTableOutput("data")
      )
      
    ),
    mainPanel(
      tableOutput("data")
      
    )
  )

server <- function(input, output) { 
  output$data <- DT::renderDataTable({data})
  
}

shinyApp(ui, server)
