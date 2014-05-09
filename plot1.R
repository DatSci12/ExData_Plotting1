# Expl Data Class
# Filename: plot1.R
# Reads original data from the power consumption file
hpcdata <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")

# Convert the column1 "Date and column2 "Time" to as.Date
hpcdata[,1]=as.Date(hpcdata$Date,"%d/%m/%Y")
hpcdata[,2]=as.Date(hpcdata$Time,"%H/%M/%S")

# Get data for Feb 1st to Feb 2nd of the year 2007
datedhpcdata=subset(hpcdata,hpcdata$Date %in% as.Date(c("2007-02-01","2007-02-02")))

# Convert each reading value from character to numeric to be able to plot data correctly.
datedhpcdata[,3]=as.numeric(datedhpcdata[,3])
datedhpcdata[,4]=as.numeric(datedhpcdata[,4])
datedhpcdata[,5]=as.numeric(datedhpcdata[,5])
datedhpcdata[,6]=as.numeric(datedhpcdata[,6])
datedhpcdata[,7]=as.numeric(datedhpcdata[,7])
datedhpcdata[,8]=as.numeric(datedhpcdata[,8])
datedhpcdata[,9]=as.numeric(datedhpcdata[,9])

# Plotting Data to display the Global Active Power histogram
png("plot1.png", width = 480, height = 480, bg = "transparent")
hist(datedhpcdata$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", )
dev.off()

