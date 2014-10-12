# Set Working Directory
setwd("D:/Coursera/ExploratoryDataAnalysis/EDA_Project1")

# read Data File and filter by date range
mydata = read.table("household_power_consumption.txt", sep=";", header=TRUE)
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydatafiltered <- mydata[mydata$Date >= "2007/02/01" & mydata$Date <= "2007/02/02", ]

# Create plot on png
png("plot2.png", width = 480, height = 480, units = "px", bg = "white")
par(mar= c(4, 4, 2, 1))
plot(as.numeric(mydatafiltered$Global_active_power)/500, xaxt = "n",  
     type="l", 
     main="", 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     col="black")
axis(1, c(1,1441,2880), c("Thu","Fri","Sat"))
dev.off()


