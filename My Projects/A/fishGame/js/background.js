//绘制背景图片
	function drawBackground(){
		ctx2.drawImage(bgPic,0,0,canWidth,canHeight);
		//console.log(1);
	}
	//1、将background.js引入index.html中
	//2、将drawBackground()() 在main.js_gameloop调用
