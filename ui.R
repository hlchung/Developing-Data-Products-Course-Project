library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Temperature Converter"),
    
    sidebarLayout(
        sidebarPanel(
            helpText(p(h5(HTML(" <b>This application converts the temperature based on your selection below. </b>")))),
            selectInput("from", "From:", list('Celsius' = 1,
                                              'Fahrenheit' = 2,
                                              'Kelvin' = 3), selected= 1),
            selectInput("to", "To:", list('Celsius' = 1,
                                          'Fahrenheit' = 2,
                                          'Kelvin' = 3), selected = 2),
            numericInput('temperature', 'Temperature:', value = '100')),
        
        mainPanel(
            tabsetPanel(
                tabPanel('Converter', 
                         p(h1(textOutput('text_input_units'))), 
                         p(h1(textOutput('text_input_temperature'))), 
                         p(h3('is equal to')),
                         p(h1(textOutput('text_output_units'))),
                         p(h1(textOutput('text_output_temperature')))),
                         
                tabPanel('About',
                         h3('This application converts an inputted temperature from one unit to another.'),
                         HTML('<h4><p> The different temperatures considered in this application are the following: 
                         <br><ol>
                         <li> Celsius, 
                         <li> Farhenheit, and
                         <li> Kelvin </ol></p>
                         <br> The different formulas used in the application are:
                         <br> <img src="data:image/png;base64,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">
                         <br> To see how this application was made, <a href="https://github.com/hlchung/Developing-Data-Products-Course-Project">click here.</a>'))))
    )
))
