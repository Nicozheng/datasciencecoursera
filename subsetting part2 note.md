分割数据
partial matching模糊匹配
用$可以进行模糊匹配，[[]]不行，但是如果一定要用[[]]，那就用这样的语法：x[[“a”, exact = FALSE]]

除去数据中的NA
bad <- is.na(x)     is是输入布朗值的函数(false/true)
x[!bad]
如果要去除multiple vectors的NA，可以用complete.cases函数
x <- c(1,2,NA,4,NA,6)
y <- c(“a”,”c”,NA,”hello”,NA,7)
good <- complete.cases(x,y)
x[good]
y[good]
用complete.cases必须要两个函数一样长,这个函数把两个变量放在一起考虑，输出的good布朗值只要两个变量中有一个是NA就会变成FALSE

运算符在R中都是paralle的
做true matrix multiplication要用%%包住运算符，比如矩阵乘法要用 %*%

