## ui.R ##
library(shiny)
library(shinydashboard)

dashboardPage(
  skin = "black",
  dashboardHeader(title = "Epidemic Game"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dot Plot", tabName = "dot", icon = icon("dashboard")),
      menuItem("Stackline Plot", tabName = "stackline", icon = icon("th"))
    )
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(
        tabName = "dot",
        fluidRow(
          tabBox(
            width = 4,
            dotplotGraphPanel,
            dotplotInputPanel
          ),
            dotplotBox
        )
      ),
      tabItem(
        tabName = "stackline",
        fluidRow(
          tabBox(
            width = 4,
            stackedlineplotGraphPanel,
            stackedlineplotInputPanel
          ),
          stackedlineplotBox
        )
      )
    )
  )
)