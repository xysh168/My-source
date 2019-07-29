//保存所有的碰撞
	function momFruitCollision(){
		//1:创建循环 循环所有事物，判断当前事物是否处于活动状态
		//2：判断当前食物与大鱼的距离，如果距离小于30=>让当前事物的状态变为false
			for(var i = 0;i<fruit.num;i++){
				if(fruit.alive[i]){
					var l = calLength2(fruit.x[i],fruit.y[i],mom.x,mom.y);
					if(l<900){
						fruit.alive[i] = false;
						if(fruit.fruitType[i] == "orange"){
							data.double = 2;
						}else{
							data.double = 1;
						}
						//吃到食物增加分数
							data.addScore();
						//吃到食物显示特效
							wave.born(fruit.x[i],fruit.y[i]);
					}
				}
			}
	}
	
