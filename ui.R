library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Central Limit Theorem Demonstration"),
  
  # Sidebar  
  sidebarLayout(
    sidebarPanel(
       numericInput("rate", "Rate parameter", 0.2),
       helpText("Insert a number between 0 and 1"),
       
       numericInput("obs", "Size of 1 sample", 40),
       helpText("Insert a number between 10 and 100"),
       
       numericInput("num", "Number of samples", 10),
       helpText("Insert a number between 1 and 100000"),
       
       sliderInput('ymax', 'Maximum y', min = 0.5, max = 2.5, value = 0.8),
       helpText("Adjust the maximum y value in y-axis"),
       actionButton("go", "Run")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       wellPanel(
         p("The Central Limit Theorem states that the 
         distribution of averages of independent, 
           identically distributed variables becomes 
           that of a standard normal as the 
           sample size increases."),
         p("In this application, a set of numbers (Size of 1 sample) that 
           follow the exponential distribution will be generated, after 
           the users have specified the rate parameter. The theoretical 
           mean and standard deviation of this sample is calculated using 
           1/(rate parameter). Users can then decide how many times 
           this experiment is repeated (Number of samples).")
         ),
       
       
       fluidRow(
         column(4, textOutput("truemean")),
         column(6, textOutput("truesd"))
       ),
       
       fluidRow(
         column(4, textOutput("samplemean")),
         column(6, textOutput("samplesd")
       ),
       
      plotOutput("histPlot")
    )
  )
)))
