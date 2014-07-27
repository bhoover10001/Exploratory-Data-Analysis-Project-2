library("plyr")

plot2 <- function() {
  NEI <- readRDS("summarySCC_PM25.rds");
  summary<- ddply(NEI[NEI$fips == "24510", ], .(year), summarise, sumEmissions = sum(Emissions));
  plot(summary, xlab="Year", ylab="Amount of PM2.5 emitted (Tons)", main="Baltimore City Yearly PM2.5 Emissions", type="n");
  lines(summary$year, summary$sumEmissions);
}