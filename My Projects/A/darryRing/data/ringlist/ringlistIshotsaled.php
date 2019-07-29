<?php
header("Content-Type:application/json");
require_once("../init.php");
$output=[];

@$pno=$_REQUEST["pno"];//当前页
if(!$pno){$pno=1;}
@$pageSize=$_REQUEST["pageSize"];//页面宽度
if(!$pageSize){$pageSize=9;}
@$offset=($pno-1)*$pageSize;//当前页起始下标

//新品排序
//@$ishotsales=$_REQUEST["ishotsales"];
//if($ishotsales==null){$ishotsales="";}


$sql="select count(*) c from ringdetail";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_assoc($result);
$totalRecode=$row["c"];//总记录数
$pageCount=ceil($totalRecode/$pageSize);//总页数

////////////////////////////排序
//按新品
$sql="SELECT * FROM `ringdetail` WHERE ishotsales=1 limit $offset,$pageSize";
$result=mysqli_query($conn,$sql);
$rows7=mysqli_fetch_all($result,1);


$output=[
    "pno"=>$pno,
    "pageSize"=>$pageSize,
    "pageCount"=>$pageCount,
    "totalRecode"=>$totalRecode,
    "orderbyIshotsales"=>$rows7

];


echo json_encode($output);

