library(ggplot2)
library(plyr)

##Read the Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Subset year and type
data <- ddply(NEI[NEI$fips == "24510",], c("year", "type"), 
                 function(df)sum(df$Emissions, na.rm=TRUE))

##Open graphic device
png(filename="plot3.png", width=480, height=480, units="px")

##Plot the data
ggplot(data=data, aes(x=year, y=V1, group=type, colour=type)) +
        geom_line() +
        xlab("Year") +
        ylab("PM2.5 (tons)") +
        ggtitle("Total PM2.5 Emissions Per Year by Source Type")

##Close the graphic device
dev.off()