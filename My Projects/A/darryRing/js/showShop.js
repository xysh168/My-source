

//加载店铺详情
var url=window.location.search;
var sid=url.split("=")[1];
$.ajax({
	type:"get",
	url:"data/shoplist/showShop.php",
	data:{sid:sid},
	success:function(data){
		//console.log(data.proId);
		//加载面包屑导航
		$(".breadTitle").html(data.title);
		//加载店铺信息
		var html="";
		html+=`<div class="title">
									<h3>${data.title}</h3>
								</div>
								<div class="shopDetail_same address">
									<strong>店铺地址</strong>
									<div class="nov_hr"></div>
									<p>
										<a href="">${data.address}</a>
									</p>
								</div>
								<div class="shopDetail_same">
									<a href="">详细地图</a>
									<a href="">发送地址到手机</a>
								</div>
								<div class="shopDetail_same time">
									<strong>营业时间</strong>
									<div class="nov_hr"></div>
									<p>${data.openingHours}</p>
								</div>
								<div class="shopDetail_same tel">
									<strong>预约电话</strong>
									<div class="nov_hr"></div>
									<p>${data.hotline}</p>
								</div>`;
		$(".sh-rt").html(html);
		//加载预约进店信息
		$(".enterOrder>i").html(data.orderEnter);
		$(".orderAddress>strong").html(data.title);

		//加载同城推荐
		var proId=data.proId;
		$.ajax({
			type:"get",
			url:"data/shoplist/recommendShop.php",
			data:{proId:proId},
			success:function(data){
				//console.log(data);
				var html="";
				for(var item of data){
					html+=`<a href="">${item.title}</a>`;
				}
				$(".recommend").html(html);
			},
			error:function(){
				alert("网络故障请检查！");
			}
		})

	//根据地址获取经纬度
	var map = new BMap.Map("allmap"); 
	var localSearch = new BMap.LocalSearch(map);
	var keyword=data.title;
	localSearch.setSearchCompleteCallback(function (searchResult) {
		var poi = searchResult.getPoi(0);
		if(poi==""||poi==null)   {alert(123);return;}
		//document.getElementById("result_").value += poi.point.lng + "," + poi.point.lat;
		var longitude=poi.point.lng,latitude=poi.point.lat;//108.952482,34.253937
		//根据经纬度加载地图并标注
		map.centerAndZoom(new BMap.Point(longitude,latitude),15);
		map.enableScrollWheelZoom(true);
		// 用经纬度设置地图中心点
		if(longitude!= "" && latitude!= ""){
			map.clearOverlays(); 
			var new_point = new BMap.Point(longitude,latitude);
			var marker = new BMap.Marker(new_point);  // 创建标注
			map.addOverlay(marker);              // 将标注添加到地图中
			map.panTo(new_point);
			map.addControl(new BMap.NavigationControl());//平移缩放控件

			map.addControl(new BMap.ScaleControl());//比例尺
			map.addControl(new BMap.OverviewMapControl());//缩略地图
			map.addControl(new BMap.MapTypeControl());//地图类型
		//map.setCurrentCity("深圳");//设置当前城市
		}	
	});
	localSearch.search(keyword);


		// //加载店铺详情
		// $.ajax({
		// 	type:"get",
		// 	url:"data/shoplist/shopdetail.php",
		// 	data:{sid:sid},
		// 	success:function(data){
		// 		for(var item of data){
		// 			var imgs=item[7].split("*");
		// 			console.log(imgs);
		// 		}
		// 		console.log($(".shopDescribe p img"));
		// 		for(var i=0;i<imgs.length;i++){
		// 			console.log(imgs[i]);
        //
		// 			$(".shopDescribe p img").src="img/shoplist/shops/lg/1510021525.jpg";
		// 			console.log($(".shopDescribe p img").src);
        //
		// 		}
        //
		// 	},
		// 	error:function(){
		// 		alert("网络故障请检查！");
		// 	}
		// })

	},
	error:function(){
		alert("网络故障请检查！");
	}
})

//加载热卖商品
$.ajax({
	type:"get",
	url:"data/shoplist/hotsales.php",
	success:function (data) {
		//console.log(data);
		 var html="";
		 for(var item of data){
            html+=`<li>
									<a href=""></a>
									<img src="${item.md}" alt="">
									<div class="hotSalesInfo">
										<p>${item.series}</p>
										<p>${item.mainsize} ${item.color} ${item.neatness} ${item.cut}</p>
										<p>¥<i>${item.price}</i></p>
									</div>
								</li>`;
         }
		$(".hotSalesList").html(html);
    },
	error:function () {
		alert("网络故障请检查!");
    }

})
//加载会员热卖
$.ajax({
    type:"get",
    url:"data/shoplist/membersales.php",
    success:function (data) {
        //console.log(data);
        var html="";
        for(var item of data){
            html+=`<li>
									<a href=""></a>
									<img src="${item.md}" alt="">
									<div class="hotSalesInfo">
										<p>${item.series}</p>
										<p>${item.mainsize} ${item.color} ${item.neatness} ${item.cut}</p>
										<p>¥<i>${item.price}</i></p>
									</div>
								</li>`;
        }
        $(".membersales").html(html);
    },
    error:function () {
        alert("网络故障请检查!");
    }

})

//预约进店搜索
$(".shopWrite").click(function(){
    $(".orderAddress").css({"display":"none"});
    $(".orderChoose").css({"display":"block","display":"flex"});
})

//省市级联——加载省份
$.ajax({
    type:"get",
    url:"data/shoplist/getProvince.php",
    success:function (data) {
        //console.log(data);
        var html=`<option value="">-请选择省份-</option>`;
        for(var item of data){
        	html+=`<option value="${item.proName}">${item.proName}</option>`;
        }
        $("#province").html(html);

		//根据省份加载对应城市
        $("#province").on("change",function(e){
        	console.log(e.target.value);
            var proName=e.target.value;
        	if(e.target.value!="-请选择省份-"){
                $.ajax({
                    type:"get",
                    url:"data/shoplist/getShops.php",
                    data:{proName:proName},
                    success:function (data) {
                        var html=``;
                        for(var item of data){
                            html+=`<option value="">${item.title}</option>`;
                        }
                        $("#shops").html(html);
                    },
                    error:function () {
                        alert("网络故障，请检查！");
                    }
                })
			}

        })

    },
	error:function () {
		alert("网络故障，请检查！");
    }
})

























































































