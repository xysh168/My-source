//不shake的两张轮播图
(()=>{
	var i=1,canShake=true;
	function shake(){
		if(canShake==true){
			//canShake=false;
			if(i==2)i=1;
			else i++;

			var arr=[0,1,2,3,4,5,6,7,8,9,10,11,12];
			arr.sort((a,b)=>Math.random()<0.5?1:-1);
			arr.sort((a,b)=>Math.random()<0.5?1:-1);
			arr.sort((a,b)=>Math.random()<0.5?1:-1);

			var j=0;
			setInterval(()=>{
				$(`#box>div:eq(${arr[j++]})`).css(
					"backgroundImage",
					`url(img/login/${i}.jpg)`	
				).fadeIn();//.addClass("shake")
			},50);
			setTimeout(()=>{
//				$("#box>div").removeClass("shake");
				$("#box>img").attr("src",`img/login/${i}.jpg`)
								.fadeIn();
				//canShake=true;
			},1000);
		}
	}
	setInterval(shake,3000);
//	$("#btnNext").click(shake);
})()
