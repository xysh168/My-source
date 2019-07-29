//1:创建食物的类
	//1 创建食物的类
		var fruitObj = function(){
			this.alive = [];  //是否活动状态boolen
			this.orange= new Image();
			this.blue = new Image();
			this.x = [];   //位置
			this.y = [];
			this.l = [];
			this.spd = []; //长度
			this.fruitType = []; //食物类型-字符串
		}
	//2 添加数量
		fruitObj.prototype.num = 30;
	//3 添加初始化方法
		fruitObj.prototype.init = function(){
			for(var i = 0;i<this.num;i++){
				this.alive[i] = false;  //是否活动：初始海葵不活动
				this.x[i] = 0;
				this.y[i] = 0;
				this.l[i] = 0;
				this.spd[i] = Math.random()*0.017+0.003;
				this.fruitType[i] = "";
			}
			this.orange.src = "src/fruit.png";
			this.blue.src = draw = "src/blue.png";
			/*console.log(
				this.alive,
				this.x,
				this.y,
				this.l,
				this.spd,
				this.fruitType
			);*/
		}
	//4 添加绘制方法
		fruitObj.prototype.draw = function(){
			//find an ane,grow fly up
			for(var i = 0;i<this.num;i++){
				if(this.alive[i]){
					if(this.l[i]<14){
						this.l[i] += this.spd[i]*deltaTime; //变大
 					}else{
 						this.y[i] -= this.spd[i]*3*deltaTime; //向上漂浮
 					}
				}
				if(this.fruitType[i] == "blue"){
					var pic = this.blue;
				}else{
					var pic = this.orange;
				}
				ctx2.drawImage(pic,this.x[i],this.y[i],this.l[i],this.l[i]);
				//如果当前的食物飘出了屏幕
				if(this.y[i]<10){
					this.alive[i] = false;
				}
			}
		}
	//5 挂载到index.html中
	//6 在main.js中创建对象并且调用相关方法
	//监视画布是否有15个活动状态食物，
		function fruitMonitor(){
			var sum = 0;
			for(var i = 0; i<fruit.num;i++){
				if(fruit.alive[i]){ //计算活动数量
					sum++;
				}
				if(sum<15){
					sendFruit();
					return;
				}
				
			}
	}
	//不足时在不活动状态食物中挑一个，第一个不活动状态的食物
		function sendFruit(){
			for(var i =0; i < fruit.num;i++){
				if(!fruit.alive[i]){
					fruit.born(i);
					return;
				}
			}
		}
	//出生
		fruitObj.prototype.born = function(i){
			//找一个海葵，依据海葵计算出食物的x_y_状态_图片
				var aneId = Math.floor(Math.random()*ane.num);
				this.x[i] = ane.headx[aneId];
				this.y[i] = ane.heady[aneId];
				this.alive[i] = true;
				//this.l[i] = 0; 
				this.fruitType[i] = Math.random()<0.9?"blue":"orange";
	}
