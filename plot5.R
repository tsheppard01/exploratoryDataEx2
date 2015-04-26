plot5 <- function() {

        library(ggplot2)

        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")

        NEIBalt <- NEI[NEI$fips=="24510",]
        NEIBaltRoad <- NEIBalt[NEIBalt$type=="ON-ROAD",]
   
        emissionsByYear <- aggregate(Emissions ~ year, NEIBaltRoad, sum)
        plot(emissionsByYear$year, emissionsByYear$Emissions/1000000, xlab="Year", ylab="PM2.5 Emissions (MegaTons)", type="l")
        title("Total Baltimore PM2.5 Emissions by Year From Motor Vehicle Sources")

        #Create png file
        dev.copy(png, file = "plot5.png")
        dev.off()
}