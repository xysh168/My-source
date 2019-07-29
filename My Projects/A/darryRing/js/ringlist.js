//加载轮播图片
var ref="ringlist-banner";
$.ajax({
    type:"get",
    url:"data/ringlist/getCarousel.php",
	data:{ref:ref},
    success:function (data) {
        //加载banner图片
        var html="";
        for(var img of data){
            html+=`<li>
                      <a href="${img.href}" title="${img.title}">
                           <img src="${img.img}">
                      </a>
                   </li>`;
        }
        $ul=$(".banner-img");
		$ul.html(html);
        //轮播
        var i=0;
        $('.banner-img li').eq(i).fadeIn(1000)
            .siblings().fadeOut(1000);
        var timer=setInterval(function(){
            if(i==data.length){i=0;}
            else{i++;}
            $('.banner-img li').eq(i).fadeIn(1000)
                .siblings().fadeOut(1000);
        },3000);
    },
    error:function () {
        alert("网络故障，请检查！");
    }
})
//加载详情
let pno;
$(".prev").on("click",function (e) {
    e.preventDefault();
    console.log(111);
    loadProductByPageNo(2,9);
});


// 根据分页加载列表内容
function loadProductByPageNo(pno,pageSize) {
    $.ajax({
        type:"get",
        url:"data/ringlist/ringlist.php",
        data:{pno:`${pno}`,pageSize:9},
        success:function(data){
            //console.log(data);
            // 戒指系列
            var html="";
            for(var item of data.series){
                //console.log(item.serieName);
                html+=`<a href="series=${item.serieName}" class="serieSearch" >${item.serieName} 系列</a>`;
            }
            $(".dr_series").html(html);
            $(".dr_series>a:gt(6)").hide();
            // 戒指列表
            var html="";
            for(var item of data.rings){
                // console.log(item);
                html+=`<li>
										<a href="ringDetail.html?rid=${item.rid}"><img src="${item.md}" alt=""></a>
										<div>
											<!--价格-->
											<div class="price">¥${item.price}</div>
											<!--描述-->
											<p class="detail">${item.series}系列 ${item.neatness} ${item.mainsize}分 ${item.color}色 ${item.shape}</p>
											<!--按钮-->
											<div class="buybtn">
												<span>收藏</span>
												<a href="${item.rid}">立即购买</a>
											</div>
											<!--评价-->
											<div class="comment">
												<i>评价：</i><span>${item.comment}</span>
											</div>
										</div>
									</li>`;
            }
            $(".dr_ringlist").html(html);

            //分页
            data.pno=parseInt(data.pno);
 			//console.log(pno);
			//console.log(data.pno);

            var html="";
			if(data.pno-1>0){
				html+=`<a href="javascript:loadProductByPageNo(${pno}-1,9);" class="prev" id="prev">上一页</a>`;
			}else{
				html+=`<a href="javascript:loadProductByPageNo(1,9);" class="prev" id="prev">上一页</a>`;
			}
            //上上一页
            if(data.pno-2>0){
                html+=`<li><a href="?pno=${pno}">${data.pno-2}</a></li>`
            }
            //上一页
            if(data.pno-1>0){
                html+=`<li><a href="?pno=${pno}">${data.pno-1}</a></li>`
            }
            //当前页
            html+=`<li class="active"><a href="#">${data.pno}</a></li>`;
            //下一页
            if(data.pno+1<=data.pageCount){
                html+=`<li><a href="?pno=${pno}">${data.pno+1}</a></li>`
            }
            //下下一页
            if(data.pno+2<=data.pageCount){
                html+=`<li><a href="?pno=${pno}">${data.pno+2}</a></li>`
            }
			if(data.pno<data.pageCount){
				html+=`<a href="javascript:loadProductByPageNo(${pno}+1,9);" class="next" id="next">下一页</a>`;
			}else{
				html+=`<a href="javascript:loadProductByPageNo(data.pageCount,9);" class="next" id="next">下一页</a>`;

			}

            $(".pagination").html(html);


        },
//        error:function(){
//            alert("网络故障请检查！");
//        }
    })
}
loadProductByPageNo(1,9);
//为页码绑定单击事件
$(".pagination").on("click","li a",function(e){
     e.preventDefault();
    pno=parseInt($(this).html());

    loadProductByPageNo(pno,9);
    if($(this).html()==pno){
        $(this).addClass("active");
    }
})



//更多
$("#moreSeries").on("click",function (e) {
    if($(".dr_series").is(":has(:hidden)")){
        $(".dr_series a").show();
        $(".series").css({"height":65});
        $(".dr_series").css({"height":65});
    }else{
        $(".series").css({"height":46});
        $(".dr_series").css({"height":46});
        $(".dr_series>a:gt(6)").hide();

    }
})

