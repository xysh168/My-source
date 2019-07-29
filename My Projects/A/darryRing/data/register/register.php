<?php
header("Content-Type:application/json");
require_once("../init.php");
session_start();
@$uname=$_REQUEST["uname"];
@$upwd=$_REQUEST["upwd"];
//获取用户输入的验证码
$uyzm=$_REQUEST["yzm"];
//获取系统生成的验证码并与用户输入的进行比对
if($uyzm!=$_SESSION["captcha"]){
    echo '{"code":-2,"msg":"验证码格式不正确，请检查"}';
    exit;
}
if($uname&&$upwd){
  $sql="INSERT INTO `user` VALUES (null, '$uname', '$upwd', null, null, null, null, null)";
  $result=mysqli_query($conn,$sql);
  $count=mysqli_affected_rows($conn);
  //echo $count;
  if($count){
    // session_start();
    // $_SESSION["uid"]=$row[0];
	  echo '{"code":1,"msg":"注册成功"}';
  }else
	  echo '{"code":-1,"msg":"用户名或密码错误"}';

  }