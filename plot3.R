library(dplyr)
library(lubridate)

dt <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

dts <- dt %>% filter(dmy(Date) %in% c(ymd("2007-02-01"), ymd("2007-02-02"))) %>%
    mutate(DT =  as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

rm(dt)

#3
plot(dts$DT, dts$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub mettering")
points(dts$DT, dts$Sub_metering_2, type = "l", col = "red")
points(dts$DT, dts$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty=1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "plot3.png")
dev.off()
