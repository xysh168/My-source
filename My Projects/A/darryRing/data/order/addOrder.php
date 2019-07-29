<?php
/**
* 添加到购物车
*/
header('Content-Type: application/json;charset=UTF-8');
require_once('../init.php');

@$rid = $_REQUEST['rid'] or die('{"code":401,"msg":"rid required"}');
// @$buyCount = $_REQUEST['buyCount'] or die('{"code":402,"msg":"buyCount required"}');

session_start();
if(! @$_SESSION['uid']){
  // $_SESSION['pageToJump'] = 'cart.html';
  $_SESSION['toBuyLid'] = $rid;
  // $_SESSION['toBuyCount'] = $buyCount;
  die('{"code":300, "msg":"login required"}');
}

$sql = "SELECT oid FROM userorder WHERE user_id=$_SESSION[uid] AND rid=$rid";
$result = mysqli_query($conn, $sql);
if( mysqli_fetch_row($result) ){
  die('{"code":600, "msg":"Darry ring求婚钻戒 ，一生只能定制一枚哦！"}');
}else {
  $sql = "INSERT INTO userorder VALUES(NULL, $_SESSION[uid], $rid,3, 1,null,null,null,null)";
}
$result = mysqli_query($conn, $sql);
//echo new Date();

if($result){
  echo '{"code":200, "msg":"add succ"}';
}else {
  echo '{"code":500, "msg":"add err"}';
}
