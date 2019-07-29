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

//订单页验证是否登录再进订单页
$.ajax({
            type:"get",
            url:"./data/login/isLogin.php",
            success:function (data) {
                if(data.ok==1){
					loadOrder();
				}else{
                    // alertMsg("请登录查看订单！");
                    // $("#alertMsg_btn1").click(function(){
                        location="login.html?back="+location.href;
                        //记录跳转前的页面url,登陆成功后继续跳转回来
                    // })
				}
            },
            error:function () {
                alert("网络故障，请检查！")
            }

})

//封装加载订单页方法
function loadOrder(){
    $.ajax({
        type:"get",
        url:"data/order/order.php",
        success:function(data){
            console.log(data);
            if (data.code === 300) {
                alertMsg('您尚未登录！');
                $("#shadowDiv").show();
                $('#alertMsg_btn1').click(function () {
                    closeMsg();
					location="login.html?back="+location.href;
                });
            } else if (data.code === 200) {
                var html="";
                let money=0.0;
                let count=0;
                console.log(data.address);
                if(data.data.length){
                    //加载地址
                    var adr=data.address[data.address.length-1];
                    $("#addresId1").html(
                        `<i class="address_name">
								${adr.receiver} ${adr.city}
						</i>
						<i class="user_address">
								${adr.province} ${adr.city} ${adr.county} ${adr.address} ${adr.cellphone}
						</i>`
                    );

                    //加载订单内容
                    for(item of data.data){
                        money+=parseInt(item.count)*parseInt(item.price);
                        count+=parseInt(item.count);
                        html+=`<table class="cart-table">
                                <tbody class="cart_tbody">
                                <tr>
									<td width="110px" rowspan="2" valign="top">
                                    <img class="ringPic" width="100px" height="100px" src=${item.md} alt=""></td>
									<td width="300px" class="nopad-lf border-dashed"><strong class="theme" title=${item.rid}>${item.series}系列 经典款 ${item.mainsize}分 ${item.color}色 ${item.classify}</strong></td>
									<td width="150px" class="nopad-lf border-dashed">
										<span>a&b</span>
									</td>
									<td width="130px" class="border-dashed ">
										<span>${item.ringcz}</span>
									</td>
                                    <td width="150px" class="border-dashed ">
										<span>16</span>
									</td>
									<td width="150px" class="border-dashed pay-money">
										<span>¥${item.price}</span>
									</td>
								</tr>
                            </tbody>
                        </table>`;
                    }
                    $("#cart-info").html(html);

                    //计算总金额
                    $("#cart-amount strong").html("¥"+money);
                    //计算总数量
                    $("#cart-num strong").html(count);

                    //提交订单
                    $("#order-post").click(function(){
                        alertMsg("订单提交成功，请支付");
                        $("#shadowDiv").show();
                        $("#alertMsg_btn1").click(function(){
                            closeMsg();
                            location.href="payment.html";

                        })
                    })
                    $(".address_close").click(function(){
                        $(".address_edit").hide();
                    })

                }
            }
            
        }
    })
}

//新增收货地址显示隐藏
var flag=true;
$("#adressEdit").click(function(e){
    e.preventDefault();
    console.log(111);
    if(flag){
        $(".address_edit").show();
        flag=false;

    }else{
        $(".address_edit").hide();
        flag=true;
    }
})
let proName="";
//省市级联——加载省份
$.ajax({
    type:"get",
    url:"data/shoplist/getProvince.php",
    success:function (data) {
       // console.log(data);
        var html=`<option value="">-请选择省份-</option>`;
        for(var item of data){
        	html+=`<option value="${item.proId}" title="${item.proName}">${item.proName}</option>`;
        }
        $("#province").html(html);

		//根据省份加载对应城市
        $("#province").on("change",function(e){
            proName=$("#province").children("option:selected").html();

        	//console.log(222);
            var proId=e.target.value;
        	if(e.target.value!="-请选择省份-"){
                $.ajax({
                    type:"get",
                    url:"data/shoplist/getCities.php",
                    data:{proId:proId},
                    success:function (data) {
                        var html=``;
                        for(var item of data){
                            html+=`<option >${item.cname}</option>`;
                        }
                        $("#city").html(html);
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

console.log($("#province").children("option:selected").html());
//确认配送到此地址
$("#confirm_btn").click(function(){
    console.log(123);
    //console.log(proName);
    var adrInfo=decodeURI($("#address-form").serialize());
    console.log(proName);
    $.ajax({
        type:"get",
        url:"data/order/addAddress.php?proName="+proName+"&"+adrInfo,
        success:function(data){
            console.log(data);
            if(data.code===200){
                alertMsg("地址修改成功");
                $("#alertMsg_btn1").click(function(){
                    $("#alertMsg").hide();
                    window.location.reload(true);
                })
            }
        },
        error:function(){
            alert("网络故障，请检查！");
        }
    })

})
//提交订单
$("#order-post").click(function(){

})