library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  mns = NULL
  
  output$truemean <- renderText({
    input$go
    isolate(paste("Theoretical mean = ", round(1/input$rate,2)))
  })
  
  output$truesd <- renderText({
    input$go
    isolate(paste("Theoretical standard deviation = ", 
                  round(sqrt((1/input$rate)^2/input$obs),2)))
  })
  
  output$histPlot <- renderPlot({
    
    input$go
    
    truemean <- isolate(1/input$rate)
    truesd <- isolate(sqrt((1/input$rate)^2/input$obs))
    obs <- isolate(input$obs)
    rate <- isolate(input$rate)
    ymax <- isolate(input$ymax)
    
    dist <- isolate({
      sapply(1:input$num, function(x) mean(rexp(obs, rate)))
    })
    
    isolate({
      hist(dist, col = 'darkgray', main = "Distribution of mean",
           border = 'white', probability = TRUE, ylim = c(0,ymax),
           xlim = c(truemean-3*truesd,truemean+3*truesd), breaks = 20,
           xlab = "Mean")
      curve(dnorm(x, mean=truemean, sd=truesd), 
            add = TRUE, col="green", lwd = 4)
      curve(dnorm(x, mean=mean(dist), sd=sd(dist)), add = TRUE, col="black", lwd = 2)
      lines(density(dist), col="red", lwd = 2)
      legend(truemean+1.5*truesd, input$ymax*0.9, 
             c("Theoretical", "Sample", "Density plot"), lty = c(1,1,1), 
             lwd = c(2,2,2), col=c("green", "black", "red"))
    })
    
  
    output$samplemean <- renderText({
      input$go
      paste("Sample mean = ", round(mean(dist),2))
    })
    
    output$samplesd <- renderText({
      input$go
      paste("Sample standard deviation = ", round(sd(dist),2))
      })
  })
})
