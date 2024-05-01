d <- read.table("household_power_consumption.txt",header=T,sep=";",na.strings = "?")

dd <- subset( d , Date %in% c("1/2/2007","2/2/2007" ) )
dim(dd)

names(dd)
sapply( dd , range )

?plot
#
library(lubridate)
dmy_hms( paste( dd$Date,  dd$Time )  )

head( paste( dd$Date,  dd$Time )  )

#paste( c("a","b") , c("1","2") )

dd$dt <- dmy_hms( paste( dd$Date,  dd$Time )  )

# DEVICE PLOT
with(dd  , plot( dt , Global_active_power ,type="l" ,xlab="",xaxt = "n",ylab="Global active Power (kilowatts) ", col="gray") )
custom.xticks <- c(dd$dt[0], dd$dt[1] ,dd$dt[length( dd$dt)/2] ,dd$dt[length( dd$dt)])
axis(1, at = custom.xticks, labels = c("Thu", "Fri", "Sat"), las = 1)

# PNG PLOT
png("plot2.png", width = 480, height = 480)
with(dd  , plot( dt , Global_active_power ,type="l" ,xlab="",xaxt = "n",ylab="Global active Power (kilowatts) ", col="black") )
custom.xticks <- c(dd$dt[0], dd$dt[1] ,dd$dt[length( dd$dt)/2] ,dd$dt[length( dd$dt)])
axis(1, at = custom.xticks, labels = c("Thu", "Fri", "Sat"), las = 1)

dev.off()


