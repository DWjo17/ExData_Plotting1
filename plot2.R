#plot2
cousera1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";",dec=".", stringsAsFactors=FALSE, na.strings = "?",nrows=2075259, check.names=F, comment.char="", quote='\"')

cousera1$Date <- as.Date(cousera1$Date, format="%d/%m/%Y")
cousera1$Time <- format(cousera1$Time, format="%H:%M:%S")
str(cousera1)

cousera2 <- subset(cousera1, Date == "2007-02-01" | Date =="2007-02-02")

dim(cousera2)

cousera3 <-cbind(cousera2, "timedate" = as.POSIXct(paste(cousera2$Date, cousera2$Time)))
head(cousera3)
#       Date        Time                Global_active_power Global_reactive_power       Voltage         Global_intensity Sub_metering_1
# 66637 2007-02-01 00:00:00               0.326                 0.128                    243.15              1.4              0
# 66638 2007-02-01 00:01:00               0.326                 0.130                    243.32              1.4              0
# 66639 2007-02-01 00:02:00               0.324                 0.132                    243.51              1.4              0
# 66640 2007-02-01 00:03:00               0.324                 0.134                    243.90              1.4              0
# 66641 2007-02-01 00:04:00               0.322                 0.130                    243.16              1.4              0
# 66642 2007-02-01 00:05:00               0.320                 0.126                    242.29              1.4              0
#               Sub_metering_2  Sub_metering_3      timedate
# 66637              0              0           2007-02-01 00:00:00
# 66638              0              0           2007-02-01 00:01:00
# 66639              0              0           2007-02-01 00:02:00
# 66640              0              0           2007-02-01 00:03:00
# 66641              0              0           2007-02-01 00:04:00
# 66642              0              0           2007-02-01 00:05:00


dim(cousera3)
# [1] 2880   10

png("plot2.png", width=480, height=480)
plot(cousera3$Global_active_power ~ cousera3$timedate, type="l", xlab= "", ylab="Global Active power (kilowatts)")
dev.off()
