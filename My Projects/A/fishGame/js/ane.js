//保存海葵的类、初始化方法、绘制方法
	var aneObj = function(){
		this.rootx = [];//start_point  y值固定在画布最底端
		this.headx = [];//end_point
		this.heady = [];//end_point
		this.amp = [];  //振幅(-1~1)
		this.alpha = 0; //正弦函数的角度
	}
	aneObj.prototype.num = 50;
	aneObj.prototype.init = function(){
		var h = canHeight;
		for(var i = 0; i < this.num;i++){
			this.rootx[i] = i*16 + Math.random()*20; //起点坐标
			this.headx[i] = this.rootx[i];           //初始时终点坐标和起点坐标相同
			this.heady[i] = canHeight - 250 + Math.random() * 50;
			this.amp[i] = Math.random() * 50 + 50; 
		}
	}
	aneObj.prototype.draw = function(){
		//1 海葵随着时间变化
			this.alpha += deltaTime*0.0008;
			var l = Math.sin(this.alpha);
		//2 
		//3 保存画笔2的状态
			ctx2.save();
		//4 描边样式+透明度+圆角+描边宽度
			ctx2.strokeStyle = "#3b154e";
			ctx2.globalAlpha = 0.3;
			ctx2.lineCap = "round";
			ctx2.lineWidth = 15;
		//5创建循环绘制路径
			for(var i = 0;i <= this.num;i++){
				//6移动起始点
					ctx2.beginPath();
					ctx2.moveTo(this.rootx[i],canHeight);
				//7绘制贝赛曲线 -控制点 -起点-终点
				this.headx[i] = this.rootx[i] + l * this.amp[i];
					ctx2.quadraticCurveTo(this.rootx[i],canHeight-100,this.headx[i],this.heady[i]); 
				//8描边
					ctx2.stroke();
			}
		//9恢复画笔状态
			ctx2.restore();	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*//1、创建一个海葵的类
		var aneObj = function(){
			//1.1:创建海葵的      x-坐标数组
				this.x = [];
			//1.2:创建海葵高度 len-数组
				this.len = [];
		}
	//2、为海葵的类添加一个属性，数量为50
		aneObj.prototype.num = 50;
	//3、为海葵添加方法  init
		aneObj.prototype.init = function(){
			for(var i = 0;i<this.num;i++){  
			//每个海葵生长的位置随机，自然生长
				this.x[i] = i*16 + Math.random()*20;
			//每个海葵的高度：基准值+随机值
				this.len[i] = 200 + Math.random()*50;
			}
			//console.log(this.x);
			//console.log(this.len);
		}
	//4、为海葵添加方法  draw
		aneObj.prototype.draw = function(){
			//1:保存状态
				ctx2.save();
			//2：描边样式
				ctx2.strokeStyle = "#3b154e";
			//3：半透明
				ctx2.globalAlpha = 0.6;
			//4：圆角
				ctx2.lineCap = "round";
			//5：描边的宽度
				ctx2.lineWidth = 20;
			//6：创建循环
				for(var i = 0;i<this.num;i++){
					//7：创建新路径
						ctx2.beginPath();
					//8:将画笔移动到画布底端
						ctx2.moveTo(this.x[i],canHeight);
					//9:向上绘制直线
						ctx2.lineTo(this.x[i],canHeight-this.len[i]);
						ctx2.stroke();
				}
			
			//10：恢复状态
				ctx2.restore();
		}*/
	//5、将ane.js 挂载到index.html
	//6、在main.js中创建海葵类并且调用响应方法