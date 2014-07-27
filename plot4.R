library("ggplot2")

plot4<- function () {
  NEI <<- readRDS("summarySCC_PM25.rds");
  SCC <- readRDS("Source_Classification_Code.rds");
  summary<- ddply(NEI[NEI$SCC %in% SCC$SCC[grep("coal", SCC$EI.Sector, ignore.case=TRUE)], ], .(year), summarise, sumEmissions = sum(Emissions));
  plot(summary, xlab="Year", ylab="Amount of PM2.5 emitted (Tons)", main="US Yearly PM2.5 Emissions from Coal Combustion-Related Sources", type="n");
  lines(summary$year, summary$sumEmissions);
}