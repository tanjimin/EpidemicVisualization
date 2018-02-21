## server.R ##
library(ggplot2)
library(jsonlite)
library(reshape2)
library(wesanderson)

function(input, output) {
  
  output$dotPlot <- renderPlot({
      plotData = data.all[data.all$gameIndex %in% input$dot.gameIndex, ]
      plot = ggplot(data = plotData, aes_string(x = input$dot.xvar, y = input$dot.yvar, color=input$dot.color))
      plot = plot +
        geom_point() +
        xlab(input$dot.xvar) +
        ylab(input$dot.yvar)
      if (input$dot.enableFacet == TRUE) {
        plot = plot + facet_wrap(as.formula(paste("~", input$dot.facet.x)))
      } 
      plot
  })
  
  output$stackedlinePlot <- renderPlot({
    plotData = data.all[data.all$gameIndex %in% input$stacked.gameIndex, ]
    plotData = plotData[, c(input$stacked.xvar, input$stacked.yvar, input$stacked.yvar1)]
    plotData = melt(plotData, input$stacked.xvar)
    plot = ggplot(plotData, aes_string(x = input$stacked.xvar, y = "value", fill = "variable")) + 
      geom_area(position = 'stack')
    plot
  })
}