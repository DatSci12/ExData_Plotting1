# Expl Data Class
# Filename: plot2.R
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

# Plotting Data to display the Global Active Power against the Days histogram
png("plot2.png", width = 480, height = 480, bg = "white")
plot(datedhpcdata$DateTime, datedhpcdata$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type = "l")
dev.off()
