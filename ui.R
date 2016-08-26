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
       actionButton("go", "Run"),
       
       h6("View", a("code", href = "https://github.com/shehlit/ddp-assignment"), "on Github", style = "font-size: 11px", align = "right")
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
           this experiment is repeated (Number of samples)."),
       
       p("Users can see how the sample mean and standard deviation compared 
         to the theoretical mean and theoretical standard deviation. 
         There are also 3 curves plotted on the histogram: normal curve 
         using theoretical values (green), normal curve using sample 
         values (black), density plot for the histogram (red). 
         As the number of samples increases, the density curve and 
         the sample curve will resemble the theoretical normal curve 
         most of the time.")
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
