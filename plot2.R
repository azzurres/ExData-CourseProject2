##Read the Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Aggregate the Data
baltimoreNEI <- NEI[NEI$fips=="24510",]
aggBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)

##Open graphic device
png(filename="plot2.png", width=480, height=480, units="px")
##Plot the data
barplot(
        aggBaltimore$Emissions,
        names.arg=aggBaltimore$year,
        xlab="Year",
        ylab="PM2.5 Emissions",
        main="Total PM2.5 Emissions In Baltimore"
)
##Close the graphic device
dev.off()