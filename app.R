#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#

library(shiny)
library(shinythemes)
source('predictWordDT.R')

# Define UI for application that draws a histogram
ui <- fluidPage(theme=shinytheme("superhero"),
   
   # Application title
   titlePanel("Word Up!"),
   h4("... a fast word prediction app"),
   textInput("x", label ="",placeholder = "Just start typing!",width = "100%"),
   h4(textOutput("word")),
   tags$head(tags$style("#word{
                               
                                word-spacing: 1.5em;
                                text-align: center;
                                font-weight: 300;
                                font-size: 24px;
                                
                        }",
                        "#x{ font-weight: 200;
                             font-size: 22px;
                             word-spacing: 0.5em;
                             text-align: left;}"
                         )
   )
   )
   server <- function(input, output) {
           output$word <- renderText({ 
                   predictWordDT(input$x,mdl,3) })
   }
   shinyApp(ui, server)

