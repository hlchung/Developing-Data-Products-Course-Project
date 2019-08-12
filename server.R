library(shiny)

shinyServer(function(input, output) {

    output$text_input_temperature <- renderText({input_temperature()})
    
    input_temperature <- reactive({
        if(input$from == 1)
            input_temperature <- paste(input$temperature, 'Celsius')
        else if (input$from == 2)
            input_temperature <- paste(input$temperature, 'Fahrenheit')
        else 
            input_temperature <- paste(input$temperature, 'Kelvin')
    })
    
    converted <- reactive({
        if(input$from == 1 && input$to == 1)
            converted <- paste(input$temperature, 'Celsius')
        else if(input$from == 1 && input$to == 2)
            converted <- paste(celsiustofahr(input$temperature), 'Fahrenheit')
        else if(input$from == 1 && input$to == 3)
            converted <- paste(celsiustokelv(input$temperature), 'Kelvin')
        else if(input$from == 2 && input$to == 2)
            converted <- paste(input$temperature, 'Fahrenheit')
        else if(input$from == 2 && input$to == 1)
            converted <- paste(fahrtocelsius(input$temperature), 'Celsius')
        else if(input$from == 2 && input$to == 3)
            converted <- paste(fahrtokelv(input$temperature), 'Kelvin')
        else if(input$from == 3 && input$to == 3)
            converted <- paste(input$temperature, 'Kelvin')
        else if(input$from == 3 && input$to == 1)
            converted <- paste(kelvtocelsius(input$temperature), 'Celsius')
        else if(input$from == 3 && input$to == 2)
            converted <- paste(kelvtofahr(input$temperature), 'Fahrenheit')
        
    })
    
    output$text_output_temperature <- renderText({converted()})
    
    celsiustofahr <- function(celsius)
    {
        round((celsius * 9)/5 + 32, 4)
    }
    
    celsiustokelv <- function(celsius)
    {
        celsius + 273.15
    }
    
    fahrtocelsius <- function(fahr)
    {
        round((fahr - 32) * 5/9, 4)
    }
    
    fahrtokelv <- function(fahr)
    {
        round(farhtocelsius(fahr) + 273.15, 4)
    }
    
    kelvtocelsius <- function(kelvin)
    {
        kelvin - 273.15
    }
    
    kelvtofahr <- function(kelvin)
    {
        round((kelvin - 273.15) * 9/5 + 32, 4)
    }
})
