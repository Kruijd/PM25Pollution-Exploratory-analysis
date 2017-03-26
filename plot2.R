# peer Graded Assignment Exploratory analysis week 4
#Fine particulate matter.
#goal: explore the National Emissions Inventory database for PM2.5 in the US for 1999-2008.


#Read the data
  #National Emissions Inventory
  NEI <- readRDS("./Data/summarySCC_PM25.rds")
  #Source Classification Code Table
  SCC <- readRDS("./Data/Source_Classification_Code.rds")


  #Create plot1.png and close graphics device
  png(filename="plot2.png",width=480,height=480) 

  # Create plot  Baltimore City, Maryland 
  BalSet<-subset(NEI,fips=="24510")
  BalTot <- aggregate(Emissions ~ year, BalSet, sum)
  
  barplot(BalTot$Emissions,BalTot$year,
          names.arg =BalTot$year,
          main="total PM2.5 emission per year in Baltimore City",
          xlab= "Year",
          ylab= "Emission",
          col="red")
  #close device
  dev.off()
