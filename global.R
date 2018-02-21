## global.R ##
library(shiny)
library(shinydashboard)
library(jsonlite)

data.all = fromJSON("/Users/jimin/Desktop/cleanData.json")
data.all$playerID = as.factor(data.all$playerID)
data.all$groupID = as.factor(data.all$groupID)
data.all$gameIndex = as.factor(data.all$gameIndex)
data.all$playerGameIndex = as.factor(data.all$playerGameIndex)

#Functions and Shortcuts:

dotplotGraphPanel <- tabPanel( 
  title = "Graph Options",
  solidHeader = TRUE,
  status = "success",
  selectInput(inputId = "dot.yvar",
              label = "Response Variable:",
              #columns of the dataset
              choices = unique(names(data.all)),
              selected = unique(names(data.all))[6],
              multiple = FALSE),
  selectInput(inputId = "dot.xvar",
              label = "Explanatory Variable:",
              #columns of the dataset
              choices = unique(names(data.all)),
              selected = unique(names(data.all))[4],
              multiple = FALSE),
  checkboxInput("dot.enableFacet", "Facet", FALSE),
  selectInput(inputId = "dot.facet.x",
              label = "Facet on X by:",
              #columns of the dataset
              choices = unique(names(data.all)),
              selected = unique(names(data.all))[15],
              multiple = FALSE),
  selectInput(inputId = "dot.color",
              label = "Color by",
              #columns of the dataset
              choices = unique(names(data.all)),
              selected = unique(names(data.all))[15],
              multiple = FALSE)
)

dotplotInputPanel <- tabPanel( 
  title = "Graph inputs",
  solidHeader = TRUE,
  status = "success",
  selectInput(inputId = "dot.gameIndex",
              label = "Game ID:",
              choices =  unique(data.all$gameIndex),
              selected = unique(data.all$gameIndex)[c(1)],
              multiple = TRUE)
)


stackedlineplotGraphPanel <- tabPanel(
  title = "Graph Options",
  solidHeader = TRUE,
  status = "success",
  selectInput(inputId = "stacked.yvar",
              label = "Response Variable 1:",
              #columns of the dataset
              choices = unique(names(data.all)),
              selected = unique(names(data.all))[6],
              multiple = FALSE),
  selectInput(inputId = "stacked.yvar1",
              label = "Response Variable 2:",
              #columns of the dataset
              choices = unique(c(names(data.all))),
              selected = unique(names(data.all))[6],
              multiple = FALSE),
  selectInput(inputId = "stacked.xvar",
              label = "Explanatory Variable:",
              #columns of the dataset
              choices = unique(names(data.all)),
              selected = unique(names(data.all))[4],
              multiple = FALSE)
)

stackedlineplotInputPanel <- tabPanel(
  title = "Graph inputs",
  solidHeader = TRUE,
  status = "success",
  selectInput(inputId = "stacked.gameIndex",
              label = "Game ID:",
              choices =  unique(data.all$gameIndex),
              selected = unique(data.all$gameIndex)[c(1)],
              multiple = TRUE)
)

dotplotBox <- box(title = "Plot",
               width = 8,
               solidHeader = TRUE,
               plotOutput("dotPlot"),
               status = "primary"
               )

stackedlineplotBox <- box(title = "Plot",
                  width = 8,
                  solidHeader = TRUE,
                  plotOutput("stackedlinePlot"),
                  status = "primary"
)