# This code is part of the Assignment of Week 1 of the Coursera
# course "Exploratory Data Analysis"

# The below R code generates "plot4.png"

# Input the Data
data_plot4 <- read.csv("household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE)

# Subsetting rows corresponding to the needed dates
data4 <- data_plot4[data_plot4$Date %in% c("1/2/2007","2/2/2007"),]

# Removing the rows where there are missing values
data4[data4 == "?"] <- NA
data4 <- data4[complete.cases(data4),]  

# Converting character vectors to numeric
data4$Global_active_power <- as.numeric(data4$Global_active_power)
data4$Sub_metering_1 <- as.numeric(data4$Sub_metering_1)
data4$Sub_metering_2 <- as.numeric(data4$Sub_metering_2)
data4$Sub_metering_3 <- as.numeric(data4$Sub_metering_3)

# Opening a png graphics device
png(
  "plot4.png",
  width     = 480,
  height    = 480,
  units     = "px"
)

# Opening a figure window for four plots
par(mfrow=c(2, 2))


len_vec <- nrow(data4)

# Plotting the first figure in position (1,1)
plot(data3$Global_active_power,
     type = "l",xaxt = "n",
     ylab = "Global Active Power",
     xlab = "")
axis(1, at = c(1,len_vec/2,len_vec),labels = c("Thu","Fri","Sat"))

# Plotting the second figure in position (1,2)
plot(data4$Voltage,type = "l",xaxt="n",xlab = "datetime",ylab = "Voltage")
axis(1, at = c(1,len_vec/2,len_vec),labels = c("Thu","Fri","Sat"))


# Plotting the second figure in position (2,1)
plot(data4$Sub_metering_1,type = "l",xaxt = "n",xlab = "",ylab = "")
lines(data4$Sub_metering_2,col = "red")
lines(data4$Sub_metering_3,col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,col=c("black","red","blue"),lty = c(1,1,1),y.intersp = 0.8)
title(ylab = "Energy sub metering")
axis(1, at = c(1,len_vec/2,len_vec),labels = c("Thu","Fri","Sat"))


# Plotting the second figure in position (2,2)
plot(data4$Global_reactive_power,type = "l",xaxt="n",xlab = "datetime",
     ylab = "Global_reactive_power")
axis(1, at = c(1,len_vec/2,len_vec),labels = c("Thu","Fri","Sat"))


# Closing the graphics device
dev.off()





