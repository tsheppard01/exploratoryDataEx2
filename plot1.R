plot1 <- function() {

        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")

        emissionsByYear <- aggregate(Emissions ~ year, NEI, sum)
        
        plot(emissionsByYear$year, emissionsByYear$Emissions/1000000, xlab="Year", ylab="PM2.5 Emissions (MegaTons)", type="l")
        title("Total US PM2.5 Emissions by Year")

       #Create png file
        dev.copy(png, file = "plot1.png")
        dev.off()
}  

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

plot3 <- function() {

        library(ggplot2)

        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")

        NEIBalt <- NEI[NEI$fips=="24510",]

        emissionsByYear <- aggregate(Emissions ~ year + type, NEIBalt, sum)

        g <- ggplot(em, aes(year, Emissions/1000000, color=type))
        g + geom_line() + coord_cartesian(ylim=c(0,6)) + scale_y_continuous(breaks=seq(0,6,1)) + facet_grid(~type) + xlab("Year") + ylab("PM2.5 Emissions (MegaTons)")

        #Create png file
        dev.copy(png, file = "plot3.png")
        dev.off()

}









