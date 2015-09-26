setwd("C://Users//jay//Documents//R//Exploratory Data Analysis//Project 2")

NEI <- readRDS("exdata-data-NEI_data//summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data//Source_Classification_Code.rds")
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, 
#make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008

#create the chart data
chartData = aggregate(Emissions ~ year, data = NEI, FUN = "sum")

#plot the data
png("plot1.png", width=480, height=480) #create png
with(chartData, plot(year, Emissions,
     xlab = "Year", ylab = "Tons of Pollutant",
     main = "PM2.5 Emissions in the USA: All Sources",
     type = "l", lwd = 2))
dev.off()
