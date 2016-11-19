---
title: "Documentation"
author: "Raymond Schneider"
date: "November 19, 2016"
output: html_document
---

## About

This Shiny app was developed for the Coursera course Developing Data Products.  All data derived from the mtcars dataset in the datasets package.

## Side Panel

The side panel allows you to modify fuel cost by chosing the cost of gasoline (per gallon), and modify commute length (in miles).

These two sliders adjust the TripCost column in the Fuel Cost Table, giving the one-way trip cost for each car given the selected fuel cost and commute length.

The remaining sliders and check boxes restrict the cars shown in the  Fuel Cost Table and MPG Graph based on the choices you select.

## Fuel Cost Table

Displays basic car information based on Side Panel input.  For Transmission, 0 = Automatic and 1 = Manual.  Weight is listed in thousands of pounds.  TripCost is reported in USD.

## MPG Graph

Displays cars in a  Horsepower x MPG format, with cars displayed based on criteria chosen in the Side Panel.

## Code

Full code available at: https://github.com/rayschneider/Developing_Data_Products_Course_Project

Shiny App hosted at: https://rayschneider.shinyapps.io/Developing_Data_Products_Course_Project/

