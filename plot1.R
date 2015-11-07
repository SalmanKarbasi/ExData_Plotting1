#####Exploratory data analysis project 1
Data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
AllDates <- as.Date(Data$Date, "%d/%m/%Y")
###
par(mfrow=c(1,1))
PlotData <- Data[AllDates == as.Date("01-02-2007", "%d-%m-%Y") | AllDates == as.Date("02-02-2007", "%d-%m-%Y"), ]
Y <- as.numeric(as.character(PlotData$Global_active_power))
### Fig1
hist(Y, col="red", breaks = 12, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", cex=0.75)
dev.copy(png,'plot1.png', width =480, height=480)
dev.off()
