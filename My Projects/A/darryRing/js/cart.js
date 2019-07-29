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

//购物车验证是否登录再进购物车
        $.ajax({
            type:"get",
            url:"./data/login/isLogin.php",
            success:function (data) {
                if(data.ok==1){
					loadCart();
				}else{
                    console.log("cart");
					location="login.html?back="+location.href;
                    //记录跳转前的页面url,登陆成功后继续跳转回来
				}
            },
            error:function () {
                alert("网络故障，请检查！")
            }

        })

//封装加载购物车方法
function loadCart(){
    $.ajax({
        type:"get",
        url:"data/cart/list.php",
        success:function(data){
            //console.log(data);
            if (data.code === 300) {
                alertMsg('您尚未登录！');
                $('#alertMsg_btn1').click(function () {
					location="login.html?back="+location.href;
                });
            } else if (data.code === 200) {

                var html="";
                let money=0.0;
                let count=0;
                //console.log(data.data);
                if(data.data.length){
                    for(item of data.data){
                        if(item.is_checked==1){
                            money+=parseInt(item.count)*parseInt(item.price);
                            count+=parseInt(item.count);
                        }
                        //console.log(money,count);
                        html+=`<table class="cart-table">
                                <tbody class="cart_tbody">
                                <tr>
									<td width="30px" rowspan="2" align="center" class="pad-lf_20" valign="top">
                                    <input class="selRing" name="check" title="${item.iid}" type="checkbox" ${(item.is_checked==1)?"checked":""}></td>
									<td width="120px" rowspan="2" valign="top"> 
                                    <img class="ringPic" width="100px" height="100px" src=${item.md} alt=""></td>
									<td width="280px" class="nopad-lf border-dashed"><strong class="theme" title=${item.rid}>${item.series}系列 经典款 ${item.mainsize}分 ${item.color}色 ${item.classify}</strong></td>
									<td width="260px" class="nopad-lf border-dashed">
										<span style="display: none">刻字内容不能超过10个字符</span>
										<div class="buy-choose">
											<input type="text" placeholder="刻字限5个汉字或10个字母">
											<div class="choose-btn">
												<i>♥</i>
												<i>&</i>
												<a href="">确定</a>
											</div>
										</div>
									</td>
									<td width="160px" class="border-dashed pay-money">
										<span>¥${item.price}</span>
									</td>
									<td width="150px" class="border-dashed">
										<a href="">移入礼物清单</a><br>
										<a href="${item.iid}" class="delCartItem">删除</a>
									</td>
								</tr>
								<tr>
									<td class="nopad-lf ring-detail" colspan="3">
										<strong>求婚钻戒信息</strong>
										<div class="ringdetail-hide">
											<p>主钻重量：${item.mainsize}分</p>
											<div class="ringInfo" data-id=${item.rid} style="display:none">
												<p>戒托材质：${item.ringcz}</p>
												<p>刻字内容：${item.handiwork}</p>
												<p>手寸大小：${item.measure}</p>
												<p>主钻形状：${item.shape}</p>
												<p>主钻颜色：${item.color}色</p>
												<p>产品编号：${item.ringid}</p>
												<p>系列名称：${item.series}系列</p>
											</div>
										</div>
										<strong class="pad-lf_20">主石副石信息</strong>
										<div class="ringdetail-hide">
											<p>主钻净度：${item.neatness}</p>
											<div class="ringInfo" data-id=${item.rid} style="display:none">
												<p>主钻切工：${item.cut}</p>
												<p>主石数量：${item.mainnum}</p>
												<p>副石重量：${item.minorweight}</p>
												<p>副石数量：${item.minornum}</p>
												<p>副石材质：${item.minorcz}</p>
											</div>
										</div>
									</td>
									<td align="center" valign="top" class="pad-lf_20">
										<a href="${item.rid}" class="ringdetail-hide openDetail">展开查看详情>></a>
									</td>
								</tr>
                            </tbody>
                        </table>`;
                    }
                    $("#cart-info").html(html);

                    //展开查看详情的显示隐藏
                    $(".cart-table").on("click",".openDetail",function(e){
                        e.preventDefault();
                        console.log(88);
                        var $tar=$(e.target);
                        var openDetail=$tar.attr('href');
                        if($("[data-id="+openDetail+"]").is(":has(:hidden)")){
                            $("[data-id="+openDetail+"]").show();
                        }else{
                            $("[data-id="+openDetail+"]").hide();
                        }
                    })

                    //修改购物车条目中的是否勾选——单选
                    $(".cart-table").on("click",".selRing",function(e){
                        var $tar=$(e.target);
                        var iid=$tar.attr("title");
                            if($(".selRing").prop("checked")==true){
                        }
                    })
                    

                    //全选
                    $(".selAll").change(function(){
                        $("input[name='check']").prop("checked",this.checked);
                        console.log(111);
                        //更新数据库

                        $("input[name='check']").each(function(i,elem){
                            var iid= $(this).attr("title");
                            var checked=$(this).prop("checked");
                            console.log(iid,checked);

                            $.ajax({
                                type:"post",
                                url:"data/cart/update_checked.php",
                                data:{iid:iid,checked:checked},
                                success:function(data){
                                    console.log(data.msg);
                                    //？？？如何刷新页面
                                     window.location.reload(true);
                                    // //计算总金额
                                    // $("#cart-amount strong").html("¥"+money);
                                    // //计算总数量
                                    // $("#cart-num strong").html(count);
                                    // loadCart();
                                    //  console.log(456);
                                },
                                error:function(){
                                    alert("网络故障，请检查！");
                                }
                            })
                        })
                    })
                    //单选
                    console.log($("input[name='check']"));
                    $("input[name='check']").change(function(){
                        //单选和反选
                        if($("input[name='check']").not("input:checked").length<=0){
                            $(".selAll").prop("checked",true);
                        }else{
                            $(".selAll").prop("checked",false);
                        }
                        //更新数据库
                        var iid= $(this).attr("title");
                        var checked=$(this).prop("checked");
                        console.log(iid,checked);
                        $.ajax({
                            type:"post",
                            url:"data/cart/update_checked.php",
                            data:{iid:iid,checked:checked},
                            success:function(data){
                                console.log(data.msg);
                                //？？？如何刷新页面
                                 window.location.reload(true);
                                // //计算总金额
                                // $("#cart-amount strong").html("¥"+money);
                                // //计算总数量
                                // $("#cart-num strong").html(count);
                                // console.log(123);

                                            
                            },
                            error:function(){
                                alert("网络故障，请检查！");
                            }
                        })

                       
                    })

                    //计算总金额
                    $("#cart-amount strong").html("¥"+money);
                    //计算总数量
                    $("#cart-num strong").html(count);

                    //删除购物车当前行内容
                    $(".cart-table").on("click",".delCartItem",function(e){
                        e.preventDefault();
                        var $tar=$(e.target);
                        var id=$tar.attr("href");
                        console.log(id);
                        alertMsg("确定删除当前商品吗？");
                        $("#alertMsg_btn1").click(function(){
                            closeMsg();
                            $.ajax({
                                type:"get",
                                url:"data/cart/del.php",
                                data:{iid:id},
                                success:function(data){
                                    if(data.code===200){
                                        alertMsg("删除成功！");
                                        closeMsg();
                                        location.reload(true);
                                    }
                                },
                                error:function(){
                                    alert("网络故障，请检查");
                                }
                            })
                        })
                    })

                    //立即购买
                    $("#cart-post").click(function(){
                        //选中大于1
                        console.log($("input[name='check']").not("input:checked"));
                        if(($("input[name='check']").length-$("input[name='check']").not("input:checked").length)>1){
                            alertMsg("DR求婚钻戒，一生仅能定制一枚，不能提交多枚钻戒哦~");
                            closeMsg();//选多了
                        }else if($("input[name='check']").not("input:checked").length==$("input[name='check']").length){
                            alertMsg("请勾选您确认购买的商品！");
                            closeMsg();//一个没写选 

                        }else if($("input[name='check']").not("input:checked").length==($("input[name='check']").length-1)){
                            location.href="order.html";
                        }

                    })


                }
            }
            
        }
    })
}

