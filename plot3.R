#####Exploratory data analysis project 1
Data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
AllDates <- as.Date(Data$Date, "%d/%m/%Y")
###
par(mfrow=c(1,1))
PlotData <- Data[AllDates == as.Date("01-02-2007", "%d-%m-%Y") | AllDates == as.Date("02-02-2007", "%d-%m-%Y"), ]
Y <- as.numeric(as.character(PlotData$Global_active_power))
######################
DateTime <- paste(as.character(PlotData$Date), as.character(PlotData$Time))
X<-strptime(DateTime, "%d/%m/%Y %H:%M:%S")
X1 <- format(X, "%a")
C1 <- min(which(X1==unique(X1)[1]))
C2 <- min(which(X1==unique(X1)[2]))
C3 <- (max(which(X1==unique(X1)[2])))+1
######################
#Fig3

M1 <- as.numeric(as.character(PlotData$Sub_metering_1))
M2 <- as.numeric(as.character(PlotData$Sub_metering_2))
M3 <- as.numeric(as.character(PlotData$Sub_metering_3))

plot(M1, type = "l", xaxt= 'n', col="black",  ylab="Energy sub metering", xlab="")
lines(M2, type = "l", xaxt= 'n', col="red",  ylab="Energy sub metering", xlab="")
lines(M3, type = "l", xaxt= 'n', col="blue", ylab="Energy sub metering", xlab="")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), cex=0.75)

axis(1,c(C1, C2, C3),labels=c("Thu","Fri", "Sat"))
dev.copy(png,'plot3.png', width =480, height=480)
dev.off()
#######################
