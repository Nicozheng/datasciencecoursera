### R programing week2

## help email 
	adress: r-help@r-project.org

	5 basic classes of objects for R:
	character(字符型)
	numeric(real number)
	integer
	complex(实数，有虚数i的那个 eg: 4+ i)
	logical(ture/false)

	most basic object is a vector（向量）
	everything in a vector have to be "in one class"
	list is a vector but can contain obejects of different classes
	Empty vectors can be created with the vector() function
	R把所有的数字都当做双精度来处理，如果需要输入整数型就要在数字后面加上大写的L
	Inf在R中表示无穷，是一个特殊的数字
	NaN表示“未定义值”，可以被当做不是value(eg. 0/0=NaN)

## attributes
	R objects can have attributes(name/dimnames/dimensions/class/length/other user defined attributes)
	attributes 可以通过attributes() function来赋值

	变换变量的value可以用as.ValueName()来变化，比如as.character()就会变成字符型，as.numeric()就会变成双精度的数值型

## 创建矩阵
	创建矩阵可以用x <- matrix(1:6, nrow = 2, ncol = 3);也可以用dim函数 x <- 1:6    dim(x) <- c(2,3)   结果是一样的
	另外一种创建矩阵的方法是用bind函数，有两种bind函数：cbind()和rband()   x <- 1:3 y <- 10:12  cbind(x,y)就会把x,y向量当做新矩阵的两个col列 相反rbind会把他们当做两个行

## Factors
	Factors are used to represent categorical data. treated specially by modelling functions like lm() and glm()
	Factors are better than integers because factors are self described(比如factor可以用male 和female就比integers的1和2更让人清楚要表达的意思)
	factor的赋值方法 x <- factor(c("yes", "yes", "no", "yes")) x这个factor的levels就有no 和yes 两种，table(x)就会得到no/yes的个数。unclass(x)可以吧factor的levels转化为数字形式。

## DATA FRAMES
	Data Frames是类似table的东西，但是它可以储存不同class的数据，像我们平时看到的报表有文字有数字什么的都是frame的类型。创建frame可以用x <- data.frame(x = 1:4, y = c(T,T,F,F))

	每个R object都可以有name，比如x <- 1:3 names(x) <- c("foo", "bar", "norf") 然后x中的1~3就分别有foo, bar, norf的名字。



