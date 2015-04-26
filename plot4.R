plot4 <- function() {

        library(ggplot2)

        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")

        NEI <- merge(NEI,SCC,by="SCC")

        NEIsub <- NEI[grep("coal", NEI$Short.Name, ignore.case = TRUE),]

        emissionsByYear <- aggregate(Emissions ~ year, NEIsub, sum)
        plot(emissionsByYear$year, emissionsByYear$Emissions/1000000, xlab="Year", ylab="PM2.5 Emissions (MegaTons)", type="l")
        title("Total US PM2.5 Emissions by Year From Coal Sources")

        #Create png file
        dev.copy(png, file = "plot4.png")
        dev.off()
}