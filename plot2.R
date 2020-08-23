NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##subset the data we need
Baltimore<-subset(NEI,NEI$fips == "24510")

##get emission and year from Baltimore data
Emi_Baltimore<-aggregate(Emissions~year,Baltimore,sum)

##plotting
png("plot2.png",480,480)
barplot(Emissions ~ year, data=Emi_Baltimore,ylab = "Total Emission in Baltimore",xlab = "Year")
title(main="Total Emission Over Years in Baltimore")

dev.off()