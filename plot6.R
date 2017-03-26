# Peer Graded Assignment Exploratory analysis week 4
#Fine particulate matter.
#goal: explore the National Emissions Inventory database for PM2.5 in the US for 1999-2008.

library(ggplot2)

#Read the data
    #National Emissions Inventory
      NEI <- readRDS("./Data/summarySCC_PM25.rds")
    #Source Classification Code Table
      SCC <- readRDS("./Data/Source_Classification_Code.rds")



    #Create plot1.png and close graphics device
      png(filename="plot6.png",width=480,height=480) 
    

    #LA vs Baltimore emissions motor vehicles
      LABalCycle<- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & (NEI$type=="ON-ROAD"),]
    # replace fips by logical names
      LABalCycle$fips[which(LABalCycle$fips=="24510")]<-"Baltimore City"
      LABalCycle$fips[which(LABalCycle$fips=="06037")]<-"Los angeles County"
   
    # create plot
      ggplot(LABalCycle,aes(x=factor(year),y=Emissions, fill=fips))+
        geom_bar(stat="identity")+
        guides(fill=FALSE)+
        facet_grid(fips~., scales = "free_y")+
        xlab("Year")+
        ylab(expression("total PM"[2.5]*" emission"))+
        ggtitle("Emissions motor vehicle sources Baltimore City and Los Angeles County")
    
    
    #close device
      dev.off()