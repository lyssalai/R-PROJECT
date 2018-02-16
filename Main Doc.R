library("forecast")

A2010 <- read.csv("bp appre 2010.csv", header = TRUE, stringsAsFactors = FALSE)               # Brings the 2010 Apprehensions Data into R

A2017 <- read.csv("bp appre 2017.csv", header = TRUE, stringsAsFactors = FALSE)               # Brings the 2017 Apprehensions Data into R

MonSum <- read.csv("PB monthly summaries (1).csv", header = TRUE, stringsAsFactors = FALSE)   # Brings the Monthly Summaries Data into R

VecMonSum <- as.vector(t(MonSum))                                                             # Turns Monthly Summaries Data into Vectors

VMSTable <- ts(VecMonSum, start = c(2000,10), frequency=12)                                   # Gives Labels to the Rows and Columns of the Monthly Summaries Data Vectors

MonthlySummariesGraph <- ts.plot(
  VMSTable,
  gpars=list(
    xlab="Year",
    ylab="Apprehensions",
    lty=c(1:3)),
    main = "Apprehensions/Month at the Border",
    col = "blue")                                                                              # Makes the TimeSeries of the Monthly Summaries Data

DMA2010 <- data.matrix(A2010, rownames.force = NA)                                             # Turns data from "bp appre 2010.csv" into a data matrix with NA for Sector Names

barplot(rowSums(DMA2010, na.rm=TRUE),
        names.arg = c("Big Bend", "Del Rio", "El Centro", "El Paso", "Laraedo",
                      "Rio Grande Valley", "San Diego", "Tuscon", "Yuma"), 
        las=2,
        main="2010 Border Patrol Total Apprehensions By Sector",
        border="black",
        col="blue")                                                                            # Makes barplot for Total Apprehensions By Sector in 2010

DMA2017 <- data.matrix(A2017, rownames.force = NA)                                             # Turns data from "bp appre 2017.csv" into a data matrix with NA for Sector Names

barplot(rowSums(DMA2017, na.rm=TRUE),
        names.arg = c("Big Bend", "Del Rio", "El Centro", "El Paso", "Laraedo",
                      "Rio Grande Valley", "San Diego", "Tuscon", "Yuma"), 
        las=2,
        main="2010 Border Patrol Total Apprehensions By Sector",
        border="black",
        col="blue")                                                                            # Makes barplot for Total Apprehensions By Sector in 2017

t.test(rowSums(DMA2010, na.rm=T),rowSums(DMA2017, na.rm=T), paired=T)                          # Runs paired t-tests, grouping by Sector



