library("ggplot2")

# Displays the yearly PM2.5 motor vehicles emissions for Baltimore City.

plot5<- function () {
  NEI <<- readRDS("summarySCC_PM25.rds");

  #summarize the emission data for location 24510 - Baltimore City and type=On-Road
  summary<- ddply(NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", ], .(year), summarise, sumEmissions = sum(Emissions));
  
  png("plot5.png");
  plot(summary, xlab="Year", 
        ylab="Amount of PM2.5 emitted (Tons)", 
        main="Baltimore Yearly PM2.5 Emissions from Motor Vehicles\n Data reported every 3 years", type="n");
  lines(summary$year, summary$sumEmissions);
  dev.off();
}