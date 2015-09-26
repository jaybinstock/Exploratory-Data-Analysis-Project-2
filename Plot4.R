setwd("C://Users//jay//Documents//R//Exploratory Data Analysis//Project 2")
require(ggplot2)

NEI <- readRDS("exdata-data-NEI_data//summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data//Source_Classification_Code.rds")

#extract coal sources from SCC and create subset of NEI data of SCC IDs with these sources
coalSourceRow = grep("coal", SCC$Short.Name, ignore.case = T) #figure out which short names in SCC contain coal, return rows
coalSource = SCC[coalSourceRow, ]  #subset SCC for only rows that contain coal in short names
coalData = NEI[NEI$SCC %in% coalSource$SCC, ] #subset NEI data for only the SCC IDs that match those in the prior step

#create the chart data - aggregate emissions of coal by year
chartData = aggregate(Emissions ~ year, data = coalData, FUN = "sum")

#plot the data
png("plot4.png", width=480, height=480) #create png
ggplot(aes(x = factor(year), y = Emissions),  data = chartData) + #create the plots and separate by source of pollutant
          geom_bar(stat = "identity") + #add bars to chart
          ggtitle("PM2.5 Emissions From Coal Sources") +
          ylab("Tons of Pollutant") + 
          xlab("Year")
dev.off()
