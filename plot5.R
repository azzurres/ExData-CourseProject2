library(ggplot2)
library(plyr)

##Read the Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Subset Motor Vehicles and Vehicles in Baltimore
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
baltimoreVehicles <- vehiclesNEI[vehiclesNEI$fips==24510,]

##Open graphic device
png(filename="plot5.png", width=480, height=480, units="px")

##Plot the data

ggplot(baltimoreVehicles,aes(factor(year),Emissions)) +
        geom_bar(stat="identity",fill="grey",width=0.75) +
        theme_bw() +  guides(fill=FALSE) +
        labs(x="year", y=expression("Total PM2.5 Emission")) + 
        labs(title=expression("PM2.5 Motor Vehicle Emissions in Baltimore from 1999-2008"))
##Close the graphic device
dev.off()