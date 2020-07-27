rm(list = ls())
setwd("C:/Users/pkansal/OneDrive - Capgemini/Desktop/Coursera work/exdata_data_household_power_consumption")

df <- read.table("household_power_consumption.txt",header = T,sep = ";")
df$Time <- strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date,"%d/%m/%Y")

df1 <- df[(df$Date >= "2007-02-01") & (df$Date <= "2007-02-02"),]
summary(df1)

num_col <- names(df1)[!names(df1) %in% c("Date","Time")]
for(i in num_col)
  df1[[i]] <- as.numeric(df1[[i]])


## plot4 ##
png("plot4.png")
par(mfrow = c(2,2))

plot(x = df1$Time,
     y = df1$Global_active_power,
     type = "l", 
     xlab = NA,
     ylab = "Global Active Power")

plot(x = df1$Time,
     y = df1$Voltage,
     type = "l", 
     xlab = "datetime",
     ylab = "Voltage")

plot(x = df1$Time,
     y = df1$Sub_metering_1,
     type = "l", 
     col = "black",
     xlab = NA,
     ylab = "Energy sub metering")
lines(x = df1$Time,
      y = df1$Sub_metering_2,
      col = "red")
lines(x = df1$Time,
      y = df1$Sub_metering_3,
      col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),
       lty = 1)

plot(x = df1$Time,
     y = df1$Global_reactive_power,
     type = "l", 
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()