<?php
/**
* 获取当前登录用户的购物车内容
*/
header('Content-Type: application/json;charset=UTF-8');
require_once('../init.php');
session_start();

if(! @$_SESSION['uid']){
  $_SESSION['pageToJump'] = 'cart.html';
  die('{"code":300, "msg":"login required"}');
}
// echo $_SESSION['uid'];

//获取总记录数
$sql = 'SELECT *,(select md from ringspic where rid=r.rid limit 1) md FROM ringdetail r, shoppingcart s WHERE r.rid=s.rid AND user_id='.$_SESSION["uid"];

//,"uid":"'.$_SESSION["uid"].'"
$result = mysqli_query($conn, $sql);
$list = mysqli_fetch_all($result, MYSQLI_ASSOC);

$output = [
  'code'=>200,
  'data'=>$list
];
echo json_encode($output);