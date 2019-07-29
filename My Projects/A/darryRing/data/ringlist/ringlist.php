<?php
header("Content-Type:application/json");
require_once("../init.php");
$output=[];

$pno=$_REQUEST["pno"];//当前页
if(!$pno){$pno=1;}
$pageSize=$_REQUEST["pageSize"];//页面宽度
$offset=($pno-1)*$pageSize;//当前页起始下标

$sql="select count(*) c from ringdetail";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_assoc($result);
$totalRecode=$row["c"];//总记录数
$pageCount=ceil($totalRecode/$pageSize);//总页数

$sql="select *,(select md from ringspic where rid=d.rid limit 1) md from ringdetail d limit $offset,$pageSize";

$result=mysqli_query($conn,$sql);
$rows1=mysqli_fetch_all($result,1);

$sql="select * from series";
$result=mysqli_query($conn,$sql);
$rows2=mysqli_fetch_all($result,1);
$output=[
    "pno"=>$pno,
    "pageSize"=>$pageSize,
    "pageCount"=>$pageCount,
    "totalRecode"=>$totalRecode,
    "rings"=>$rows1,
    "series"=>$rows2
];


echo json_encode($output);

