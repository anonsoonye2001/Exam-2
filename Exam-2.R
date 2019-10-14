exam 2, Oct.14, 2019
install.packages("nutshell")
library(nutshell)
library(tidyverse)
load(file="test2_data_rev.Rdata")
t2
s=t2$date_chr
date=s
library("stringr")

mm<-str_sub(string=date, start=1,end=2)
mm
typeof(mm)
dd<-str_sub(date,4,5)
dd
dd<-as.numeric(dd)
typeof(dd)
yy<-str_sub(date,7,10)
yy

date2<-str_c(mm,dd,yy,sep="/")
date2=as.character(date2)
date2

t2$date<-str_c(t2$date, sep="/")
t2$date
t2$date<-as.POSIXct(strptime(x=t2$date, format="%m/%d/%y", tz="America/New_York"))
head(t2)




install.packages("data.table")
library(data.table)
library(tidyverse)
library(readxl)
a2<-read.table(file="aurelia_15minCell_statareas.txt",sep=",",header=T,
               stringsAsFactors = F)
a2
b2<-read_excel(path = "Aurelia_SEAMAP_2012-2018_30minCell.xlsx")
b2
getwd()

setwd("C:/Users/username/Desktop/R programming")
list.files(pattern="txt")
list.files(pattern=".txt")
list.files()
library(data.table)
c1<-fread(input="aurelia_15minCell_statareas.txt", sep = ",",
          header = T,stringsAsFactors = F)
head(c1)
c2<-read.csv(file="aurelia_15minCell_statareas.txt",header=T,
             sep=",",stringsAsFactors = F)
head(c2)
c3<-read.table(file="aurelia_15minCell_statareas.txt",header=T,
               sep=",",stringsAsFactors = F)
head(c3)
library(tidyverse)
c4<-read_csv(file="aurelia_15minCell_statareas.txt")
head(c4)            


r=c4[c4$year=="2012",]
r
subset.2012=subset(r=c4, year=="2012")
save(subset.2012,file="aurelia_data.Rdata2")

load(file="test2_deep.Rdata")
load("test2_mid.Rdata")
load("test2_shallow.Rdata")
df.shallow=as.data.frame(shallow)
df.mid=as.data.frame(mid)
df.deep=as.data.frame(deep)
bind=rbind(df.shallow,df.deep,df.mid)
bind

load(file="t2-1.Rdata")
load(file="t2-2.Rdata")

df.t2.1=as.data.frame(t2)
df.t2.2=as.data.frame(t2.1)

join=full_join(df.t2.1,df.t2.2,by="parcel.id")
join

merge=merge(df.t2.1,df.t2.2,by="parcel.id")
merge


data("batting.2008")
d<-batting.2008
hr<-tapply(X=d$HR, INDEX=list(d$teamID), FUN=sum)
hr
team.stats.sum<-aggregate(x=d[,c("AB","H","BB","2B","HR")],by=list(d$teamID),FUN=sum)
team.stats.sum
team.sum=summarise(.data=d,)
team.sum
team.sum1=d%>%group_by(teamID)%>%summarise(HRsum=sum(HR),HRmean=mean(HR),
                                          HRsd=sd(HR))
team.sum1
team.sum=d%>%group_by(teamID)%>%summarise(HRsum=sum(HR),HRmean=mean(HR),
                                          HRsd=sd(HR),ABcount=n())
team.sum


load("t2-1.Rdata")
t2.1
t2.1.melt<-melt(data=t2.1,id.vars = c("transect","parcel.id"),measure.var=c("group"))


t2.1.cast<-dcast(data=t2.1.melt,formula=transect~variable,value.var = "numbers",
               fun.aggregate = sum)
head(t2.1.cast)