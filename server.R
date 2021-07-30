library(datasets)
data(Seatbelts)
Seatbelts <- data.frame(Year=floor(time(Seatbelts)),
                        Month=factor(cycle(Seatbelts),
                                     labels=month.abb), Seatbelts)

# Define a server for the Shiny app
function(input, output) {
    
    # Filter data based on selections
    output$table <- DT::renderDataTable(DT::datatable({
        data <- Seatbelts
        if (input$Year != "All") {
            data <- data[data$Year == input$Year,]
        }
        if (input$Month != "All") {
            data <- data[data$Month == input$Month,]
        }
        data
    }))
    
}