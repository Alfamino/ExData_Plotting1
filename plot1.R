d <- read.table("household_power_consumption.txt",header=T,sep=";",na.strings = "?")

dd <- subset( d , Date %in% c("1/2/2007","2/2/2007" ) )
dim(dd)

names(dd)
sapply( dd , range )

# DEVICE PLOT
with(dd  , hist( Global_active_power ,xlab="Global active Power (kilowatts) ", col="red",main="Global active Power") )

# PNG PLOT
png("plot1.png", width = 480, height = 480)
with(dd  , hist( Global_active_power ,xlab="Global active Power (kilowatts) ", col="red",main="Global active Power") )
dev.off()


names(d)
dim(d)
head(d$Date)
class(d$Date)
?read.table

#dd <- subset( d , Date %in% "2007" )
#dim(dd)
#dd
#?subset
#"01" %in% c("01","02" )
#sum( d$Date %in% c("1/2/2007","2/2/2007" ) )
#sum( d$Date %in% c("1/2/2007","2/2/2007" ) )
#sum( year(d$Date)==2007 )
#sum( c("01/02/2007","02/02/2007" ) %in% d$Date  )
#length(  grep( "2007", d$Date )  )
#dd <- d[ grep( "2007", d$Date ) , ]
#head(dd$Date)
#dd  <- d[ d$Date %in% c("1/2/2007","2/2/2007" ) , ]
