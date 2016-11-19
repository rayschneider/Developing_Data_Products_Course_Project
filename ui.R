#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


library(shiny)
library(ggplot2)
library(dplyr)
library(datasets)
library(markdown)
data(mtcars)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Car Fuel Economy Information"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("fuelcost",
                   "Gasoline Price Per Gallon:",
                   min = 1.00,
                   max = 5.00,
                   value = 2.50,
                   step = 0.05),
       sliderInput("commute",
                   "Length of Commute (Miles):",
                   min = 1,
                   max = 100,
                   value = 15,
                   step = 1),
       sliderInput("weight",
                   "Car Weight:",
                   min = min(mtcars$wt),
                   max = max(mtcars$wt),
                   value = c(min(mtcars$wt),max(mtcars$wt))),
       sliderInput("horse",
                   "Car Horsepower:",
                   min = min(mtcars$hp),
                   max = max(mtcars$hp),
                   value = c(min(mtcars$hp),max(mtcars$hp)),
                   step = 1),
       checkboxGroupInput("cylCount", 
                          label = "Cylinders:",
                          choices = unique(as.character(mtcars$cyl)),
                          selected = c(6,4,8)),
       checkboxGroupInput("trans", 
                          label = "Transmission:",
                          choices = list("Automatic" = 0, "Manual" = 1),
                          selected = c(0,1))
       
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Fuel Cost Table", dataTableOutput("effTable")),
        tabPanel("MPG Graph", plotOutput("plotHPbyMPG")),
        tabPanel("Documentation",
                 mainPanel(
                   includeMarkdown("documentation.md"))
      )
    )
    
  )
)
)
)


    
   
  
