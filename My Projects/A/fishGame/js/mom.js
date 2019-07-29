//创建大鱼类  momObj
	var momObj = function(){
		this.x = mx; //大鱼的位置
		this.y = my; 
		this.angle; //大有游动的角度
		this.bigEye = []; //大鱼的眼睛
		this.bigBody = [];//大鱼的身体
		this.bigTail = [];//大鱼的尾巴
		
		//1 大鱼眼睛
			this.bigEyeIndex = 0;   //眼睛下标
			this.bigEyeStart = 1;   //计时开始
			this.bigEyeEnd = 2000;  //计时结束
		
		//大鱼尾巴
			this.bigTailIndex = 0;  //尾巴下标
			this.bigTailStart = 1;  //尾巴计时开始
			this.bigTailEnd = 200;  //尾巴计时结束
			
		//大鱼身体
			this.bigBodyIndex = 0;
			this.bigBodyStart = 1;
			this.bigBodyEnd = 3000;
	}
//为大鱼类添加初始化方法 init
	momObj.prototype.init = function(){
		//大鱼初始化的位置在屏幕中央
			this.x = canWidth*0.5;
			this.y = canHeight*0.5;			
		//大鱼初始化的角度是0度
			this.angle = 0;
		//大鱼初始化的眼睛是两张图片
			for(var i = 0;i < 2;i++){
				this.bigEye[i] = new Image();
				this.bigEye[i].src = "src/bigEye"+i+".png";
			}
			//console.log(this.bigEye);
		//大鱼初始化的身体：8张图片
			for(var i = 0;i<8;i++){
				this.bigBody[i] = new Image();
				this.bigBody[i].src = "src/bigSwim"+i+".png";
			}
			//console.log(this.bigBody)
		//初始化大鱼尾巴 8张
			for(var i = 0; i<8 ;i++){
				this.bigTail[i] = new Image();
				this.bigTail[i].src = "src/bigTail"+i+".png"; 
			}
			//console.log(this.bigTail);
	}
//为大鱼类添加绘制方法  draw
	momObj.prototype.draw = function(){
		//this.x = mx;
		//this.y = my;
		//大鱼眼睛切换
			//累加眼睛计时开始时间，
				this.bigEyeStart += deltaTime;
			//如果计时开始时间大于结束时间，切换下一张图片
				if(this.bigEyeStart > this.bigEyeEnd){
				this.bigEyeIndex = (this.bigEyeIndex+1)%2;
			//计时开始恢复为初始值
				this.bigEyeStart = 1;
				
			//如果当前闭眼结束时间 200
				if(this.bigEyeIndex == 1){
					this.bigEyeEnd = 200;
				}
			//如果当前睁眼结束时间 2000
				if(this.bigEyeIndex == 0){
					this.bigEyeEnd = 2000;
				}
			}
			
		//大鱼尾巴切换
			//累加尾巴计时开始时间
				this.bigTailStart += deltaTime;
			//如果尾巴计时开始大鱼结束时间，切换下一张图片
				if(this.bigTailStart > this.bigTailEnd){
					this.bigTailIndex = (this.bigTailIndex+1)%8;
					//及时开始恢复为初始值
						this.bigTailStart = 1; 
						
				/*	if(this.bigTailIndex == 1){
						this.bigTailEnd = 200;
					}
					if(this.bigTailIndex == 0){
						this.bigTailEnd = 2000;
					}*/
				}
				
		//大鱼身体
			this.bigBodyStart += deltaTime;
			if(this.bigBodyStart > this.bigBodyEnd){
				this.bigBodyIndex = (this.bigBodyIndex+1)%8;
				this.bigBodyStart = 1;
			}
		//大鱼面向鼠标慢慢游动过去
			this.x = lerpDistance(mx,this.x,0.98);//(39 mx=>鼠标位置 this.x=>大鱼 0.98)
			this.y = lerpDistance(my,this.y,0.99);
			
		// 修改大鱼游动的角度
			//1:获取大鱼和鼠标坐标差
			 var deltaY	= my - this.y; //my==>鼠标
			 var deltaX = mx - this.x;
			//2:获取大鱼和鼠标角度差
				var bata = Math.atan2(deltaY,deltaX)+Math.PI;
			//3:通过函数计算大鱼新角度
				this.angle = lerpAngle(bata,this.angle,0.9);
		//1:保存画笔状态
			ctx1.save();
		//2:平移原点，大鱼身体中间
			ctx1.translate(this.x,this.y);
		//3:设置大鱼旋转角
			ctx1.rotate(this.angle);
		//4:顺序—绘制大鱼的身体
			ctx1.drawImage(this.bigBody[this.bigBodyIndex],-this.bigBody[this.bigBodyIndex].width*0.5,-this.bigBody[this.bigBodyIndex].height*0.5);
		//5:顺序-绘制大鱼的尾巴身体
			ctx1.drawImage(this.bigTail[this.bigTailIndex],-this.bigTail[this.bigTailIndex].width*0.5+30,-this.bigTail[this.bigTailIndex].height*0.5);
		//6:顺序-绘制大鱼的眼睛身体
			ctx1.drawImage(this.bigEye[this.bigEyeIndex],-this.bigEye[this.bigEyeIndex].width*0.5,-this.bigEye[this.bigEyeIndex].height*0.5);
		//10:恢复画笔状态
			ctx1.restore();
	}
//将mom.js 挂载到index.html
//在main.js 创建大鱼对象并且调用相关方法