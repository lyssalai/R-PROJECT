
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
    col = "red")                                                                              # Makes the TimeTable of the Monthly Summaries Data

DMA2010 <- data.matrix(A2010, rownames.force = NA)
DMA2017 <- data.matrix(A2017, rownames.force = NA)

t.test(DFA2010,DFA2017)



