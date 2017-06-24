# This code is part of the Assignment of Week 1 of the Coursera
# course "Exploratory Data Analysis"

# The below R code generates "plot2.png"

# Input the Data 
data_plot2 <- read.csv("household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE)

# Subsetting rows corresponding to the needed dates
data2 <- data_plot2[data_plot2$Date %in% c("1/2/2007","2/2/2007"),]

# Removing rows where Global_active_power values are missing
data2[data2$Global_active_power == "?"] <- NA
data2 <- data2[complete.cases(data2$Global_active_power),]  

# COnverting the character vector to numeric type
data2$Global_active_power <- as.numeric(data2$Global_active_power)

# Opening a png graphics device
png(
  "plot2.png",
  width     = 480,
  height    = 480,
  units     = "px"
)

#Plotting line graph of the Global Active Power vector
plot(data2$Global_active_power,
     type = "l",xaxt = "n",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

# Specifying the labels on x-axis as needed
len_vec <- length(data2$Global_active_power)
axis(1, at = c(1,len_vec/2,len_vec),labels = c("Thu","Fri","Sat"))

# Closing the png graphics device
dev.off()





