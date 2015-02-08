# Read the file
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("?"), colClasses=c(rep("character",2),rep("numeric",7)))
# Convert the Date Column to date class
df[,1] <- as.Date(x=df[,1], format="%d/%m/%Y")
# Subset the data based on the dates required
df3 <- subset(df, subset=(Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")))
rm(df)
# Add new column with both date and time and convert that to date
df3$dateTime <- strptime(paste(df3$Date,df3$Time),format="%Y-%m-%d %H:%M:%S")
## Open a PNG file
png(filename="plot4.png", width = 480, height = 480)
# setup the plot area
par(mfrow=c(2,2))
par(mar=c(4,4,2,2))
# 1st Chart
plot(df3$dateTime,df3$Global_active_power, type="l", xlab="",ylab="Global Active Power")
# 2nd Chart
plot(df3$dateTime,df3$Voltage, type="l", xlab="datetime",ylab="Voltage")
# 3rd Chart
plot(df3$dateTime,df3$Sub_metering_1, type="l", xlab="",ylab="Energy Sub Metering")
lines(df3$dateTime,df3$Sub_metering_2,col="red")
lines(df3$dateTime,df3$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
	lty=c(1,1,1),col=c("black","red","blue"), box.lwd=0, cex=0.65, x.intersp=0)
#4th Chart
plot(df3$dateTime,df3$Global_reactive_power, type="l", xlab="datetime",ylab="Global_reactive_power")
## Close the PNG device
dev.off() 