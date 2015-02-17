# regularization
	
## the problem of Overfitting
	predicting model不是很适合data我们叫它“underfit”或者"high bias"

	predicting model不平滑（看上去没有规律）我们叫这种问题"overfitting"或者"high variance"

	解决overfitting的方法：
		1. reduce number of features.(手动或者自动)
		2. regularization 
			-keep all the features, but reduce magnitude/value of theta
			-works well when we have a lot of features, each of which contributes a bit to the predicting Y。

## Cost Function
	small value for parameter θ0, θ1, θ2,....
	把某些θ小到近似于0，多变量的函数就会类似少一些变量的函数，所以拟合程度会更好
	表达式见图

## regularization for linear regression
	表达式见图 共有gradient descent和normalization两种

## regularization for logistic regression
	表达式见图 共有gradient descent和advanced optimization两种