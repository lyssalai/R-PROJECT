

library(shiny)

A2010 <- read.csv("bp appre 2010 copy.csv", header = TRUE, stringsAsFactors = FALSE)               # Brings the 2010 Apprehensions Data into R

A2017 <- read.csv("bp appre 2017 copy.csv", header = TRUE, stringsAsFactors = FALSE)               # Brings the 2017 Apprehensions Data into R

A <- as.data.frame(matrix(rowSums(DMA2010, na.rm=TRUE), nrow = 1))
colnames(A) <- c("Big Bend", "Del Rio", "El Centro", "El Paso", "Laraedo",
                 "Valley", "San Diego", "Tuscon", "Yuma")                                      # Categorizes total number of apprehensions in 2010 at each Sector with respective names

B <- as.data.frame(matrix(rowSums(DMA2017, na.rm=TRUE), nrow = 1))
colnames(B) <- c("Big Bend", "Del Rio", "El Centro", "El Paso", "Laraedo",
                 "Valley", "San Diego", "Tuscon", "Yuma")                                      # Categorizes total number of apprehensions in 2017 at each Sector with respective names

AB <- rbind(A, B)
row.names(AB) <- c("2010", "2017")                                                             # Binds row A and row B into a matrix with the respective names of the Sectors aand Year

# Use a fluid Bootstrap layout
ui <- fluidPage(   
  
  # Give the page a title
  titlePanel("Number of Apprehensions by Sector"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("Sector", "Sector:", 
                  choices=colnames(AB)),
      hr(),
      helpText("Data from CNN: April 2017 Border Apprehension Statistics")
    ),
    
    # Create a spot for the barplot
    mainPanel(
      plotOutput("appPlot")  
    )
    
  )
)
server <- function(input, output) {
  
  # Fill in the spot we created for a plot
  output$appPlot <- renderPlot({
    
    # Render a barplot
    barplot(AB[,input$Sector]*1000, 
            main=input$Sector,
            names.arg = c("2010","2017"),
            ylab="Number of Apprehensions",
            xlab="Year")
  })
}

shinyApp(ui = ui, server = server)