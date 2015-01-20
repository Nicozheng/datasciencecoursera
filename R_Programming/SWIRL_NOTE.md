## SWIRL

	调用swirl包，需要用library(swirl) 然后打swirl() 

### basic building blocks
	用?可以直接调出相关函数/指令的帮助html页面
	up arrow（方向箭的向上）可以调出之前输入的语句进行修改（如果之前的输入有错）
	如果不记得之前命名的变量，只要输入前两个字母然后点击tab键，R会给你一个下拉列表显示所有以那个字母开头的变量

### workspace and files
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
	