
library(shiny)


ui <- fluidPage(
    shinyFeedback::useShinyFeedback(),
    numericInput("n", "n", value = 10),
    textOutput("half")
)



server <- function(input, output, session) {
    half <- reactive({
        sas_file <- input$n %% 2 == 0
        shinyFeedback::feedbackWarning("n", !sas_file, "Please select an even number")
        input$n / 2    
    })
    
    output$half <- renderText(half())
}


shinyApp(ui = ui, server = server)
