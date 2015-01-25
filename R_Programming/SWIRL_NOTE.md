## SWIRL 

	调用swirl包，需要用library(swirl) 然后打swirl() 

### 1. basic building blocks
	用?可以直接调出相关函数/指令的帮助html页面
	up arrow（方向箭的向上）可以调出之前输入的语句进行修改（如果之前的输入有错）
	如果不记得之前命名的变量，只要输入前两个字母然后点击tab键，R会给你一个下拉列表显示所有以那个字母开头的变量

### 2. workspace and files
	getwd() <— get working directory
	ls()  <— list all the objects in your local workspace 
	dir.create(“xxx”) <— 在现在的working directory创建一个新的名叫xxx的dir
	file.create(“XXX.R”) <— 新建R文件
	list.files() <— 列出现在Working Dir里面所有的文件
	file.exists(“XXX.R”) <— 查询XXX文件在不在WD里面
	file.info(“XXX.R”) <— 获取XXX文件的信息 在后面加$mode可以调取具体的细节信息
	file.rename(老名字，新名字)  
	file.path(“XXX.R”) <— 获得XXX文件的链接
	unlink(“XXX”)  <— 可以删除没用的dir，如果这个dir里面有其他文件，需要写成unlink(“XXX”,recursive = TRUE)

### 3. Sequences of Numbers
	打开operator（运算符比如：，＋）的帮助页面，需要在?后面用’’把符号包起来
	: 在R中可以用来创造数列 1：20 就是1~20 
	seq()函数也可以实现上面的功能，也可以对数列加入更多的control
	seq(…)函数的usage是：seq(from = 1, to = 1, by = ((to - from)/(length.out - 1)),length.out = NULL, along.with = NULL, ...)
	seq_along(30)也可以直接生成1~30，by=1的数列
	rep() stands for “replication” 用法是：rep(num, times = XXX) 可以将num重复XXX遍
	rep(c(1,0,2), times =10)可以将向量1,0,2重复10遍；rep(c(0,1,2), each=10)就会将0先重复10遍，然后是1，然后是2

### 4. Vectors
	<、>、<=、>=、==、!= 都是logical operations，可以生成布朗值
	逻辑值判断中 & 表示and；|表示or；！表示not
	字符向量my_name:c(“My”,”name”,”is”)可以用paste函数把它粘贴成一句话,用法：paste(my_name,collapse = “ ”)
	如果要用paste直接组合字符，需要设置sep参数：paste(“Hello”, “World!”, sep = “ ”) sep告诉R要用 间隔开两个字符
	paste还可以用来组合两个向量。paste(1:2,c("X","Y","Z"),sep = "") 输出是：[1] "1X" "2Y" "1Z"
	LETTERS是R中内置的A~Z的字符表
	
### 5. Missing Values
	rnorm(X)可以生成X个符合标准随机排量的数值
	sample(X,NUM) 可以在X中随机选NUM数量的sample，也可以设置replace参数来选择是否有重复
	当NA出现时，用logical operation都要小心，因为NA不可以拿来被比较，即使是和NA本身比较也不可以。
	R中TRUE被看做1，FALSE被看做0，要数一个vector中的NA的量，先做比较is.na，再用sum（）函数就可以了
	NA表示丢失的数据
	NaN表示“not a number”，就像0/0
	
### 6. Subsetting Vectors
	x[!is.na(x)]可以抽出x vector中所有的非NA数值。
	如果结合逻辑值判断 x[!is.na(x) & x > 0]会得到所有x vector中非NA的正值。
	从x中分别取出第3，5，7个数，要用x[c(3,5,7)]，如果不用c()，只写x[3,5,7]会得出错误提示。
	如果x只有40个数值，x[1000]会得出NA的回复，但是R不会raise error，所以在分析数据的时候我们要非常清楚自己分析的数据规模大小。
	R不是zero-based的，而是one-based的。就是说R vector中的第一个数值是1，x[1]将会提取出x的第一个数值；而且“-”在R中不是表示从最后一个数字开始数，而是“不包括”的意思，就是说x[c(-2,-10)]就会得出x中除了第二个和第十个数值之外的所有数值。x[-c(2,10)]也可以得到一样的结果。
	x <- c(foo = 11, bar =2, norf = NA)将会创造出带有name的vector。用names(x)可以得出x中所有变量的字符串格式。 也可以通过names(x) <- c(“foo”, “bar”,”norf”)来给只有数值的变量赋值名字。
	identical(x,y)可以检查x和y是不是一样的vector
	用名字召唤数值的时候要加双引号。如x[“bar”]

