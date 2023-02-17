#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyBS)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30),
            bsTooltip("bins", "Imported data should follow the ADSL format",
                      "right", options = list(container = "body"))
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        # draw the histogram with the specified number of bins
        hist(x,
             breaks = bins,
             col = 'darkgray',
             border = 'white')
    })
    addPopover(
        session,
        "distPlot",
        "Data",
        content = paste0(
            "
Waiting time between ",
"eruptions and the duration of the eruption for the Old Faithful geyser ",
"in Yellowstone National Park, Wyoming, USA.

Azzalini, A. and ",
"Bowman, A. W. (1990). A look at some data on the Old Faithful geyser. ",
"Applied Statistics 39, 357-365.

"
        ),
trigger = 'click'
    )
    
}

# Run the application 
shinyApp(ui = ui, server = server)
