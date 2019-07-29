//加载轮播图片
const WIDTH=1000;
$.ajax({
    type:"get",
    url:"data/shoplist/getCarousel.php",
    success:function (data) {
        // console.log(data);
        var html="";
        for(var img of data){
            html+=`<li>
                      <a href="${img.href}" title="${img.title}">
                           <img src="${img.img}">
                      </a>
                   </li>`;
        }
        html+=`<li>
            <a href="${data[0].href}" title="${data[0].title}">
                 <img src="${data[0].img}">
            </a>
        </li>`;
        var $ul=$(".banner-img");
        $ul.html(html).css("width",WIDTH*(data.length+1));

        const WAIT=3000,DURA=500;
        var moved=0,timer=null;
        function move(dir=1){
            moved+=dir;
            $ul.animate({
                left:-WIDTH*moved
            },DURA,()=>{
                if(moved==data.length){
                    $ul.css("left",0);
                    moved=0;
                }
            })
        }
        var timer=setInterval(move,WAIT);
    },
    error:function () {
        alert("网络故障，请检查！");
    }
})

//加载店铺信息
$.ajax({
	type:"get",
	url:"data/shoplist/shoplist.php",
	success:function(data){
	// console.log(data);
		var html=`<div class="shopListTitle">广东</div>
							<ul class="shopList fix">`;
		for(var item of data){
			html+=`<li class="shopInfo">
									<div class="shopInfo-top">
										<a href='showShop.html?sid=${item.sid}' class="hreflink" data-toggle="shopDetail"></a>
										<img src='${item.shopPic}' alt="" width="300" height="225">
										<h4 data-id='${item.sid}' data-toggle="shopDetail">
											${item.title}
											<i class="openSoon" style="display: none">即将开业</i>
										</h4>
									</div>
									<p data-toggle="shopMap"><a href="showShop.html" >${item.address}</a></p>
									<p class="nomg" data-toggle="shopDetail">
										<i class="showMapBtn"></i>
										${item.sname}
									</p>
									<p class="haveLine">
										<i></i>
										<span>营业时间</span>
										<i></i>
									</p>
									<span>${item.openingHours}</span>
									<p class="haveLine">
										<i></i>
										<span>预约电话</span>
										<i></i>
									</p>
									<span>${item.hotline}</span>
								</li>`;
		}
		html+=`</ul>`;
		$(".shopListSame").html(html);
	
	},
	error:function(){
		alert("网络故障，请检查！");
	}
})


//$("[data-toggle=shopDetail]").on("mouseover",function(e){
//    e.preventDefault();
//    console.log(111);
//    console.log($(this));
//
//    $(this).location.href="showShop.html";
//})
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