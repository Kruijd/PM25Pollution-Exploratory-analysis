# peer Graded Assignment Exploratory analysis week 4
#Fine particulate matter.
#goal: explore the National Emissions Inventory database for PM2.5 in the US for 1999-2008.

library(ggplot2)

    #Read the data
      #National Emissions Inventory
          NEI <- readRDS("./Data/summarySCC_PM25.rds")
      #Source Classification Code Table
          SCC <- readRDS("./Data/Source_Classification_Code.rds")


    # plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008
          SccSel<-SCC [which(SCC$EI.Sector=="Fuel Comb - Electric Generation - Coal"),1]
          NeiCoal<-subset(NEI,SCC %in% SccSel)
    
    #Create plot1.png and close graphics device
        png(filename="plot4.png",width=480,height=480) 
    

    #Create plot    
        ggplot(NeiCoal,aes(x=factor(year),y=Emissions))+
          geom_bar(stat="identity",fill="red")+
          xlab("year") +
          ylab(expression("total PM"[2.5]*" emission"))+
          ggtitle(expression("total PM"[2.5]*" emission"))
 
  #close device
        dev.off()