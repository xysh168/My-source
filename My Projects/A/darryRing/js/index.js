     //模态框显示
     $("#shadowDiv").show();

    //1.背景
    window.addEventListener("scroll",function(){
        var scrollTop=document.body.scrollTop
            ||document.documentElement.scrollTop;
		var main=document.querySelector(".background");
        if(scrollTop>=100){
            main.style.background="url(img/index/gdbk.jpg) no-repeat";
            main.style.backgroundSize="1600px 1000px";
		}else
            main.style.background="";
    });


    //2.爱的礼物切换
	$("#GiftTab:has([data-toggle=gift])")
		  .on("mouseenter","[data-toggle=gift]",e=>{
		  e.preventDefault();
		  var $tar=$(e.target);
		  if(!$tar.parent().is(".active")){
			$tar.parent().addClass("active")
			  .siblings().removeClass("active");
			// $tar.style.color="#C57D5C";
			var id=$tar.attr("href");
			$(id).addClass("active")
			  .siblings().removeClass("active");

		  }
    })
	// 3.实体店——页面滚动字体变白色
    window.addEventListener("scroll",function(){
        // console.log(111);
        var scrollTop=document.body.scrollTop
            ||document.documentElement.scrollTop;
        var shopLists=document.querySelectorAll(".shopList a");
        for(var i=0;i<shopLists.length;i++){
			if(scrollTop>=1100) {
				shopLists[i].style.color = "white";
			}else{
				shopLists[i].style.color = "#666";
			}
        }
    });
    // 4.爱的礼物——页面滚动字体变白色
    window.addEventListener("scroll",function(){
        var scrollTop=document.body.scrollTop
            ||document.documentElement.scrollTop;
        var shopLists=document.querySelectorAll("#GiftTab li a");
        for(var i=0;i<shopLists.length;i++){
            if(scrollTop>=4100) {
                 // console.log(scrollTop);
                // shopList.setAttribute("color","#fff");
                shopLists[i].style.color = "white";
            }else{
                shopLists[i].style.color = "#666";
            }
        }
    });

    // 5.右边漂浮件滚动后显示
    window.addEventListener("scroll",function(){
       // console.log(222);
       var scrollTop=document.body.scrollTop
           ||document.documentElement.scrollTop;
       var quickService=document.querySelector(".quickService");
       if(scrollTop>=300){
		   	// console.log(scrollTop);
           	quickService.style.display="block";
       }else{
          	quickService.style.display="none";
       }
    });
	// 6.右边漂浮件显示隐藏
    $("[data-toggle=service]").parent().hover(
        function(){
			// var hover=$(this).children("a").attr("class")+"-hover";
			//console.log(hover);
            $(this).children(".quickWord")
			.css({
                display:"block"
            })
			.parent().css({
				backgroundColor:"#fff"
			})
        },
        function(){
            $(this).children(".quickWord")
			.css({
                display:"none"
            })
			.parent().css({
				backgroundColor:"#DBC7BA"
			})
        },
    );

    //brand倒计时
    var timer="";
    var count=$(".brand-num").html();
    timer=setInterval(function(){
        $(".brand-num").html(count--);
        if(count==0){
            clearInterval(timer);
            $(".brand").hide();
            $("#shadowDiv").hide();
        }
    },1000);

    //brand关闭
    $("#brand-close").click(function(){
        $(".brand").hide();
        $("#shadowDiv").hide();

    })

    $(".shopList a").attr("href","shoplist.html");