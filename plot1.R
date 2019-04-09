# Exploratory Data Analysis
library(data.table)
system.time (cousera1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";",dec=".", stringsAsFactors=FALSE, na.strings = "?",nrows=2075259, check.names=F, comment.char="", quote='\"'))
# user    system  elapsed 
# 10.625   0.278  10.977 
head(cousera1)
# Date     Time Global_active_power Global_reactive_power Voltage Global_intensity Sub_metering_1 Sub_metering_2
# 1 16/12/2006 17:24:00               4.216                 0.418  234.84             18.4              0              1
# 2 16/12/2006 17:25:00               5.360                 0.436  233.63             23.0              0              1
# 3 16/12/2006 17:26:00               5.374                 0.498  233.29             23.0              0              2
# 4 16/12/2006 17:27:00               5.388                 0.502  233.74             23.0              0              1
# 5 16/12/2006 17:28:00               3.666                 0.528  235.68             15.8              0              1
# 6 16/12/2006 17:29:00               3.520                 0.522  235.02             15.0              0              2

# Sub_metering_3
# 1             17
# 2             16
# 3             17
# 4             17
# 5             17
# 6             17

dim(cousera1)
#[1] 2075259       9

str(cousera1)
# 'data.frame':	2075259 obs. of  9 variables:
# $ Date                 : chr  "16/12/2006" "16/12/2006" "16/12/2006" "16/12/2006" ...
# $ Time                 : chr  "17:24:00" "17:25:00" "17:26:00" "17:27:00" ...
# $ Global_active_power  : num  4.22 5.36 5.37 5.39 3.67 ...
# $ Global_reactive_power: num  0.418 0.436 0.498 0.502 0.528 0.522 0.52 0.52 0.51 0.51 ...
# $ Voltage              : num  235 234 233 234 236 ...
# $ Global_intensity     : num  18.4 23 23 23 15.8 15 15.8 15.8 15.8 15.8 ...
# $ Sub_metering_1       : num  0 0 0 0 0 0 0 0 0 0 ...
# $ Sub_metering_2       : num  1 1 2 1 1 2 1 1 1 2 ...
# $ Sub_metering_3       : num  17 16 17 17 17 17 17 17 17 16 ...

cousera1$Date <- as.Date(cousera1$Date, format="%d/%m/%Y")
cousera1$Time <- format(cousera1$Time, format="%H:%M:%S")
str(cousera1)

cousera2 <- subset(cousera1, Date == "2007-02-01" | Date =="2007-02-02")

dim(cousera2)
#[1] 2880    9
head(cousera2)
#          Date     Time      Global_active_power  Global_reactive_power Voltage    Global_intensity   Sub_metering_1
# 66637 2007-02-01 00:00:00               0.326                 0.128    243.15              1.4              0
# 66638 2007-02-01 00:01:00               0.326                 0.130    243.32              1.4              0
# 66639 2007-02-01 00:02:00               0.324                 0.132    243.51              1.4              0
# 66640 2007-02-01 00:03:00               0.324                 0.134    243.90              1.4              0
# 66641 2007-02-01 00:04:00               0.322                 0.130    243.16              1.4              0
# 66642 2007-02-01 00:05:00               0.320                 0.126    242.29              1.4              0

#                Sub_metering_2 Sub_metering_3
# 66637              0              0
# 66638              0              0
# 66639              0              0
# 66640              0              0
# 66641              0              0
# 66642              0              0

getwd()
# [1] "/Users/joba/Desktop/JO_R_practice/Cousera/Input_folder/data"
png("plot1.png", width=480, height=480)
hist(cousera2$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
#RStudioGD 
#2 
