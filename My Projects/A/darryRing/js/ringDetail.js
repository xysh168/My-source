//关闭弹框
function closeMsg(){
    //确定关闭
    $("#alertMsg_btn1").click(function(){
        $("#mask").hide();
    })
    //X关闭
    $("#closeMsg").click(function(){
        $("#mask").hide();
    })
}
//封装弹框方法
function alertMsg(msg){
	$("#alertMsg").show();
	$("#alertMsg_info").html(msg);
    $("#shadowDiv").show();
}

//详情数据加载
var url=window.location.search;
var ref=url.split("&");
var rid=ref[0].split("=")[1];
// var series=ref[1].split("=")[1];
// series=decodeURI(series);

var fingerSize=[];
for(var i=6;i<34;i++){
	fingerSize.push(i);
}
//console.log(fingerSize);

$.ajax({
    type:"get",
    url:"data/ringlist/getRingDetail.php",
    data:{rid:rid},
    success:function (data) {
       //console.log(data);
        // console.log(data.rings);
        //   p = data.pics;
        //  console.log(p[0].lg);
        // console.log(data.pics[0].md);
        //加载右侧详情
        var html="";
        for( var ring of data.rings){
			//加载面包屑导航
			$(".breadTitle").html(`${ring.series}系列 ${ring.mainsize}分 简奢款 ${ring.color}色`);
            html+=`<!--右-标题-->
								
								<h2 class="rt-title">${ring.series}系列 ${ring.mainsize}分 简奢款 ${ring.color}色</h2>
								<!--右-价格-->
								<div class="rt-price">
									<span class="lf">¥${ring.price}</span>
									<a href="series=${ring.series}" class="rt dr_moreSeries" >更多${ring.series}系列>></a>
								</div>
				 					<!--右-售出评价-->
								<ul class="rt-comm">
									<li><span>近期售出：</span><i>${ring.saled}</i></li>
									<li><span>评价：</span><i>${ring.comment}</i></li>
									<li><a href="">西安</a></li>
								</ul>
								<!--右-产品参数-->
								<div class="rt-parames">
									<li><span>主钻重量:</span>${ring.mainweight}</li>	
									<li><span>钻石颜色:</span>${ring.color}色</li>	
									<li><span>钻石净度:</span>${ring.neatness}</li>	
									<li><span>钻石切工:</span>${ring.cut}</li>	
								</div>
								<!--右-其他选择-->
								<div class="rt-choose">
									<!--材质-->
									<div class="rt-texture">
										<span>戒托材质</span>`;

										//戒托材质加载
										if(ring.ringcz==='PT950'){
											html+=`<i class="chooseit">PT950</i><i>白18K金</i>`;
										}else{
											html+=`<i>PT950</i><i class="chooseit">白18K金</i>`;
										}

										html+=`<em>本商品价格为单只戒指售价，材质调整后金额会自动调整。</em>
									</div>
									<!--主钻-->
									<div class="rt-mainDiam fl" id="main-stone">
										<span class="fl">搭配主钻</span>
										<div class="box" >`;

											//加载不同的主钻搭配
											for(tmp of data.matchs){
												html+=`<a href="ringDetail.html?rid=${tmp.rid}" class=${rid===tmp.rid?"chooseit":""}>${tmp.mainsize}分 ${tmp.color}色</a>`;
												
											}

											html+=`<a class="ring-gjdz"></a>
											<a href="" class="ring-tochoose">如何选择钻石? </a>
										</div>
									</div>
									<!--手寸-->
									<div class="rt-handsize">
										<span>选择手寸</span>
										<select name="" id="handSizes">
											<option value="">选择手寸</option>`;
											for(var i of fingerSize){
												html+=`<option value="${i}">${i}</option>`;
											}

										
										html+=`</select>
										<input type="text" placeholder="免费刻字" title="限输入5个汉字或10个字母" id="carved">
										<i>♥</i>
										<i>&</i>
										<em>预览效果</em>
										<p><a href="">如何测量?</a></p>
										<div>限输入5个汉字或10个字母</div>
									</div>
								</div>
								<!--加购-->
								<div class="rt-addcart">
									<a href id="addCart">加入购物车</a>
									<a href id="buyit">立即购买</a>
									<i id="join-gift">加入礼物清单</i>
								</div>
								<!--预计送货时间-->
								<p class="rt-delivery">配送说明：预计20个工作日送达（限大陆地区）,其它地区请咨询客服。
								</p>
								<!--服务承诺-->
								<div class="rt-promise">
									<strong>服务承诺</strong>
									<span class="promise1">15天退换</span>
									<span class="promise2">全国包邮</span>
									<span class="promise3">终生保养</span>
									<a href=""><i>在线客服</i></a>
								</div>`;

        }
        $(".cort-rt").html(html);

        //加载左侧大戒指
        html="<span></span>";
        for(var img of data.pics){
            html+=`<li>
										<img src="${img.md}"  width="458px" height="458px" alt="">
										<div class="ringLg">
											<img src="${img.lg}" alt="">
										</div>
									</li>`;
        };
        $(".lf-bigRing").html(html);
		//默认第一张中图显示
        $(".lf-bigRing li").eq(0).css({zIndex:5});


        //加载左侧下的小戒指
        html="";
        for(var img of data.pics){
            // console.log(img.sm);
            html+=`<li data-toggle="ring"><img src="${img.sm}" alt=""></li>`;
        }
        $(".buy-small").html(html);
		//默认第一张小图被选中显示红框
		$(".buy-small li").eq(0).addClass("sm-select");

        //加载详情列表
        html="";
        for(ring of data.rings){
            html+=`<li>商品分类：<span>求婚钻戒</span></li>
										<li>产品编号：<span>${ring.ringid}</span></li>
										<li>净度：<span>${ring.neatness}</span></li>
										<li>戒托材质：<span>${ring.ringcz}</span></li>
										<li>系列名称：<span>${ring.series}系列</span></li>
										<li>颜色：<span>${ring.color}色</span></li>
										<li>主石大小：<span>${ring.mainsize}分</span></li>
										<li>切工：<span>${ring.cut}</span></li>
										<li>主石材质：<span>${ring.maincz}</span></li>
										<li>主石数量：<span>${ring.mainnum}</span></li>
										<li>手寸：<span>${ring.measure}</span></li>
										<li>主石总重：<span>${ring.mainweight}</span></li>
										<li>形状：<span>${ring.shape}</span></li>
										<li>抛光：<span>${ring.polish}</span></li>
										<li>对称：<span>${ring.balance}</span></li>
										<li>荧光：<span>${ring.light}</span></li>
										<li>副石材质：<span>${ring.minorcz}</span></li>
										<li>副石数量：<span>${ring.minornum}</span></li>
										<li>副石形状：<span>${ring.minorshape}</span></li>
										<li>副石总重：<span>${ring.minorweight}</span></li>`;
        }

        $(".detail1-canshu").html(html);

		//详情页加入购物车按钮
		$("#addCart").on('click', function (e) {
		e.preventDefault();
		console.log(111);
		//获取购买数量
		//   var buyCount = $("#buy-num").val();
		var buyCount =1;
		$.ajax({
			type: 'POST',
			url: 'data/cart/add.php',
			data: {rid:location.search.split('=')[1], buyCount: buyCount},
			success: function(result){
				console.log(result);
			if(result.code===300){
				alertMsg('您尚未登录！');                                           $("#shadowDiv").show();
                                           
				$('#alertMsg_btn1').click(function () {
					closeMsg();
					location="login.html?back="+location.href;
				});
			}else if(result.code===200){
				alertMsg('添加成功！');
				$("#shadowDiv").show();
				$('#alertMsg_btn1').click(function () {
					closeMsg();
				   location.href = 'cart.html';
				});
			}else {
				alertMsg('<b添加失败！</b><p>错误原因为：'+result.msg+'</p>');
				closeMsg();
			}
			}
		})

		})
    },
    error:function () {
        alert("网络故障，请检查！");
    }
})

