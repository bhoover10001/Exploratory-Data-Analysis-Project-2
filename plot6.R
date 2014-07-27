library("ggplot2")
library("plyr")

# displays the difference in PM2.5 vehicle emissions comparing Baltimore City and Los Angeles county 

plot6<- function () {
  NEI <<- readRDS("summarySCC_PM25.rds");

  # summarize the emissions data by location, where location is either 24510 - Baltimore City or 24510 - LA County, 
  # only looking at vehicle emissions. 
  summary<- ddply(NEI[(NEI$fips == "24510" | NEI$fips == "06037") & NEI$type == "ON-ROAD", ], 
                  .(year, fips), summarise, sumEmissions = sum(Emissions));
  # set the labels for the locations to the Readable value
  summary$fips <- revalue(summary$fips,
                          c("06037" = "Los Angeles County", "24510" = "Baltimore City"));

  # Get the base emissions for LA and Baltimore and then calculate the percentage change.
  baseBaltimoreEmissions = summary$sumEmissions[summary$fips == "Baltimore City"][1];
  baseLAEmissions = summary$sumEmissions[summary$fips == "Los Angeles County"][1];
  summary$sumEmissions[summary$fips == "Baltimore City"] <- 
    (summary$sumEmissions[summary$fips == "Baltimore City"]-baseBaltimoreEmissions)*100/baseBaltimoreEmissions;
  summary$sumEmissions[summary$fips == "Los Angeles County"] <- 
    (summary$sumEmissions[summary$fips == "Los Angeles County"]-baseLAEmissions)*100/baseLAEmissions;

  png("plot6.png")
  print(ggplot(summary) + 
           geom_line(aes(x=year, y=sumEmissions, colour=factor(fips))) + 
           labs(colour="Location",
                 x ="Year",
                 y = "Percentage Change since 1998",
                 title = "Change in LA County and Baltimore City Motor Vehicle Yearly PM2.5 Emissions\nEmissions data reported every 3 years"))
  dev.off();
}