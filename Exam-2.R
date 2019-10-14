exam 2, Oct.14, 2019
install.packages("nutshell")
library(nutshell)
library(tidyverse)
load(file="test2_data_rev.Rdata")
t2
library("stringr")
date<-scan(file="test2_data_rev.Rdata",
           what="character",skip=1, nlines=1, quiet= TRUE)

mm<-str_sub(string=date, start=1,end=2)
mm
typeof(mm)
dd<-str_sub(date,4,5)
dd
dd<-as.numeric(dd)
typeof(dd)
yy<-str_sub(date,7,8)
yy

date<-str_c(mm,dd,yy,sep="/")

d$dateTime<-str_c(d$date, d$time, sep=" ")
d$dateTime
d$dateTime2<-as.POSIXct(strptime(x=d$dateTime, format="%m/%d/%y %H:%M:%OS", tz="America/New_York"))
head(d)




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

load(file="aurelia_15minCell_statareas.Rdata")
d=file
d<- f[f$aurelia_15minCell_statareas.Rdata=="2012",]


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