### 7. Matrices and Data Frames
	dim可以调出或设定变量的dimensions。如果用dim(x),x是一个普通的一维vector，会得出NULL的结果。相反如果要对一维的vector调出其长度，要用length(x)。要用dim设定一个一维vector的dimensions，可以用dim(x)<-c(2,4),设定x的row是2(竖着)，columns是4（横着）.这一下也把一维的vector变成了二维的matrix.
	attributes(x)可以调出x的attributes。（包括name/dim等等）
	用matrix()函数可以更快的创造出matrix。
	cbind可以”combine columns”(竖着combine)；rbind也一样，就是横着combine了。
	matrix只可以contain一种class的变量，如果我们加入字符变量(比如名字)，它会“胁迫”所有的数字都转化成字符串格式，这种变化叫做“implicit coercion”（含蓄的胁迫）。
	要应对这种状况，在我们要考虑加入名字这种字符变量前，就要考虑到要用frame这种格式而不是matrix。比如patient变量contain了所有数据的名字，一个my_matrix包含了所有的数字。要把它们连成一个frame要用data.frame(patient,my_matrix)来生成一个类似excel表格的frame。
	colnames()可以用来设置你frame的“colnames attribute”。用法和dim一样。
	
### 8. Logic
	talked about ==、>、<、>=、<=、!=
	!TRUE = FALSE 
	!FALSE = TRUE
	“&”和“&&”在R中都代表AND，不同的是&会比较所有的值，&&只会比较一个vector中的第一个数。
	同样的还有“|”和”||”代表的OR。TURE | c(TRUE,FALSE,FALSE)会产生的结果是TRUE TRUE TRUE
	在logical operator的运算中，and(&和&&)有比or（|和||）更高的运算级。
	isTRUE()可以判断括号中的值是否是TRUE的。并以此返回布朗值，如isTRUE(6>4)的结果是TRUE
	identical()也会返回布朗值，如果键入的两个比较的值一样（可以是任何class的）返回TRUE，否则FALSE
	xor()是R中判断“exclusive OR”就是仅仅是OR的关系的函数，只有当比较的两个量一个是false一个是true的时候才会返回TRUE，其他时候都是FALSE，就是说xor(TRUE,TRUE)的值也是FALSE。
	which函数可以锁定括号内逻辑值组合中TRUE的位置，比如which(c(TRUE,FALSE,TRUE))就会返回一个vector c(1，3)
	any()函数只要当口号中的vector有一个true就会返回TRUE。
	all()函数要所有的都是TRUE才会返回TRUE。
	
### 9. lapply and sapply (LOOPING FUNCTIONS)
	lapply >>>list apply，就是把frame的每列分别代入后面你选定的要looping的函数里。比如你要查frame的每列的class（当然可以手工操作），就要用x <- lapply(frame, class) 会返回list格式的值。注意这里要查的attribute，只需要写function的名字就可以了，不需要对格式进行设置。
	sapply >>> simple list apply,就是把lapply的值简化成理想的格式，比如list简化成character的vector（list里面的变量length为1）或character的matrix（list里面的变量length>1）。如果sapply不知道要转化成什么，会返回和lapply一样的结果（即list）。
	head()可以返回一个frame的前6行来预览表格是什么样子的。
	range()返回数列中的最大值和最小值
	unique()返回数列中涉及到的所有值（重复值只保留一个）
	lapply(list_x, function(elem) elem[2])是自建函数的一种，能返回list_x中的第二行（第二个element）的原本值。
	viewinfo()可以查看数据的源文件

### 10. vapply and tapply (debugging和聚类分析)
	vapply功能和sapply差不多，但是与sapply不同，vapply可以让你自己指定输出的数据格式，如果（跑程序）输出的格式与你指定的格式不同，vapply会停止运行并且throw an error提示你这里错了。少了很多麻烦debugging或者被错误的数据误导。
	vapply(flags, unique, numeric(1)), which says that you expect each element of the result to be a numeric vector of length 1.
	vapply在编写大代码（不是在IDE里面及时可以看到输出）的时候比sapply要安全很多，在跑大量的数据的时候也更快，但是如果在IDE/prompt里面，用sapply就足够安全了。
	tapply >>> apply a function over a ragged array（聚类分析）
	table()根据当列的不同值，把相同值的个数加在一起返回一个table,（可以用来统计百分比）。比如用flags的那个数据库，table(flags$landmass)就会返回1~6（代表不同大洲）的国家个数。
	对值只有1/0的列取mean平均值，会得到1占总数据的百分比。
	tapply(flags$animate,flags$landmass,mean)会得到在每个大洲（1~6）国旗中有生物的国家所占的百分比。
	summary()会得到括号里数据的一个值分布summary（包括min最小值,1/4值,median中位数,mean,3/4值，max最大值）
	
