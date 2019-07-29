//保存食物相关数据与操作
//1:创建食物类 fruitObj
	var fruitObj = function(){
		//是否活动
			this.alive = [];//true=>显示；false=>不显示
		//一张图片
			this.blue = new Image();
			this.orange = new Image();
		//坐标
			this.x = []; //坐标x_y
			this.y = []; //长度
		//速度
			this.spd = [];
			this.l = [];//长度=>会长大然后漂浮
		//类型
			this.fruitType = [];
	}
//2:添加属性数量 30
	fruitObj.prototype.num = 30;
//3:添加方法 init
	fruitObj.prototype.init = function(){
		for(var i = 0;i<this.num;i++){
			this.alive[i] = true; //全部显示
			this.x[i] = i * 25 + Math.random()*25;
			this.y[i] = 450 + Math.random()*100;
			this.spd[i] = Math.random()*(0.017-0.003);
			this.l[i] = 0;
			this.fruitType[i] = Math.random()<0.5?"blue":"orange";
		}
		this.blue.src = "src/blue.png";
		this.orange.src = "src/fruit.png";
		///console.log(this.alive);
		//console.log(this.x);
	}
//4:添加方法draw
	fruitObj.prototype.draw = function(){
		//4.1：判断当前食物是否为活动状态
			for(var i = 0;i<this.num;i++){
				if(this.alive[i]){
					if(this.l[i]<14){
						this.l[i] += this.spd[i]*10;
					}else{
						this.y[i] -= this.spd[i]*50;
					}			
					if(this.fruitType[i] == "blue"){
						var pic = this.blue;
					}else{
						var pic = this.orange;
					}
				}
				ctx2.drawImage(pic,this.x[i],this.y[i],this.l[i],this.l[i]);
			}			
		//4.2：生长=>14px 后长大后漂浮
		//4.3：向上漂浮
		//4.4：判断类型：blue_orange
		//4.5：绘图			
	}
//5:将fruit.js挂载到index.html
//6:在main.js中创建食物对象并且调用 相关方法