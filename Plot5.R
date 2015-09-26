setwd("C://Users//jay//Documents//R//Exploratory Data Analysis//Project 2")
require(ggplot2)

NEI <- readRDS("exdata-data-NEI_data//summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data//Source_Classification_Code.rds")

#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

#subset NEI for baltimore
baltimoreData = NEI[NEI$fips == 24510, ]

#extract motor sources from SCC and create subset of NEI data of SCC IDs with these sources
#tried with motor vehicle, but only had data for 2 years. more interesting graph expanding the pollutant source
vehicleSourceRow = grep("motor", SCC$Short.Name, ignore.case = T) #figure out which short names in SCC contain coal, return rows
vehicleSource = SCC[vehicleSourceRow, ]  #subset SCC for only rows that contain coal in short names
vehicleData = baltimoreData[baltimoreData$SCC %in% vehicleSource$SCC, ] #subset NEI data for only the SCC IDs that match those in the prior step

#create the chart data - aggregate emissions from motorized vehicles by year
chartData = aggregate(Emissions ~ year, data = vehicleData, FUN = "sum")

#plot the data
png("plot5.png", width=480, height=480) #create png
ggplot(aes(x = factor(year), y = Emissions),  data = chartData) + #create the plots and separate by source of pollutant
          geom_bar(stat = "identity") + #add bars to chart
          ggtitle("PM2.5 Emissions From Motorized Sources In Baltimore") +
          ylab("Tons of Pollutant") + 
          xlab("Year")
dev.off()
