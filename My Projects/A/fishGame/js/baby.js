//1:创建小鱼的类
	var babyObj = function(){
		this.x;
		this.y;
		this.angle;
		this.babyEye = [];
		this.babyBody = [];
		this.babyTail = [];
		this.babyEyeIndex = 0;
		this.babyEyeStart = 1;
		this.babyEyeEnd = 2000;
		
		this.babyBodyIndex = 0;
		this.babyBodyStart = 1;
		this.babyBodyEnd = 3000;
		
		this.babyTailIndex = 0;
		this.babyTailStart = 1;
		this.babyTailEnd = 200;
	}
//2:为小鱼的类添加初始化方法
	babyObj.prototype.init = function(){
		//小鱼-初始化位置：屏幕中央
			this.x = canWidth*0.5;
			this.y = canHeight*0.5;
		//小鱼-初始化角度为0度
			this.angle = 0;
		//小鱼-初始化眼睛：2张
			for(var i = 0;i < 2;i++){
				this.babyEye[i] = new Image();
				this.babyEye[i].src = "src/babyEye"+i+".png";
			}
		//初始化小鱼的身体 20张
			for(var i = 0;i < 20;i++){
				this.babyBody[i] = new Image();
				this.babyBody[i].src = "src/babyFade"+i+".png";
			}
		//初始化小鱼的尾巴 8张
			for(var i = 0;i < 8;i++){
				this.babyTail[i] = new Image();
				this.babyTail[i].src = "src/babyTail"+i+".png";
			}			
	}
//3:为小鱼的类添加绘制方法
	babyObj.prototype.draw = function(){
		//修改小鱼坐标游动的角度
			this.x = lerpDistance(mom.x,this.x,0.98);
			this.y = lerpDistance(mom.y,this.y,0.99);
			//计算大鱼小鱼角度差
				var delTaY = mom.y - this.y;
				var delTaX = mom.x - this.x;
			//角度差
				var bata = Math.atan2(delTaY,delTaX)+Math.PI;
			//计算新角度
				this.angle = lerpAngle(bata,this.angle,0.9);
		//修改小鱼的尾巴身体眼睛的坐标
			//眼睛下标	2张图片
				this.babyEyeStart += deltaTime;				
				if(this.babyEyeStart > this.babyEyeEnd){
					this.babyEyeIndex = (this.babyEyeIndex+1)%2;
					this.babyEyeStart = 1;
					if(this.babyEyeIndex == 0){
						this.babyEyeEnd = 2000;
					}
					if(this.babyEyeIndex == 1){
						this.babyEyeEnd =200; 
					}
				}
			//身体下标 
				this.babyBodyStart += deltaTime;
				if(this.babyBodyStart > this.babyBodyEnd){
					this.babyBodyIndex = (this.babyBodyIndex+1)%20;
					this.babyBodyStart = 1;
				}
			//尾巴下标
				this.babyTailStart += deltaTime;
				if(this.babyTailStart > this.babyTailEnd){
					this.babyTailIndex = (this.babyTailIndex+1)%8;
					this.babyTailStart = 1;
				}
		//保存画笔状态
			ctx1.save();
		//平移原点
			ctx1.translate(this.x,this.y);
		//设置旋转角度
			ctx1.rotate(this.angle);
		var eye = this.babyEye[this.babyEyeIndex];
		var body = this.babyBody[this.babyBodyIndex];
		var tail = this.babyTail[this.babyTailIndex];
		//绘制小鱼身体
			ctx1.drawImage(body,-body.width*0.5,-body.height*0.5);
		//绘制小鱼尾巴
			ctx1.drawImage(tail,-tail.width*0.5+23,-tail.height*0.5);
		//绘制小鱼眼睛
			ctx1.drawImage(eye,-eye.width*0.5,-eye.height*0.5);
		//恢复画笔状态
			ctx1.restore();
	}
//4:挂载
//5:在main.js中调用