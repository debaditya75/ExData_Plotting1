# Read the file
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("?"), colClasses=c(rep("character",2),rep("numeric",7)))
# Convert the Date Column to date class
df[,1] <- as.Date(x=df[,1], format="%d/%m/%Y")
# Subset the data based on the dates required
df3 <- subset(df, subset=(Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")))
rm(df)
## Open a PNG file
png(filename="plot2.png", width = 480, height = 480)
# setup the plot area
par(mfrow=c(1,1))
# Add new column with both date and time and convert that to date
df3$dateTime <- strptime(paste(df3$Date,df3$Time),format="%Y-%m-%d %H:%M:%S")
# Now create the plot
plot(df3$dateTime,df3$Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)")
## Close the PNG device
dev.off() 