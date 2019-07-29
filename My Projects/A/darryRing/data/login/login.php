<?php
header("Content-Type:application/json");
require_once("../init.php");
@$uname=$_REQUEST["uname"];
if(!$uname){
  die('{"code":401,"msg":"用户名不能为空"}');
}
@$upwd=$_REQUEST["upwd"];
if(!$upwd){
  die('{"code":402,"msg":"密码不能为空"}');
}

if($uname&&$upwd){
  $sql="select uid from user where uname='$uname' and binary upwd='$upwd'";
  $row=mysqli_fetch_row(mysqli_query($conn,$sql));
  if($row){
    session_start();
    $_SESSION["uid"]=$row[0];
    //var_dump($_SESSION["uid"]);
    //echo json_encode(["code"=>1,"msg"=>"登陆成功"]);
	echo '{"code":1,"msg":"登录成功"}';
  
  }else
	echo '{"code":-1,"msg":"用户名或密码错误"}';

  }