//更多条件
$("#moreCond").on("click",function(){
    $("#priceCond").show();
	$("#moreCond").hide();

})
//收起
$("#priceCond").on("click",function () {
    $("#priceCond").hide();
	$("#moreCond").show();
})

//分类搜索公共函数
function loadProductByClassify(search) {
	$.ajax({
		type:"get",
		url:"data/ringlist/ringlistByClassify.php?"+search,
		success:function(data){
			console.log(data);
            var html="";
            for(var item of data.bySeries){
                console.log(item);
				////////////////////////////////列表加载
                html+=`<li>
										<a href="${item.rid}"><img src="${item.md}" alt=""></a>
										<div>
											<!--价格-->
											<div class="price">¥${item.price}</div>
											<!--描述-->
											<p class="detail">${item.series} ${item.neatness} ${item.mainsize} ${item.color}色</p>
											<!--按钮-->
											<div class="buybtn">
												<span>收藏</span>
												<a href="">立即购买</a>
											</div>
											<!--评价-->
											<div class="comment">
												<i>评价：</i><span>${item.comment}</span>
											</div>
										</div>
									</li>`;
            }
            $(".dr_ringlist").html(html);

            //////////////////////////////////////分页
            data.pno=parseInt(data.pno);

            var html="";
            html+=`<a href="javascript:loadProductByPageNo(pno-1,9);" class="prev" id="prev">上一页</a>`;
            //上上一页
            if(data.pno-2>0){
                html+=`<li><a href="?pno=${pno}">${data.pno-2}</a></li>`
            }
            //上一页
            if(data.pno-1>0){
                html+=`<li><a href="?pno=${pno}">${data.pno-1}</a></li>`
            }
            //当前页
            html+=`<li class="active"><a href="#">${data.pno}</a></li>`;
            //下一页
            if(data.pno+1<=data.pageCount){
                html+=`<li><a href="?pno=${pno}">${data.pno+1}</a></li>`
            }
            //下下一页
            if(data.pno+2<=data.pageCount){
                html+=`<li><a href="?pno=${pno}">${data.pno+2}</a></li>`
            }
            html+=`<a href="javascript:loadProductByPageNo(pno+1,9);" class="next" id="next">下一页</a>`;

            $(".pagination").html(html);

		},
		error:function(){
			alert("网络故障，请检查！");
		}
	})
}
//分页公共函数

//分类搜索条件显示
$(".bread-choose").click(function(){
	$(".bread-choose").hide();
	loadProductByPageNo(1,9);
})

