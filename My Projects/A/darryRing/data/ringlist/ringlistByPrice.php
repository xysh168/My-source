<?php
header("Content-Type:application/json");
require_once("../init.php");
$output=[];

@$pno=$_REQUEST["pno"];//当前页
if(!$pno){$pno=1;}
@$pageSize=$_REQUEST["pageSize"];//页面宽度
if(!$pageSize){$pageSize=9;}
@$offset=($pno-1)*$pageSize;//当前页起始下标

//分类搜索
@$maxprice=$_REQUEST["maxprice"];
if($maxprice==null){$maxprice="";}
@$minprice=$_REQUEST["minprice"];
if($minprice==null){$minprice="";}


$sql="select count(*) c from ringdetail";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_assoc($result);
$totalRecode=$row["c"];//总记录数
$pageCount=ceil($totalRecode/$pageSize);//总页数

////////////////////////////搜索
//按价格
$sql="SELECT *,(select md from ringspic where rid=d.rid limit 1) md FROM ringdetail d WHERE price> $minprice and price< $maxprice limit $offset,$pageSize";
$result=mysqli_query($conn,$sql);
$rows4=mysqli_fetch_all($result,1);


$output=[
    "pno"=>$pno,
    "pageSize"=>$pageSize,
    "pageCount"=>$pageCount,
    "totalRecode"=>$totalRecode,
    "byPrice"=>$rows4,
];


echo json_encode($output);

