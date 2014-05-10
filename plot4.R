# Expl Data Class
# Filename: plot4.R
# Reads original data from the power consumption file
hpcdata <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")

# Convert the column1 "Date and column2 "Time" to as.Date
hpcdata[,1] <- as.Date(hpcdata$Date,"%d/%m/%Y")

# Get data for Feb 1st to Feb 2nd of the year 2007
datedhpcdata=subset(hpcdata,hpcdata$Date %in% as.Date(c("2007-02-01","2007-02-02")))

datedhpcdata$DateTime <- as.POSIXct(paste(datedhpcdata$Date, datedhpcdata$Time), format="%Y-%m-%d %H:%M:%S")

# Convert each reading value for each of the power reading values from character to numeric to be able to plot data correctly.
datedhpcdata[,3] <- as.numeric(datedhpcdata[,3])
datedhpcdata[,4] <- as.numeric(datedhpcdata[,4])
datedhpcdata[,5] <- as.numeric(datedhpcdata[,5])
datedhpcdata[,6] <- as.numeric(datedhpcdata[,6])
datedhpcdata[,7] <- as.numeric(datedhpcdata[,7])
datedhpcdata[,8] <- as.numeric(datedhpcdata[,8])
datedhpcdata[,9] <- as.numeric(datedhpcdata[,9])
# Setup a multi-paneled plot for a 2x2 plot
png("plot4.png", width = 480, height = 480, bg = "white")
par(mfrow=c(2,2))

# Generate plot information chart 1 displaying Global Active Power
plot(datedhpcdata$DateTime,datedhpcdata[,3],type="l",xlab=" ",ylab="Global Active Power")
# Generate plot information chart 2 representing Voltage utilization
plot(datedhpcdata$DateTime,datedhpcdata[,5],type="l",xlab="datetime",ylab="Voltage")
# Generate plot information chart 3 representing Energy Sub Metering
plot(datedhpcdata$DateTime,datedhpcdata[,7],type="l",xlab=" ",ylab="Energy sub metering")
lines(datedhpcdata[,10],datedhpcdata[,8],col="Red")
lines(datedhpcdata[,10],datedhpcdata[,9],col="Blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"),lwd=1,pt.cex=0.6,cex=0.6,bty="n")
# Generate plot information chart 4 representing Global Reactive power data
plot(datedhpcdata$DateTime,datedhpcdata[,4],type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()