///////////////////////////////////////////分类搜索实现
//根据系列搜索
$(".dr_series").on("click","a",function(e){
 	e.preventDefault();
	var search=$(this).attr("href");
	search=decodeURI(search);
	var series=search.split("=")[1];
	$(".bread-choose").html(`<a href="">${series}系列</a>`);
	// console.log(search);
	//loadProductByClassify(search);
	$.ajax({
		type:"get",
		url:"data/ringlist/ringlistByShape_Series.php?"+search,
		success:function(data){
            var html="";
            for(var item of data.bySeries){
                //console.log(item);
				////////////////////////////////列表加载
                html+=`<li>
										<a href="${item.rid}"><img src="${item.md}" alt=""></a>
										<div>
											<!--价格-->
											<div class="price">¥${item.price}</div>
											<!--描述-->
											<p class="detail">${item.series} ${item.neatness} ${item.mainsize}分 ${item.color}色 ${item.shape}</p>
											<!--按钮-->
											<div class="buybtn">
												<span>收藏</span>
												<a href="">立即购买</a>
											</div>
											<!--评价-->
											<div class="comment">
												<i>评价：</i><span>${item.comment}</span>
											</div>
										</div>
									</li>`;
            }
            $(".dr_ringlist").html(html);

			//分页
            data.pno=parseInt(data.pno);
 			//console.log(pno);
			//console.log(data.pno);

            var html="";
			if(data.pno-1>0){
				html+=`<a href="javascript:loadProductByPageNo(${pno}-1,9);" class="prev" id="prev">上一页</a>`;
			}else{
				html+=`<a href="javascript:loadProductByPageNo(1,9);" class="prev" id="prev">上一页</a>`;
			}
            //上上一页
            if(data.pno-2>0){
                html+=`<li><a href="?pno=${pno}">${data.pno-2}</a></li>`
            }
            //上一页
            if(data.pno-1>0){
                html+=`<li><a href="?pno=${pno}">${data.pno-1}</a></li>`
            }
            //当前页
            html+=`<li class="active"><a href="#">${data.pno}</a></li>`;
            //下一页
            if(data.pno+1<=data.pageCount){
                html+=`<li><a href="?pno=${pno}">${data.pno+1}</a></li>`
            }
            //下下一页
            if(data.pno+2<=data.pageCount){
                html+=`<li><a href="?pno=${pno}">${data.pno+2}</a></li>`
            }
			if(data.pno<data.pageCount){
				html+=`<a href="javascript:loadProductByPageNo(${pno}+1,9);" class="next" id="next">下一页</a>`;
			}else{
				html+=`<a href="javascript:loadProductByPageNo(data.pageCount,9);" class="next" id="next">下一页</a>`;

			}

            $(".pagination").html(html);


		},
		error:function(){
			alert("网络故障，请检查！");
		}
	})
})
//根据形状搜索
$(".shape").on("click","a",function(e){
    e.preventDefault();
    var search=$(this).attr("href");
    search=decodeURI(search);
	var shape=search.split("=")[1];
	$(".bread-choose").html(`<a href="">${shape}</a>`);

     console.log(search);
    //loadProductByClassify(search);
    $.ajax({
        type:"get",
        url:"data/ringlist/ringlistByShape_Series.php?"+search,
        success:function(data){
            var html="";
            for(var item of data.byShape){
                //console.log(item);
                ////////////////////////////////列表加载
                html+=`<li>
										<a href="${item.rid}"><img src="${item.md}" alt=""></a>
										<div>
											<!--价格-->
											<div class="price">¥${item.price}</div>
											<!--描述-->
											<p class="detail">${item.series} ${item.neatness} ${item.mainsize}分 ${item.color}色 ${item.shape}</p>
											<!--按钮-->
											<div class="buybtn">
												<span>收藏</span>
												<a href="">立即购买</a>
											</div>
											<!--评价-->
											<div class="comment">
												<i>评价：</i><span>${item.comment}</span>
											</div>
										</div>
									</li>`;
            }
            $(".dr_ringlist").html(html);

						//分页
            data.pno=parseInt(data.pno);
 			//console.log(pno);
			//console.log(data.pno);

            var html="";
			if(data.pno-1>0){
				html+=`<a href="javascript:loadProductByPageNo(${pno}-1,9);" class="prev" id="prev">上一页</a>`;
			}else{
				html+=`<a href="javascript:loadProductByPageNo(1,9);" class="prev" id="prev">上一页</a>`;
			}
            //上上一页
            if(data.pno-2>0){
                html+=`<li><a href="?pno=${pno}">${data.pno-2}</a></li>`
            }
            //上一页
            if(data.pno-1>0){
                html+=`<li><a href="?pno=${pno}">${data.pno-1}</a></li>`
            }
            //当前页
            html+=`<li class="active"><a href="#">${data.pno}</a></li>`;
            //下一页
            if(data.pno+1<=data.pageCount){
                html+=`<li><a href="?pno=${pno}">${data.pno+1}</a></li>`
            }
            //下下一页
            if(data.pno+2<=data.pageCount){
                html+=`<li><a href="?pno=${pno}">${data.pno+2}</a></li>`
            }
			if(data.pno<data.pageCount){
				html+=`<a href="javascript:loadProductByPageNo(${pno}+1,9);" class="next" id="next">下一页</a>`;
			}else{
				html+=`<a href="javascript:loadProductByPageNo(data.pageCount,9);" class="next" id="next">下一页</a>`;

			}

            $(".pagination").html(html);

        },
        error:function(){
            alert("网络故障，请检查！");
        }
    })
})
//根据重量搜索
$(".weight").on("click","a",function(e){
    e.preventDefault();
    var str=$(this).attr("href");
    var minsize=str.split("-")[0];
    var maxsize=str.split("-")[1];
    var search="maxsize="+maxsize+"&minsize="+minsize;
	$(".bread-choose").html(`<a href="">${$(this).html()}</a>`);

    //search=decodeURI(search);
    //console.log(minsize,maxsize,search);
    //loadProductByClassify(search);
    $.ajax({
        type:"get",
        url:"data/ringlist/ringlistBySize.php?"+search,
        success:function(data){
            var html="";
            for(var item of data.bySize){
                //console.log(item);
                ////////////////////////////////列表加载
                html+=`<li>
										<a href="${item.rid}"><img src="${item.md}" alt=""></a>
										<div>
											<!--价格-->
											<div class="price">¥${item.price}</div>
											<!--描述-->
											<p class="detail">${item.series} ${item.neatness} ${item.mainsize}分 ${item.color}色 ${item.shape}</p>
											<!--按钮-->
											<div class="buybtn">
												<span>收藏</span>
												<a href="">立即购买</a>
											</div>
											<!--评价-->
											<div class="comment">
												<i>评价：</i><span>${item.comment}</span>
											</div>
										</div>
									</li>`;
            }
            $(".dr_ringlist").html(html);

        },
        error:function(){
            alert("网络故障，请检查！");
        }
    })
})
//根据价格搜索
$(".price").on("click","a",function(e){
    e.preventDefault();
    var str=$(this).attr("href");
    var minprice=str.split("-")[0];
    var maxprice=str.split("-")[1];
    var search="maxprice="+maxprice+"&minprice="+minprice;
	$(".bread-choose").html(`<a href="">${$(this).html()}</a>`);

    //search=decodeURI(search);
    console.log(minprice,maxprice,search);
    //loadProductByClassify(search);
    $.ajax({
        type:"get",
        url:"data/ringlist/ringlistByPrice.php?"+search,
        success:function(data){
            var html="";
            for(var item of data.byPrice){
                console.log(item);
                ////////////////////////////////列表加载
                html+=`<li>
										<a href="${item.rid}"><img src="${item.md}" alt=""></a>
										<div>
											<!--价格-->
											<div class="price">¥${item.price}</div>
											<!--描述-->
											<p class="detail">${item.series} ${item.neatness} ${item.mainsize}分 ${item.color}色 ${item.shape}</p>
											<!--按钮-->
											<div class="buybtn">
												<span>收藏</span>
												<a href="">立即购买</a>
											</div>
											<!--评价-->
											<div class="comment">
												<i>评价：</i><span>${item.comment}</span>
											</div>
										</div>
									</li>`;
            }
            $(".dr_ringlist").html(html);
        },
        error:function(){
            alert("网络故障，请检查！");
        }
    })
})

