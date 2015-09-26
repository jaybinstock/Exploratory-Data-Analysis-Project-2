setwd("C://Users//jay//Documents//R//Exploratory Data Analysis//Project 2")

NEI <- readRDS("exdata-data-NEI_data//summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data//Source_Classification_Code.rds")
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
#(fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

#create the chart data

baltimoreData = NEI[NEI$fips == 24510, ]
chartData = aggregate(Emissions ~ year, data = baltimoreData, FUN = "sum")

#plot the data
png("plot2.png", width=480, height=480) #create png
with(chartData, plot(year, Emissions,
     xlab = "Year", ylab = "Tons of Pollutant",
     main = "PM2.5 Emissions in Baltimore: All Sources",
     type = "l", lwd = 2))
dev.off()