//热门推荐加载
$.ajax({
	type:"get",
	url:"data/ringlist/hotsales.php",
	success:function (data) {
		// console.log(data);
		 var html="";
		 for(var item of data){
            html+=`<li>
									<a href="ringDetail.html?rid=${item.rid}"></a>
									<img src="${item.md}" alt="">
									<div class="hotSalesInfo">
										<p>${item.series}系列</p>
										<p>${item.mainsize}分 ${item.color}色 ${item.neatness} ${item.cut}</p>
										<p><i>¥ ${item.price}</i></p>
									</div>
								</li>`;
         }
		$(".hotSalesList").html(html);
    },
	error:function () {
		alert("网络故障请检查!");
    }

})

//小图片戒指切换

$(".buy-small").on("mouseenter","li",function (e) {
    $(this).addClass("sm-select")
        .siblings().removeClass("sm-select");
	//中图片切换
	//console.log($(this));
	//console.log($(e.target));

    var index=$(this).index();
    $(".lf-bigRing li").eq(index).css({zIndex:5})
                     .siblings().css({zIndex:0});//中图
})

//鼠标进出中图时，小遮罩和大图显示隐藏
$(".lf-bigRing").mouseenter(
	function(){
		$(".ringLg").show();//div
		//默认第一张大图显示
        var lgDiv = $(".lf-bigRing li").eq(0).children(".ringLg");
		//console.log($(".lf-bigRing li").eq(0).children(".ringLg"))
        lgDiv.css({"display":"block"});
		$(".lf-bigRing span").css({"display":"block"});//span

		//放大镜移动
		$(".lf-bigRing li").mousemove(e=>{
			const SSIZE=230;
 			var x=e.offsetX;
 			var y=e.offsetY;
 			var top=y-152/2;
 			var left=x-152/2;
 			var index=$(e.target).index();
 			//console.log(x,y);
            //console.log(top,left);

            if(top<0){top=0;}else if(top>286){top=286;}
 			if(left<0){left=0;}else if(left>286){left=286;}
 			$(".lf-bigRing span").css({"top":top,"left":left,"display":"block","z-index":100});
 				$(".ringLg>img").css({"top":-40/23*top,"left":-40/23*left});

		})
	}
);
$(".lf-bigRing").mouseleave(
	function(){
		//console.log("移出");
		//大遮罩层、小遮罩层隐藏
		$(".ringLg").hide()//div
		$(".lf-bigRing span").hide();//span
//		$(".ringLg>img").eq(index).css({"top":0,"left":0});
	},

);