///////////////////////////////////////////排序实现
//根据价格排序
$("#orderByPrice").click(function(){
    $.ajax({
        type:"get",
        url:"data/ringlist/ringlistOrderByPrice.php",
        success:function(data){
            var html="";
            for(var item of data.order){
                //console.log(item);
                ////////////////////////////////列表加载
                html+=`<li>
										<a href="${item.rid}"><img src="${item.md}" alt=""></a>
										<div>
											<!--价格-->
											<div class="price">¥${item.price}</div>
											<!--描述-->
											<p class="detail">${item.series} ${item.neatness} ${item.mainsize}分 ${item.color}色 ${item.shape}</p>
											<!--按钮-->
											<div class="buybtn">
												<span>收藏</span>
												<a href="">立即购买</a>
											</div>
											<!--评价-->
											<div class="comment">
												<i>评价：</i><span>${item.comment}</span>
											</div>
										</div>
									</li>`;
            }
            $(".dr_ringlist").html(html);
        },
        error:function(){
            alert("网络故障，请检查！");
        }
    })
})
//根据人气排序
$("#orderByComment").on("click","a",function(e){

    // console.log(search);
    //loadProductByClassify(search);
    $.ajax({
        type:"get",
        url:"data/ringlist/ringlistOrderByComment.php",
        success:function(data){
            var html="";
            for(var item of data.order){
                //console.log(item);
                ////////////////////////////////列表加载
                html+=`<li>
										<a href="${item.rid}"><img src="${item.md}" alt=""></a>
										<div>
											<!--价格-->
											<div class="price">¥${item.price}</div>
											<!--描述-->
											<p class="detail">${item.series} ${item.neatness} ${item.mainsize}分 ${item.color}色 ${item.shape}</p>
											<!--按钮-->
											<div class="buybtn">
												<span>收藏</span>
												<a href="">立即购买</a>
											</div>
											<!--评价-->
											<div class="comment">
												<i>评价：</i><span>${item.comment}</span>
											</div>
										</div>
									</li>`;
            }
            $(".dr_ringlist").html(html);
        },
        error:function(){
            alert("网络故障，请检查！");
        }
    })
})
//按新品排序
$("#orderByIshotsales").on("click","a",function(e){
    var str=$(this).attr("href");
    var search="ishotsales=1";
    //search=decodeURI(search);
    console.log(minprice,maxprice,search);
    //loadProductByClassify(search);
    $.ajax({
        type:"get",
        url:"data/ringlist/ringlistIshotsaled.php?"+search,
        success:function(data){
            var html="";
            for(var item of data.orderbyIshotsales){
                console.log(item);
                ////////////////////////////////列表加载
                html+=`<li>
										<a href="${item.rid}"><img src="${item.md}" alt=""></a>
										<div>
											<!--价格-->
											<div class="price">¥${item.price}</div>
											<!--描述-->
											<p class="detail">${item.series} ${item.neatness} ${item.mainsize}分 ${item.color}色 ${item.shape}</p>
											<!--按钮-->
											<div class="buybtn">
												<span>收藏</span>
												<a href="">立即购买</a>
											</div>
											<!--评价-->
											<div class="comment">
												<i>评价：</i><span>${item.comment}</span>
											</div>
										</div>
									</li>`;
            }
            $(".dr_ringlist").html(html);
        },
        error:function(){
            alert("网络故障，请检查！");
        }
    })
})

