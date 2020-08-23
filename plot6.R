SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")
library(ggplot2)
##get subset data we need
Baltimore_LA<-subset(NEI,NEI$fips == "24510"| NEI$fips == "06037")

Motor<-grepl("vehicle",SCC$SCC.Level.Two,ignore.case = TRUE)
Motor_data<-subset(SCC,Motor)

##Merge the subset with NEI
Mergedata3<-merge(Motor_data,Baltimore_LA,by.X="SCC",by.Y="SCC")

##we only need emission and year data
Baltimore_LA_MotorYear<-aggregate(Emissions~year+fips,data = Mergedata3,sum)

##plot

png("plot6.png",480,480)

p<-qplot(year,Emissions,data = Baltimore_LA_MotorYear,col=fips,main = "Motor Emissions in Baltimore & LA")+geom_line()
p
p+scale_color_discrete(name="City",
                    breaks=c("24510","06037"),
                    labels=c("Baltimore","LA"))

dev.off()