library("ggplot2")

plot3<- function () {
  NEI <<- readRDS("summarySCC_PM25.rds");
  summary<- ddply(NEI[NEI$fips == "24510", ], .(year, type), summarise, sumEmissions = sum(Emissions));
  ggplot(summary) + geom_line(aes(x=year, y=sumEmissions, colour=factor(type))) + 
  labs(colour="Source Type",
       x ="Year",
       y = "Amount of PM2.5 emitted (Tons)",
       title = "Baltimore City Yearly PM2.5 Emissions by Source Type")
}