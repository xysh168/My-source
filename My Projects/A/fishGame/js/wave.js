//1 创建一个吃食物特效的类waveObj()
	var waveObj = function(){
		this.x = []; //==>圆心
		this.y = [];
		this.r = []; //==>半径
		this.alive = []; //是否活动
		this.num = 10;
	}
//2 为特效类添加一个初始化方法
	waveObj.prototype.init = function(){
		for(var i = 0;i<this.num;i++){
			this.alive[i] = false;
			this.r[i] = 0;
			this.x[i] = 0;
			this.y[i] = 0;
		}
		//console.log(this.x,this.y,this.alive,this.r);
	}
//3 为特效类添加一个绘制方法
	waveObj.prototype.draw = function(){
		//1 保存画笔1的状态
			ctx1.save();
			ctx1.lineWidth = 1;
			/*ctx1.shadowBlur = 5;
			ctx1.shadowColor = "red";*/
		//2 创建循环
			for(var i = 0;i<this.num;i++){
			//3 判断当前特效对象是否活动
				if(this.alive[i]){
					//4 
					//5 变大 增加 100 停止
						this.r[i] += deltaTime*0.02;
						if(this.r[i]>50){
							this.alive[i] = false;
							return;
						}
					//变淡效果
						var alpha = 1 - this.r[i]/100;
					//6 开始一个新路径
						ctx1.beginPath();
						ctx1.strokeStyle = "rgba(255,255,255,"+alpha+")"; 
					//7 画圆
						ctx1.arc(this.x[i],this.y[i],this.r[i],0,2*Math.PI);
					//8 闭合路径-描边
						ctx1.closePath();
						ctx1.stroke();
				}
			}
		//9恢复画笔状态
			ctx1.restore();
	}
//4 为特效添加属性 10个	
//5 挂载到index.html
//6 在main.js中调用方法
//7 为特效类增添出生方法
		waveObj.prototype.born = function(x,y){
			//创建循环
			for(var i = 0;i < this.num;i++){
			//查找第一个不活动状态的特效对象
				if(!this.alive[i]){
					this.alive[i] = true;
					this.r[i] = 20;
					this.x[i] = x;
					this.y[i] = y;
					return;
				}
			//r = 20 ; x = x ; y = y;
			}
		}
