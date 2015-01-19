### 分割数据
## partial matching模糊匹配
	用$可以进行模糊匹配，[[]]不行，
	但是如果一定要用[[]]，那就用这样的语法：x[[“a”, exact = FALSE]]

## 除去数据中的NA
	bad <- is.na(x)     is是输入布朗值的函数(false/true)
	x[!bad]
	
	如果要去除multiple vectors的NA，可以用complete.cases函数
	x <- c(1,2,NA,4,NA,6)
	y <- c(“a”,”c”,NA,”hello”,NA,7)
	good <- complete.cases(x,y)
	x[good]
	y[good]
	用complete.cases必须要两个函数一样长,这个函数把两个变量放在一起考虑，输出的good布朗值只要两个变量中有一个是NA就会变成FALSE

### R中的运算符
	运算符在R中都是paralle的
	做true matrix multiplication要用%%包住运算符，比如矩阵乘法要用 %*%

### reading and writing data

	读取表格式数据： read.table/ read.csv data <- read.table(“foo.txt”)
	逐行读取文本数据： readLines （可以读取任何文件，但是返回的只有字符向量）
	读取R code files: source （inverse of dump）
	读取逆序法写的R程序： dget (inverse of dput)
	读取R的空间：load
	读取单个二进制法写的R object： serialize
它们对应的把数据写进file的语法是：
	·write.table
	·write.Lines
	·dump
	·dput
	·save
	·serialize 

## to read larger datasets
	简单计算一下内存占用，如果文件大到大过了你的电脑RAM，那就不用读了。
	如果文件没有附注，那么就把comment.char = “”
	如果提前输入colClasses的值，一般你的R可以跑得比default设置快两倍，有一个很好地可以设置各列class的方法,可以更好地利用电脑内存：
	initial <- read.table(“foo.txt”, nrows =100)
	classes <- sapply(initial,class)
	tabAll <- read.table(“foo.txt”, colClasses = classes)

## dput和dget和dump
	dput可以把数据从原始数据中抽出来然后新建一个文件储存
	  y <- data.frame(a =1, b = “a”)
	  dput(y, file = “y.R”)
	  new.y <- dget(“y.R”)
	dump可以组合多组数据新建文件储存
	  x <- “foo”
	  y <- data.frame(a = 1, b = “a”)
	  dump(c(x,y),file = “new.R”)
	  rm(x,y) ##删除x和y来减小内存
	  source(“new.R”)

## 连接其他类型的文件
	file 打开文件连接
	gzfile 打开gzip压缩文件
	bzfile 打开bzip2压缩文件
	url 打开网页
	写法：
	con <- file(“foo.txt”,”r”#只读的意思)
	data <- read.csv(con)
	close(con)
	和 data<- read.csv(“foo.txt”)是一样的效果
