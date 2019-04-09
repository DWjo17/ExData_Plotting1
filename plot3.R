#plot3
setwd("/Users/joba/Desktop/JO_R_practice/Cousera/Input_folder/Data")
cousera1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";",dec=".", stringsAsFactors=FALSE, na.strings = "?",nrows=2075259, check.names=F, comment.char="", quote='\"')

cousera1$Date <- as.Date(cousera1$Date, format="%d/%m/%Y")
cousera1$Time <- format(cousera1$Time, format="%H:%M:%S")

cousera2 <- subset(cousera1, Date == "2007-02-01" | Date =="2007-02-02")

dim(cousera2)
#[1] 2880    9

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

str(cousera3)
#'data.frame':	2880 obs. of  10 variables:
#$ Date                 : Date, format: "2007-02-01" "2007-02-01" "2007-02-01" "2007-02-01" ...
#$ Time                 : chr  "00:00:00" "00:01:00" "00:02:00" "00:03:00" ...
#$ Global_active_power  : num  0.326 0.326 0.324 0.324 0.322 0.32 0.32 0.32 0.32 0.236 ...
#$ Global_reactive_power: num  0.128 0.13 0.132 0.134 0.13 0.126 0.126 0.126 0.128 0 ...
#$ Voltage              : num  243 243 244 244 243 ...
#$ Global_intensity     : num  1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1 ...
#$ Sub_metering_1       : num  0 0 0 0 0 0 0 0 0 0 ...
#$ Sub_metering_2       : num  0 0 0 0 0 0 0 0 0 0 ...
#$ Sub_metering_3       : num  0 0 0 0 0 0 0 0 0 0 ...
#$ timedate             : POSIXct, format: "2007-02-01 00:00:00" "2007-02-01 00:01:00" "2007-02-01 00:02:00" "2007-02-01 00:03:00" ...

png("plot3.png", width=480, height=480)
with(cousera3, plot(timedate, Sub_metering_1, type="n", xlab = "", ylab = "Energy Sub Metering"))
with(cousera3, lines(timedate,Sub_metering_1, col="black", type="l"))
with(cousera3, lines(timedate,Sub_metering_2, col="red", type="l"))
with(cousera3, lines(timedate,Sub_metering_3, col="blue", type="l"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