## 11. Looking at data
	read.csv()和read.table()读入数据的默认格式是data.frame
	nrow()可以查看表的列数row（observations）
	ncol()可以查看表的行数col（variables）
	object.size()可以查看数据占用了多少内存
	head(frame,num)可以查看frame的前num行，对表格有一个直观的了解。不输入num默认是6行。
	tail(frame,num)和head()一样的作用，看的是从后面开始数的。
	summary(frame)会得到一个表格数据分布的基本报告，包括NA有多少，大概涉及的data是什么之类的，帮助我们了解表格数据是怎么分布的。
	分类数据categorical variables在R中叫做factor variables.
	想要了解summary用others省略掉的factor/categorical数据（因为太多了列不下），我们可以用table()函数把它全部显示出来。
	str()是想要对frame有直观了解最好的函数了，它结合了以上的很多函数，会告诉你frame的类型，涉及的row/col,每一个varibles是什么，它们是什么class类型的，还有对前10个数据的直观展现。
	str()基本可以分析R中的任何class的数据，除了data以外，还可以分析function比如mean、sum、class等等
	
### 12. Simulation
	sample(1:6,4,replace = TRUE)表示R可以在1~6中随机的可重复的选择一个数字4次。如果需要不可重复的随机选择，可以不用写replace（因为默认就是不可重复）。如果不设置4次就不用写，会选择和你设定的scale一样多的次数，这个例子中就是6次。
	sample()还可以重新组合字母，sample(LETTERS)就可以利用R内置的LETTERS变量对26个英文字母随机重新排列。
	sample()还可以设置数字出现的概率。假设我们翻一个不均匀的硬币100次，正面朝上（假设为1）的概率为0.7，反面（0）为0.3，这个语句就应该写成sample(c(0,1),100,replace =TRUE,prob=c(0.3,0.7))
	Each probability distribution in R has an
r*** function (for "random"), a d*** function (for "density"), a p*** (for "probability"), and q*** (for "quantile").
	对于只有两个数的二进制数据(binary)，可以用rbinom()函数，rbinom函数只统计“成功”的数据(即二选一)，rbinom的写法是:rbinom(n,size = num, prob = x)，表示执行n次，执行的数据范围从0~num，其中num出现的概率是x.
	rnorm是随机生成符合标准正态分布的数字。标准正态分布的mean是0，sd是1，所以rnorm(10)就会随机生成符合这种默认设定的10个数字。但是也可以自己设置mean/sd，设定格式如下：rnorm(n, mean = x, sd = y)
	rpois是随机生成符合泊松分布(Poisson Distribution)的函数，用法是：rpois(n, lambda = x)，生成n个mean/lambda是x的数字。”lambda = “可以省略，rpois(5,10)will work.
	replicate(n,rpois(5,10))可以重复rpois函数n次。生成n组5个符合poisson分布的matrix。
	colMeans()可以算每col的平均数。
	hist()可以生成data的直方图(histogram)
	All of the standard probability distributions are built into R, including exponential (rexp()), chi-squared(rchisq()), gamma (rgamma()), .... 
	
### 13. Dates and Times
	Sys.Date() / Sys.time()可以提取计算机的当天时间。其中date以date的格式记录；time以POSIXct的格式记录。
	unclass()可以查看时间格式在计算机内部的格式，which would be interesting, 是1970-01-01到当天的天数。（1970-01-01以前的时间会以负数形式记录）
	as.Date(“1980-01-01”)可以生成时间“1980-01-01”的时间数据。
	as.POSIXlt(System.time())可以吧POSIXct的默认时间格式转化成POSIXlt格式。他们两者的区别是后者是以一个list的形式把分钟、秒、时间、年份等等分开储存的，可以进行修改和提取自己需要的数据part进行分析。
	weekdays()会提取时间是星期几。
	months()会提取时间是几月
	quarters()会提取是第几季度
	strptime()函数可以通过设置帮助R读懂乱七八糟的输入的时间格式，具体见它的帮助页面。
	时间可以比较(用> < ==等等)，也可以相剪相加得到时间差。
	difftime()函数可以自定义时间差的现实单位,如difftime(Sys.time(),time1,units='days’)用了days来衡量时间差。
	
### Base Graphics
	画图前了解数据，Key R commands for doing so include, dim(), names(), head(), tail() and summary().
	plot()会话括号内数据的散点图。
	要对plot()的x和y轴设定变量，用以下格式：plot(x = cars$speed, y = cars$dist)，否则默认的格式会把第一个数据做x轴，第二个做y轴。
	画图可以设置很多参数，具体见plot的帮助页面。
	有一些没列出来的参数设置：见?par、?points
	  col = 表示颜色
	  xlim = c(10,15) 表示x轴值从10~15
	加载某个数据包用data()函数，比如data(cars)
	矩形图box plot用函数boxplot()来画，比如boxplot(formula=mpg~cyl, data=mtcars)
	hist()用来画柱状图，可以最好的表现单个变量。
	
	
	
	



















