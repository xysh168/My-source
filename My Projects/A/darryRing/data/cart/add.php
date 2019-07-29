<?php
/**
* 添加到购物车
*/
header('Content-Type: application/json;charset=UTF-8');

@$rid = $_REQUEST['rid'] or die('{"code":401,"msg":"rid required"}');
@$buyCount = $_REQUEST['buyCount'] or die('{"code":402,"msg":"buyCount required"}');

session_start();
if(! @$_SESSION['uid']){
  $_SESSION['pageToJump'] = 'cart.html';
  $_SESSION['toBuyLid'] = $rid;
  $_SESSION['toBuyCount'] = $buyCount;
  die('{"code":300, "msg":"login required"}');
}

require_once('../init.php');
$sql = "SELECT iid FROM shoppingcart WHERE user_id=$_SESSION[uid] AND rid=$rid";
$result = mysqli_query($conn, $sql);
if( mysqli_fetch_row($result) ){
  $sql = "UPDATE shoppingcart SET count=count+1 WHERE user_id=$_SESSION[uid] AND rid=$rid";
}else {
  $sql = "INSERT INTO shoppingcart VALUES(NULL, $_SESSION[uid], $rid, $buyCount, false)";
}
$result = mysqli_query($conn, $sql);
if($result){
  echo '{"code":200, "msg":"add succ"}';
}else {
  echo '{"code":500, "msg":"add err"}';
}
