plot6 <- function() {

        library(ggplot2)

        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")

        NEIroad = NEI[NEI$fips=="24510" | NEI$fips=="06037",]
        NEIroad = NEIroad[NEIroad$type=="ON-ROAD",]
      
        emissionsByYear <- aggregate(Emissions ~ year + fips, NEIroad, sum)
        names(emissionsByYear)[2] <- "Area"

        g <- ggplot(emissionsByYear, aes(year, Emissions/1000, color=Area))
        g + geom_line() + xlab("Year") + ylab("PM2.5 Emissions (KiloTons)") + ggtitle("PM2.5 Emissions by Year From Motor Vehicle Sources")

        #Create png file
        dev.copy(png, file = "plot6.png")
        dev.off()

}