#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)
library(datasets)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  #Variables
  df <- transmute(mtcars,
                  Car = rownames(mtcars),
                  MPG = mpg, 
                  Cylinders= as.factor(cyl), 
                  Transmission = as.factor(am), 
                  Weight = wt, 
                  Horsepower = hp)
  #Plots
    output$plotHPbyMPG <- renderPlot({
        ggplot((df %>% 
              filter(
                Cylinders %in% input$cylCount,
                Weight >= input$weight[1],
                Weight <= input$weight[2],
                Horsepower >= input$horse[1],
                Horsepower <= input$horse[2],
                Transmission %in% input$trans)), aes(x = Horsepower, y = MPG, colour=factor(Cylinders), label = Car)) +
      geom_text(hjust = 0, nudge_x = 0.5) +
      geom_point() 
  })
  # Tables
    output$effTable <- renderDataTable({
    df <- transmute(mtcars,
                    Car = rownames(mtcars),
                    MPG = mpg, 
                    Cylinders= as.factor(cyl), 
                    Transmission = as.factor(am), 
                    Weight = wt, 
                    Horsepower = hp,
                    TripCost = input$commute / mpg * input$fuelcost)
    df %>% filter(
                  Cylinders %in% input$cylCount,
                  Weight >= input$weight[1],
                  Weight <= input$weight[2],
                  Transmission %in% input$trans)
    }) 
  
  
  
   
})
