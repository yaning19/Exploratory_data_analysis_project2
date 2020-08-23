NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##get subset data we need
Baltimore<-subset(NEI,NEI$fips == "24510")
Motor<-grepl("vehicle",SCC$SCC.Level.Two,ignore.case = TRUE)
Motor_data<-subset(SCC,Motor)

##Merge the subset with NEI
Mergedata2<-merge(Motor_data,Baltimore,by.X="SCC",by.Y="SCC")

##we only need emission and year data
Baltimore_MotorYear<-aggregate(Emissions~year,data = Mergedata2,sum)

##plot

png("plot5.png",480,480)
barplot(Emissions~year,data=Baltimore_MotorYear,main="Moter Vehicle Related Emissions in Baltimore")
dev.off()