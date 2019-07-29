<?php
/**
* 添加到地址表
*/
header('Content-Type: application/json;charset=UTF-8');
require_once('../init.php');

$user_name=$_REQUEST["user_name"];
$proName=$_REQUEST["proName"];
$city=$_REQUEST["city"];
$county=$_REQUEST["county"];
$address=$_REQUEST["address"];
$cellphone=$_REQUEST["cellphone"];

session_start();
if(! @$_SESSION['uid']){
  $_SESSION['toBuyLid'] = $rid;
  die('{"code":300, "msg":"login required"}');
}

//获取自增编号保存给用户????
$sql = "INSERT INTO receiver_address VALUES(NULL, '$_SESSION[uid]', '$user_name','$proName', '$city','$county','$address','$cellphone',null,null,null,1)";
$result = mysqli_query($conn, $sql);

if($result){
  echo '{"code":200, "msg":"add succ"}';
}else {
  echo '{"code":500, "msg":"add err"}';
}
