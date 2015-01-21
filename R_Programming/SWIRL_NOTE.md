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
	
	










