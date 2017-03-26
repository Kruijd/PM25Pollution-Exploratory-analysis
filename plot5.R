# peer Graded Assignment Exploratory analysis week 4
#Fine particulate matter.
#goal: explore the National Emissions Inventory database for PM2.5 in the US for 1999-2008.

library(ggplot2)

  #Read the data
    #National Emissions Inventory
      NEI <- readRDS("./Data/summarySCC_PM25.rds")
    #Source Classification Code Table
      SCC <- readRDS("./Data/Source_Classification_Code.rds")


  #Create plot1.png and close graphics device
    png(filename="plot5.png",width=480,height=480) 
    

  # Create plot, emissions from motor vehicle sources 1999-2008 in Baltimore City
    bmoreCycle <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
    ggplot(bmoreCycle,aes(x=as.factor(year),y=Emissions))+
      geom_bar(stat="identity",fill="red")+
      xlab("Year")+
      ggtitle("Emissions motor vehicle sources Baltimore City")
    
  #close device
    dev.off()