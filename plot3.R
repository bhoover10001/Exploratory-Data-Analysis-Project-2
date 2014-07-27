library("ggplot2")

# plots the total PM2.5 emissions from Baltimore City, by year, and source type

plot3<- function () {
  NEI <<- readRDS("summarySCC_PM25.rds");
  summary<- ddply(NEI[NEI$fips == "24510", ], .(year, type), summarise, sumEmissions = sum(Emissions));
  png("plot3.png")
  print(ggplot(summary) + 
          geom_line(aes(x=year, y=sumEmissions, colour=factor(type))) + 
          labs(colour="Source Type",
               x ="Year",
               y = "Amount of PM2.5 emitted (Tons)",
               title = "Baltimore City Yearly PM2.5 Emissions by Source Type\nData reported every 3 years"));
  dev.off();
}