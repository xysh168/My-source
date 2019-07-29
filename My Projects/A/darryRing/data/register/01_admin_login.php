<?php
session_start();
require_once("../init.php");
//4.获取用户数据
$uname=$_REQUEST["uname"];
$upwd=$_REQUEST["upwd"];
//获取用户输入的验证码
$uyzm=$_REQUEST["yzm"];
//获取系统生成的验证码并与用户输入的进行比对
if($uyzm!=$_SESSION["captcha"]){
    echo '{"code":-2,"msg":"验证码格式不正确，请检查"}';
    exit;
}

//5.创建sql语句并执行
$sql="SELECT * FROM user WHERE uname='$uname' AND upwd='$upwd'";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_assoc($result);
//echo $_SESSION['captcha'];
//6.判断输出结果
if($row!==null){
    echo '{"code":1,"msg":"登陆成功！"}';
}else{
    echo '{"code":-1,"msg":"用户名或密码错误！"}';
}
?>
