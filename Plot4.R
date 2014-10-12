# Set Working Directory
setwd("D:/Coursera/ExploratoryDataAnalysis/EDA_Project1")

# read Data File and filter by date range
mydata = read.table("household_power_consumption.txt", sep=";", header=TRUE)
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydatafiltered <- mydata[mydata$Date >= "2007/02/01" & mydata$Date <= "2007/02/02", ]

#Setup the 4 plots grid
png("plot4.png", width = 480, height = 480, units = "px", bg = "white")
par(mfrow=c(2,2), mar= c(4, 4, 2, 1))

# Plot at Top-Left Cell
plot(as.numeric(mydatafiltered$Global_active_power)/500, xaxt = "n",  
     type="l", main="", xlab="", ylab="Global Active Power", 
     col="black")
axis(1, c(1,1441,2880), c("Thu","Fri","Sat"))

# Plot at Top-Right Cell
plot(as.numeric(mydatafiltered$Voltage), xaxt = "n", yaxt = "n",
     type="l", main="", xlab="datetime", ylab="Voltage", col=1)
axis(1, c(1,1441,2880), c("Thu","Fri","Sat"))
axis(2, c(800, 1200, 1600, 2000), c("234","238","242","246"))


# Plot at Bottom-Left Cell
plot(as.integer(mydatafiltered$Sub_metering_1)-2,
     xaxt = "n", 
     yaxt = "n", 
     ylim=c(0,35),
     type="l",
     main="", 
     xlab="", 
     ylab="Energy sub metering", 
     col=1)
lines((as.integer(mydatafiltered$Sub_metering_2)/5)-0.3,col=2,type="l")
lines(as.integer(mydatafiltered$Sub_metering_3),col=4,type="l")

# Annotate the plot
axis(1, c(1,1441,2880), c("Thu","Fri","Sat"))
axis(2, c(0, 10, 20, 30), c("0","10","20","30"))
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c(1,2,4), 
       lty=1)

# Plot at Bottom-Right Cell
plot(as.numeric(mydatafiltered$Global_reactive_power), xaxt = "n", yaxt = "n",  
     type="l", main="", xlab="datetime", ylab="Global_reactive_power", col=1)
axis(1, c(1,1441,2880), c("Thu","Fri","Sat"))
axis(2, c(0, 45, 90, 135, 180, 225), c("0.0","0.1","0.2","0.3","0.4","0.5"))

# Create 4 plots on png
dev.off()

