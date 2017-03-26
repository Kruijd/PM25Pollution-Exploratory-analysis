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
        png(filename="plot3.png",width=480,height=480) 

    # Create plot  Baltimore City, Maryland 
        BalType<- aggregate(Emissions ~ year+type, BalSet, sum)
        ggplot(BalType,aes(x=factor(year),y=Emissions,color=type,group=type))+
          geom_line( size=1.2)+
          xlab("year") +
          ylab(expression("total PM"[2.5]*" emission"))+
          ggtitle(expression("total PM"[2.5]*" emission in Baltimore city"))
        
  #close device
      dev.off()
