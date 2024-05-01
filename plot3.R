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

with(dd  , plot( dt , Sub_metering_1 ,type="l" ,xlab="",xaxt = "n",ylab="Energy sub metering", col="black") )
with(dd  , points( dt , Sub_metering_2 ,type="l" ,xlab="",xaxt = "n",ylab="Energy sub metering", col="red") )
with(dd  , points( dt , Sub_metering_3 ,type="l" ,xlab="",xaxt = "n",ylab="Energy sub metering", col="blue") )
custom.xticks <- c(dd$dt[0], dd$dt[1] ,dd$dt[length( dd$dt)/2] ,dd$dt[length( dd$dt)])
axis(1, at = custom.xticks, labels = c("Thu", "Fri", "Sat"), las = 1)
legend( "topright" , pch= "_" , col=c("black","red","blue") , legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )

# PNG PLOT
png("plot3.png", width = 480, height = 480)

with(dd  , plot( dt , Sub_metering_1 ,type="l" ,xlab="",xaxt = "n",ylab="Energy sub metering", col="black") )
with(dd  , points( dt , Sub_metering_2 ,type="l" ,xlab="",xaxt = "n",ylab="Energy sub metering", col="red") )
with(dd  , points( dt , Sub_metering_3 ,type="l" ,xlab="",xaxt = "n",ylab="Energy sub metering", col="blue") )
custom.xticks <- c(dd$dt[0], dd$dt[1] ,dd$dt[length( dd$dt)/2] ,dd$dt[length( dd$dt)])
axis(1, at = custom.xticks, labels = c("Thu", "Fri", "Sat"), las = 1)
legend( "topright" , pch= "_" , col=c("black","red","blue") , legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )

dev.off()


