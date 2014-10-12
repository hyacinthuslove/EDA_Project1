# Set Working Directory
setwd("D:/Coursera/ExploratoryDataAnalysis/EDA_Project1")

# read Data File and filter by date range
mydata = read.table("household_power_consumption.txt", sep=";", header=TRUE)
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydatafiltered <- mydata[mydata$Date >= "2007/02/01" & mydata$Date <= "2007/02/02", ]

# Create plot with 3 lines on png
png("plot3.png", width = 480, height = 480, units = "px", bg = "white")
par(mar= c(4, 4, 2, 1))

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

dev.off()

