NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
sum1<-aggregate(Emissions~year,data=NEI,sum)

png("plot1.png",480,480)
barplot(Emissions ~ year, data=sum1,ylab = "Total Emission",xlab = "Year")
title(main="Total Emission Over Years")

dev.off()