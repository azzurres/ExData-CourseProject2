library(ggplot2)
library(plyr)

##Read the Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Subset COal sources
coalSources <- SCC[grep("^Coal ", SCC$Short.Name, ignore.case=F),"SCC"]
aggData <- ddply(NEI[NEI$SCC %in% coalSources,], c("year"), 
                 function(df)sum(df$Emissions, na.rm=TRUE))
names(aggData) <- c("Year", "Emissions")

##Open graphic device
png(filename="plot4.png", width=480, height=480, units="px")

##Plot the data
ggplot(aggData, aes(x=Year,y=Emissions))+
        geom_line()+
        xlab("Year")+
        ylab("Total PM2.5 Emissions")+
        ggtitle("Coal Combustion-related sources Changes")

##Close the graphic device
dev.off()