setwd("C://Users//jay//Documents//R//Exploratory Data Analysis//Project 2")
require(ggplot2)

NEI <- readRDS("exdata-data-NEI_data//summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data//Source_Classification_Code.rds")
#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
#Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.
#(fips == "24510") 

#create the chart data
baltimoreData = NEI[NEI$fips == 24510, ]

chartData = aggregate(Emissions ~ year + type, data = baltimoreData, FUN = "sum")

#plot the data
png("plot3.png", width=600, height=480) #create png
ggplot(aes(x = factor(year), y = Emissions),  data = chartData ) + #create the plots and separate by source of pollutant
          facet_grid( . ~ type) +
          geom_bar(stat = "identity") + 
          ggtitle("PM2.5 Emissions in Baltimore") +
          ylab("Tons of Pollutant")
          xlab("Year")
dev.off()

