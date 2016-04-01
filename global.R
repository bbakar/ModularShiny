library(shiny)
library(dplyr)
library(ggplot2)
library(DT)
source("pricesModule.R")

claritySelect <- as.character(unique(diamonds$clarity))


