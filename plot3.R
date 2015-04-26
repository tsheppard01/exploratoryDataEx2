plot3 <- function() {

        library(ggplot2)

        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")

        NEIBalt <- NEI[NEI$fips=="24510",]

        emissionsByYear <- aggregate(Emissions ~ year + type, NEIBalt, sum)

        g <- ggplot(emissionsByYear, aes(year, Emissions/1000, color=type))
        g + geom_line() + xlab("Year") + ylab("PM2.5 Emissions (KiloTons)")

        #Create png file
        dev.copy(png, file = "plot3.png")
        dev.off()

}