# Expl Data Class
# Filename: plot3.R
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
# Setup a multi-paneled plot (1 row, 1 column) - practicing this option
par(mfrow=c(1,1))

# Create plot data for X&Y axis
png("plot3.png", width = 480, height = 480, bg = "white")
plot(datedhpcdata$DateTime,datedhpcdata[,7],type="l",xlab=" ",ylab="Energy sub metering", bg="white")
lines(datedhpcdata[,10],datedhpcdata[,8],col="Red")
lines(datedhpcdata[,10],datedhpcdata[,9],col="Blue")
# Annotation with legends and color codes
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"),lwd=1)

dev.off()
