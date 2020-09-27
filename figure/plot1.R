#rm(list=ls()) 
data1<-read.delim("household.txt",sep = ";")

s<-split(data1,data1$Date)

a1<-s$`1/2/2007`
a1<-transform(a1, Date=as.Date(Date))
a2<-s$`2/2/2007`
a2<-transform(a2, Date=as.Date(Date))

data2<-rbind(a1,a2)

png("plot1.png", width=480, height = 480)
hist(as.numeric(data2$Global_active_power), col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
