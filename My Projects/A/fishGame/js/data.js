//1 创建分数类
	var dataObj = function (){
		//分数
			this.score = 0;
		//吃到食物的种类 1--蓝色；2--橙色
			this.double = 1;
		//判断游戏是否结束
			this.gameover = false;
		//GAMEOVER 透明度 0~1
			this.alpha = 0;
	}
//2 添加绘制方法
	dataObj.prototype.draw = function(){
		//1 保存画笔的状态
			ctx1.save();
		//2 
		//3
		//4
		//5 绘制分数	
			ctx1.fillStyle = "red";
			ctx1.font = "35px Verdana";
			ctx1.textAlign = "center";
			var w = canWidth;
			var h = canHeight;
			ctx1.fillText("SCORE+"+this.score,w*0.5,h-80);
			//5.如果当前游戏已经结束，修改文字透明度，绘制文字 GAMEOVER 大一些 画布中心
				if(this.gameover){
					this.alpha += deltaTime*0.0003;
					this.alpha = this.alpha>1?1:this.alpha;
					ctx1.fillStyle = "rgb(255,255,255,"+this.alpha+")";
					ctx1.font = "55px Verdane";
					ctx1.fillText("GAMEOVER",w*0.5,h*0.5);
				}
		//6 恢复画笔1的状态
			ctx1.restore();
	}
//3 将data.js 挂载到index.html
//4 在main.js 中创建对象并调用响应方法
//5 添加assScore 方法添加分数
	dataObj.prototype.addScore = function(){
		this.score += this.double*100;
		this.double = 1; //默认吃到蓝色食物
	}
