# Machine Learning note 2--logistic regression

## classification
	y= {0,1}
	Threshold classifier output hθ(x) at 0.5:
	if hθ(x) >= 0.5, predict "y = 1"
	if hθ(x) < 0.5, predict "y = 0"
	一般我们不用linear regression来做classifiation的问题，因为一个坏数据点可能大大的改变预测函数（变得不准确）

	我们用logistic regression来做classification的问题
	
## hypothesis of logistic regression
	want 0 <= hθ(x) <= 1
	hθ(x) = g(θ'X)
	g(z) = 1/(1+e^(-z)) @@也叫S函数 sigmoid function
	hθ(x) = P(y=1|x;θ) 翻译为在给定x(假设肿瘤大小)，概率为θ的情况下，y=1(恶性)的概率为hθ(x)。
	P(y=1|x;θ) + P(y=0|x;θ) = 1

## Decision Boundary
	decision boundary 是hθ(x) = 0.5的时候以x1为横轴，x2为纵轴的分界线。

## Cost function
	如果应用logistic regression的函数hθ(x)到linear regression的cost fucntion(for gradient descent)里，会产生一个non-convex（非凸）的图像，gradient descent不一定能到最小点。
	所以优化logistic regression的cost function函数为：
	Cost(hθ(x),y) = {-log(hθ(x)) if y = 1; -log(1-hθ(x)) if y = 0}
	见两个图

## Simplified cost function for gradient descent
	Cost(hθ(x),y) = -1*y*log(hθ(x)) - (1-y)*log(1-hθ(x)) 
	gradient descent的θ公式见截图

## advanced optimization
	我们有code可以计算J(θ)和J(θ)关于θ的导数。
	因为我们知道：θ = θ - α*[J(θ)关于θ的导数]，所以知道这些对我们的计算会非常方便
	ways are : 
		Gradient descent 
		Conjugate gradient
		BFGS
		L-BFGS
	后三种的有点和缺点：
		advantages: 不用手动选α；比gradient descent更快
		disadvantages：更复杂

	用高等收敛方法来求最小值
		首先在写字板里自定义函数
		function [jVal, gradient] = costFunction(theta)
		jVal = (theta(1)-5)^2 + (theta(2)-5)^2;
		gradient = zeros(2,1);
		gradient(1) = 2 * (theta(1)-5);
		gradient(2) = 2 * (theta(2)-5);

		然后在octave的comman界面里输入
		options = optimset('GradObj','on','MaxIter',100);
		initialTheta = zeros(2,1);
		[optTheta, functionVal,exitFlag] = fminunc(@costFunction, initialTheta, options)
		随后octave会输出对应的theta值使函数收敛，functionVal输出的是最后对应的theta对应的jVal值 exitFlag表示函数是否收敛，收敛=1

## multiclassi classification
	原理就是把多个需要classification的变量分开来，先计算一个（1），把其他的当作这个的不包含（0），以此类推计算其余的，然后选取max(h(θ))即可信度最大的那个
	



