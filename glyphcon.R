# #
# # This is a Shiny web application. You can run the application by clicking
# # the 'Run App' button above.
# #
# # Find out more about building applications with Shiny here:
# #
# #    http://shiny.rstudio.com/
# #
# 
# library(shiny)
# 


library(shiny)
library(shinyBS)


# ui <- fluidPage(
#     selectInput(
#         "input1",
#         "Select input",
#         c("choice1", "choice2"),
#         label = icon("fal fa-info-circle")
#     ),
#     bsTooltip(id = "input1",
#               title = "Here is some text with your instructions")
# )
# 
# server <- function(input, output) {
# }
# 
# shinyApp(ui = ui, server = server)



ui <- fluidPage(
    numericInput(
        "Import data here", 
        label = tags$span(
            "Import data here", 
            tags$i(
                class = "glyphicon glyphicon-info-sign", 
                style = "color:#0072B2;",
                title = "Upload dataset in this section."
            )
        ), 
        value = 1
    )  
)

shinyApp(ui, function(input, output){})


#icon("fal fa-info-circle")

