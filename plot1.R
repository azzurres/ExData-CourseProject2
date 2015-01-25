##Read the Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Aggregate the Data
aggData <- aggregate(Emissions ~ year,NEI, sum)

##Open graphic device
png(filename="plot1.png", width=480, height=480, units="px")
##Plot the data
barplot(
        (aggData$Emissions),
        names.arg=aggData$year,
        xlab="Year",
        ylab="PM2.5 Emissions",
        main="Total PM2.5 Emissions From All US Sources"
)
##Close the graphic device
dev.off()