#####Exploratory data analysis project 1
Data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
AllDates <- as.Date(Data$Date, "%d/%m/%Y")
### In the next step I can use as date to get all the date from the rows that are in the desired range then proceed with plotting.
PlotData <- Data[AllDates == as.Date("01-02-2007", "%d-%m-%Y") | AllDates == as.Date("02-02-2007", "%d-%m-%Y"), ]
Y <- as.numeric(as.character(PlotData$Global_active_power))
######
DateTime <- paste(as.character(PlotData$Date), as.character(PlotData$Time))
X<-strptime(DateTime, "%d/%m/%Y %H:%M:%S")
X1 <- format(X, "%a")
plot(Y, type = "l", xaxt= 'n', ylab="Global Active Power (kilowatts)", xlab="")
C1 <- min(which(X1==unique(X1)[1]))
C2 <- min(which(X1==unique(X1)[2]))
C3 <- (max(which(X1==unique(X1)[2])))+1
axis(1,c(C1, C2, C3),labels=c("Thu","Fri", "Sat"))
######
####A 2x2 plot
par(mfrow=c(2,2))
#1
plot(Y, type = "l", xaxt= 'n', ylab="Global Active Power", xlab="")
axis(1,c(C1, C2, C3),labels=c("Thu","Fri", "Sat"))

#2
V1 <- as.numeric(as.character(PlotData$Voltage))
plot(V1, type = "l", xaxt= 'n', col="black",  ylab="Voltage", xlab="datetime")
axis(1,c(C1, C2, C3),labels=c("Thu","Fri", "Sat"))

#3
M1 <- as.numeric(as.character(PlotData$Sub_metering_1))
M2 <- as.numeric(as.character(PlotData$Sub_metering_2))
M3 <- as.numeric(as.character(PlotData$Sub_metering_3))

plot(M1, type = "l", xaxt= 'n', col="black",  ylab="Energy sub metering", xlab="")
lines(M2, type = "l", xaxt= 'n', col="red",  ylab="Energy sub metering", xlab="")
lines(M3, type = "l", xaxt= 'n', col="blue", ylab="Energy sub metering", xlab="")
legend(800, 37, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), cex=0.65, box.lwd=0)
axis(1,c(C1, C2, C3),labels=c("Thu","Fri", "Sat"))

#4
RAP1 <- as.numeric(as.character(PlotData$Global_reactive_power))
plot(RAP1, type = "l", xaxt= 'n', col="black",  ylab="Global_reactive_power", xlab="datetime")
axis(1,c(C1, C2, C3),labels=c("Thu","Fri", "Sat"))
dev.copy(png,'plot4.png', width =480, height=480)
dev.off()