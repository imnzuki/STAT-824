library(datasets)
data(Seatbelts)
Seatbelts <- data.frame(Year=floor(time(Seatbelts)),
                        Month=factor(cycle(Seatbelts),
                                     labels=month.abb), Seatbelts)
# Use a fluid Bootstrap layout
fluidPage(    

    titlePanel("UK Driver Casualties 1969-84"),
    

        # Create a new Row in the UI for select Inputs
        fluidRow(
            column(4,
                   selectInput("Year",
                               "Year:",
                               c("All",
                                 unique(as.character(Seatbelts$Year))))
            ),
            column(4,
                   selectInput("Month",
                               "Month:",
                               c("All",
                                 unique(as.character(Seatbelts$Month))))
           
            )
        ),
        # Create a new row for the table.
        DT::dataTableOutput("table")
    )