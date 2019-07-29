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

//背景跳转
$("#banner").css({"cursor":"pointer"});
$("#banner").click(function(){
    location.href="index.html";
})
//注册显示
$("#btnRegister").on("click",function(e){
	e.preventDefault();
	$("#registerform").show();
	$("#loginform").hide();
})

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
    console.log(uname,upwd);
    $.ajax({
        type:"get",
        url:"data/login/login.php",
        data:{uname:uname,upwd:upwd},
        success:function (data) {
            console.log(data.code);
            if(data.code>0){
                //alert("登陆成功");
                //$("#btnLogin").href("index.html");
                location.href="index.html";
            }else{
                alertMsg(data.msg);
                closeMsg();
            }
        },
        error:function () {
            alert("网络故障请检查！");
        }
    })
})

//已有账户 登录
$(".loginlink").click(function(){
    location.href="login.html";
})


//1.用户名验证
uname.onfocus=function(){
    $(".errorMsg").show().html("用户名长度在3到9位之间");
}
uname.onblur=function(){
    if(this.validity.valueMissing){
        $(".errorMsg").show().html("用户名不能为空！");
    }else if(this.validity.tooShort){
        $(".errorMsg").show().html("用户名不少于3位！");
    }else{
        if($("#uname").val()==null){return;}
        else{
            var uname=$("#uname").val();
            $.ajax({
                type:"get",
                url:"data/register/check_uname.php",
                data:{uname:uname},
                success:function(data){
                    console.log(data.code);
                    if(data.code==200){
                        console.log(222);
                        // $(".errorMsg").css({"background": "#fff2f2 url(img/pass.png) no-repeat 4px center"})
 
                        $(".errorMsg").show().html("同户名验证通过！");
                        $("#uname").addClass("succ");
                        upwd.focus();
                    }else if(data.code==201){
                        $(".errorMsg").show().html("用户名已被占用！");
                    }
                }
            })
        }
    }
}
// if(count>=1){

//2.密码验证
upwd.onfocus=function(){
    $(".errorMsg").show().html("密码长度在6到9位之间");
}
upwd.onblur=function(){

    if(this.validity.valueMissing){
        $(".errorMsg").show().html("密码不能为空！");
    }else if(this.validity.tooShort){
        $(".errorMsg").show().html("密码不少于6位！");
    }else{ 
        $(".errorMsg").show().html("密码验证通过！");
        $("#upwd").addClass("succ");

        yanzh.focus();

    }
}
// }
//验证码验证
yanzh.onblur=function(){
    if(this.validity.valueMissing){
        $(".errorMsg").show().html("验证码不能为空！");
    }else{
        var yzm=$("#yanzh").val();
        if(yzm==null){return;}
        else{
            $.ajax({
                type:"get",
                url:"data/register/check_yzm.php",
                data:{yzm:yzm},
                success:function(data){
                    console.log(data.code);
                    if(data.code==1){
                        console.log(222);
                        // $(".errorMsg").css({"background": "#fff2f2 url(img/pass.png) no-repeat 4px center"})
 
                        $(".errorMsg").show().html("验证码验证通过！");
                        $("#yanzh").addClass("succ");

                        
                    }else if(data.code==-1){
                        $(".errorMsg").show().html("验证码有误，请重新输入！");
                    }
                }
            })
        }

    }
}

//注册
$("#register").click(function(e){
    e.preventDefault();
    var str=$("#registerform").serialize();
    console.log(str);
    if($(".userRegister input.succ").length==3){
        $.ajax({
            type:"post",
            url:"data/register/register.php?"+str,
            success:function(data){
                console.log(data);
                if(data.code==1){
                    alertMsg("注册成功！去登陆");
                    $("#shadowDiv").show();
                    $("#alertMsg_btn1").click(function(){
                        closeMsg();
                        location.href="login.html";
                    })
                }else{
                    alertMsg(data.msg);
                    $("#shadowDiv").show();
                    $("#alertMsg_btn1").click(function(){
                        closeMsg();
                        yanzh.focus();
                    })

                }
            },
            error:function(){
                alert("网络故障，请检查！");
            }

        })
    }
})

