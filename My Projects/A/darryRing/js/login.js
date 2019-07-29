
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

 //功能模块2：验证码点击切换
    var img=$("#yzm");
    img.click(function(){
        this.src="data/login/00_yzm.php";
    })


//登录
$("#btnLogin").on("click",function(e){
    e.preventDefault();
    var uname=$("#uname").val();
    var upwd=$("#upwd").val();
    $.ajax({
        type:"get",
        url:"data/login/login.php",
        data:{uname:uname,upwd:upwd},
        success:function (data) {
                var back="";
            if(data.code==1){
                if(!(back==location.search.slice(6))){
                    location=location.search.slice(6);
                }else{
                    location="index.html";
                }

            }else{
                //弹框提示
                alertMsg(data.msg);
                closeMsg();
                $("#uname").focus();
            }
        },
        error:function () {
            alert("网络故障请检查！");
        }
    })
})



