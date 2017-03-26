# peer Graded Assignment Exploratory analysis week 4
#Fine particulate matter.
#goal: explore the National Emissions Inventory database for PM2.5 in the US for 1999-2008.


#Read the data
  #National Emissions Inventory
  NEI <- readRDS("./Data/summarySCC_PM25.rds")
  #Source Classification Code Table
  SCC <- readRDS("./Data/Source_Classification_Code.rds")


#1. plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008
  YearTot <- aggregate(Emissions ~ year, NEI, sum)
  #Create plot1.png and close graphics device
  png(filename="plot1.png",width=480,height=480) 

  # Create plot
  barplot(YearTot$Emissions,YearTot$year,
        names.arg =YearTot$year,
        main="total PM2.5 emission per year in the United States ",
        xlab="Year",
        ylab = "Emission",
        col="red")
  #close device
  dev.off()
