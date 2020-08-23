NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##subset coal combustion related data
coal<-grepl("coal",SCC$Short.Name,ignore.case = TRUE)
comb<-grepl("comb",SCC$Short.Name,ignore.case = TRUE)
comb_coal<-subset(SCC,coal&comb)

##merge subset of SCC and NEI
mergedata<-merge(NEI,comb_coal,by.x = "SCC",by.y = "SCC")

#get sum of Emission by year 
Emission_sum<-aggregate(Emissions~year,mergedata,sum)

png("plot4.png",480,480)
barplot(Emissions~year,data = Emission_sum,main="Emission related to Coal Combustion")
dev.off()