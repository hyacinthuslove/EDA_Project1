# Set Working Directory
setwd("D:/Coursera/ExploratoryDataAnalysis/EDA_Project1")

# read Data File and filter by date range
mydata = read.table("household_power_consumption.txt", sep=";", header=TRUE)
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydatafiltered <- mydata[mydata$Date >= "2007/02/01" & mydata$Date <= "2007/02/02", ]

# Create plot on png
png("plot1.png", width = 480, height = 480, units = "px", bg = "white")
par(mar= c(4, 4, 3, 1))
hist(as.numeric(mydatafiltered$Global_active_power)/500,
     main="Global Active Power",  
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     col="Red")
dev.off()
