plot2 <- function() {
     
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")

        NEIBalt <- NEI[NEI$fips=="24510",]

        emissionsByYear <- aggregate(Emissions ~ year, NEIBalt, sum)

        plot(emissionsByYear$year, emissionsByYear$Emissions/1000, xlab="Year", ylab="Emissions (KiloTons)", type="l")
        title("Total Baltimore PM2.5 Emissions by Year")        

       #Create png file
        dev.copy(png, file = "plot2.png")
        dev.off()
}