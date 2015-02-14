##下载源文件
dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url,"diet_data.zip")
unzip("diet_data.zip",exdir="diet_data")
##显示文件夹里的文件名
list.files("diet_data")
##设置新的wd到该文件夹
setwd("E:/R/Coursera/diet_data")
##导入其中一个样本数据,并了解样本数据的格式
andy <- read.csv("Andy.csv")
head(andy)
length(andy$Day)
dim(andy)
str(andy)
summary(andy)
names(andy)
##创建一个andy样本第30天的weight数据子集
andy[which(andy$Day == 30),"Weight"]
subset(andy$Weight, andy$Day == 30)

##导入集体数据,full.name可以返回完整的文件路径，
##这样就不用切换设置wd了
setwd("E:/R/Coursera/")
files <- list.files("diet_data", full.names = TRUE)
head(read.csv(files[3]))
andy_david <- rbind(andy,read.csv(files[2]))
day_25 <- andy_david[which(andy_david$Day == 25),]
day_25
everybody <- data.frame()
for (i in 1:length(files)){
      everybody <- rbind(everybody,read.csv(files[i]))
}
summary(everybody)
median(everybody$Weight, na.rm = TRUE)
## 打出day30的所有人体重的中位数
## solution 1
day_30 <- everybody[which(everybody$Day == 30),]
median(day_30$Weight)
## solution 2
day30 <- everybody[which(everybody[,"Day"]==30),]
median(day30$Weight)

##编写自定义函数显示输入指定的天的平均体重
showMedianWeight(directory = "diet_data",day = 30)

## 更快的导入多组数据的方法
files <- list.files("diet_data", full.names = TRUE)
## 创建一个空的list tmp来储存数据
tmp <- vector(mode = "list", length = length(files))
## 用lapply读取数据到tmp list中，这时候的list有5个对象，
## 每个对象都是一个data.frame，可用summary函数
## 查看
tmp <- lapply(files,read.csv)
### summary(tmp)
### summary(tmp[[1]])
## 用do.call函数把list里面的对象bind到一起
output <- do.call(rbind,tmp)
summary(output)
