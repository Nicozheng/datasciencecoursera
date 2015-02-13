#R_Programming week2 note Control Structures

## Control Structures- if-else
	if(<condition>) {
		@@do something
	}else{
		@@do something else
	}

	if(<condition>){
		@@do something
	}else if(<condition2>){
		@@do something differnet
	}else{
		@@do something differnet
	}

	E.g:
	y <- if(x>3){
		10
	}else{
		0
	}
	

## Control Structures- for loops
	for-loop的四种写法：
	x <- c("a","b","c","d")
	for (i in 1:4){
		print(x[i])
	} 

	for (i in seq_along(x)){  @@ seq_along函数按x的长度返回1：length(x)的数值
		print(x[i])
	}

	for (letter in x){
		print(letter)
	}

	for (i in 1:4 print (x[i]))

	for-loop can be nested:
	x <- matrix(1:6,2,3)
	for (i in seq_len(nrow(x))){
		for (j in seq_len(ncol(x))){
			print (x[i,j])
		}
	}

## Control Structures- while loops
	compare to for loops, while loops are more readable, however,
	be careful when use while loops, there is no gurantee that the while loop will stop.

	z <- 5
	while (z >=3 && z <= 10){
  		print (z)
  		coin <- rbinom(1,1,0.5) @@rbinom(n,size,prob)是按二项分布按prob概率随机选择0~size里长度为n的数）
  	
  		if (coin == 1){
      		z <- z +1      
    	}else{
      		z <- z -1
    	}
	}


## Control Structures- repeat, next, break
	the only way to stop repeat loop is to call break.
	repeat的用法
	x0 <- 1
	tol <- 1e-8 		@@ 0.000000001
	repeat{
		x1<- computerEstimate()
		if (abs(x1-x0)<tol){
			break
		}else{
			x0 <- x1
		}
	}

	next的用法
	next用来跳过某些循环
	for (i in 1:100){
		if(i <= 20){
			next   @@跳过前面的20步循环
		}
		@@ do something here
	}

	return的用法
	return用来设置跳出functions


## Function
	functions要保存在R的working dir里面
	functions在R里被当作"first class objects"，也就是说和function和其他的R objects没有任何区别。
	functions可以被其他functions引用，也可以在functions里面编写其他的functions

	function的输出就是在function中写的最后一个对象

	Functions的写法
	colmean <- function(x, removeNA = TRUE){
 		number_col <- ncol(x)
  		means <- numeric(number_col)
  		for (i in 1:number_col){
    		means[i] <- mean(x[,i],na.rm = removeNA)
  		}
  		means
	}

	Function的结构
		foraml arguments是function中被括号包裹的部分，上文示例中的x，formals(Function_name)可以返回function的formal部分，不是所有的function都有formal的，有些function的formal缺省或者有系统内置default value.

		arg(function_name)可以返回function中argument的部分
		argument matching既可以用position也可以用name也可以混用。

		f <- function(x,y,...) ...在这里可以代表f function中被省略引用的plot function。(因为plot的function很长)
		只要在f的正文部分用了plot的函数就可以用了。

		...也可以用在argument中省略输入对象的类型比如
		paste(..., sep = " ", collapse = NULL) @@sep代表seperate
		...就表示用来paste的对象不限于是numeric 还是vector还是 data.frame之类的都可以。
		在用到以...开头的function要注意输入变量后的任何在变量后的设定又要具体的用名字来表明，否则会被R当作是...中的一部分被一起引用。


## Lexical Scoping 词法作用域
	Lexical Scoping in R means that:
		the value of free variables are searched for in the environment in which the function was defined.
	what is environment?
		-An environment is a collection of (symbol,value) pairs. ie. x is a symbol; 3.14 is a value
		-every environment has a parent is the empty enviroment
		-the only enviroment whithout a parent is the empty environment
		-a function + an environment = a closure or function closure.
	searching for the value for a free variable:
		- 如果一个symbol的value没有被defined，R首先会找这个function被defined的environment，如果没有，会找它的parent environment，如果还没有会一直往上找直到找到top-level environment（通常是global-environment或者某个包的namespace），
		如果还没有找到，会继续搜索直到到达empty environment，然后抛出一个error。
	Lexical Scoping的好处：
		Lexical Scoping在define function的时候有很大的用处，比如：
		make.power <- function(x){
			pow <- function(n){
				x^n
			}
			pow
		} 
		make.pow(3)   >>> 27（3^3）
		以上function在输出的时候输出了另一个functon pow，然后函数返回了pow函数，x和n都没有被当作free variable

		怎样发现一个environment里有哪些function呢？
		ls(environment(cube))  >>>　"n"  "pow" 
		可以发现在cube environment里面有两个functions
		get("n", environment(cube))   >>> 可以返回n的值

	Othere Languages support Lexical Scoping
		Scheme
		Perl
		Python
		Common Lisp(all languages converge to Lisp)

	所有R的objects必须被储存在RAM内存里


##Time and Dates
	as.Date("2015-1-18") 可以储存变量为时间
	Sys.time() 可以提取机器当前时间
	weekdays() 可以返回星期几
	months() 可以返回时间
	quarters() 可以返回季度

	time 数据分两大类
		POSIXct(所有数据都储存在一个big interge的hood里，没有标签可用)
		POSIXlt(有用的数据类似week,day,year,month,day of the month被储存在一个List里)
		POSIXlt是POSIXct的升级版，POSIXct占更少内存。

	strptime() 可以用来转换不规则格式的时间
		E.g. x <- c("January 10, 2012, 10:40","December 9, 2011, 9:10")
			 x <- strptime(x, "%B %d, %Y, %H:%M")
			 >>> "2012-01-10 10:40:00 EST" "2011-12-9 09:10:00 EST"

	Data格式和POSIXct/lt格式不能用来做时间差的换算，要转化成同一种格式才行
	as.POSIXct("....",  tz = "GMT") tz可以用来设置时区
	