//放大镜——小图片左右箭头移动
    const LIWIDTH=80;
    let moved=0;
    $("#sr-lf").click(function(){
        if(moved>0){
            $("#sr-lf").removeClass("sr-lfend").addClass("sr-lf");
            moved--;
            $(".buy-small").css({"position":"relative","left":-LIWIDTH*moved});
        }else{
            $("#sr-lf").addClass("sr-lfend").removeClass("sr-lf");
        }
    });
    $("#sr-rt").click(function(){
        //console.log($(".buy-small li").length);
        if($(".buy-small li").length-moved>5) {
            $("#sr-rt").removeClass("sr-rtend").addClass("sr-rt");
            moved++;
            $(".buy-small").css({"position":"relative","left":-LIWIDTH*moved});
        }else{
            $("#sr-rt").removeClass("sr-rt").addClass("sr-rtend");
        }
    });

//热门推荐——左右箭头移动
const PICWIDTH=170;
let picmoved=0;
$("#pic-lf").click(function(){
    if(picmoved>0){
        $("#pic-lf").removeClass("sr-lfend").addClass("sr-lf");
        picmoved--;
        $(".hotSalesList").css({"position":"relative","left":-PICWIDTH*picmoved,"transition":"all .5s linear"});
    }else{
        $("#pic-lf").addClass("sr-lfend").removeClass("sr-lf");
    }
});
$("#pic-rt").click(function(){
    //console.log(picmoved);
     console.log($(".hotSalesList li").length);
    if($(".hotSalesList li").length-picmoved>5) {
        $("#pic-rt").removeClass("sr-rtend").addClass("sr-rt");
        picmoved++;
        $(".hotSalesList").css({"position":"relative","left":-PICWIDTH*picmoved,"transition":"all .5s linear"});
    }else{
        $("#pic-rt").removeClass("sr-rt").addClass("sr-rtend");
    }
});






//更多相同系列
// $(".dr_moreSeries").on("click",function () {
//     e.preventDefault();
//     var search = $(this).attr("href");
//     search = decodeURI(search);
//     // console.log(search);
//     //loadProductByClassify(search);
//     //location.href="ringlist.html";
//
//     $.ajax({
//         type: "get",
//         url: "data/ringlist/ringlistByShape_Series.php?" + search,
//         success: function (data) {
//             var html = "";
//             for (var item of data.bySeries) {
//                 //console.log(item);
//                 ////////////////////////////////列表加载
//                 html += `<li>
// 										<a href="${item.rid}"><img src="${item.md}" alt=""></a>
// 										<div>
// 											<!--价格-->
// 											<div class="price">¥${item.price}</div>
// 											<!--描述-->
// 											<p class="detail">${item.series} ${item.neatness} ${item.mainsize}分 ${item.color}色 ${item.shape}</p>
// 											<!--按钮-->
// 											<div class="buybtn">
// 												<span>收藏</span>
// 												<a href="">立即购买</a>
// 											</div>
// 											<!--评价-->
// 											<div class="comment">
// 												<i>评价：</i><span>${item.comment}</span>
// 											</div>
// 										</div>
// 									</li>`;
//             }
//             $(".dr_ringlist").html(html);
//         },
//         error: function () {
//             alert("网络故障，请检查！");
//         }
//
//     })
// })




















































































































