library(ggplot2)
library(plyr)

##Read the Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Subset Baltimore and LA in one data frame
data <- rbind(d.baltim <- NEI[which(NEI$fips == "24510"), ], d.lac <- NEI[which(NEI$fips == 
                                                                                        "06037"), ])
data$fips[which(data$fips == "24510")] <- "Baltimore City"
data$fips[which(data$fips == "06037")] <- "Los Angeles County"
names(data)[1] <- "Cities"

##Open graphic device
png(filename="plot6.png", width=480, height=480, units="px")

##Plot the data
g6 <- ggplot(data, aes(x = year, y = Emissions, fill = Cities))
g6 + geom_bar(stat = "identity", position = position_dodge())

##Close the graphic device
dev.off()