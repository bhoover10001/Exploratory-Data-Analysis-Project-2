library("plyr")

plot1 <- function() {
  NEI <- readRDS("summarySCC_PM25.rds");
  summary<- ddply(NEI, .(year), summarise, sumEmissions = sum(Emissions));
  plot(summary, xlab="Year", ylab="Amount of PM2.5 emitted (Tons)", main="US Yearly PM2.5 emissions", type="n");
  lines(summary$year, summary$sumEmissions);
}