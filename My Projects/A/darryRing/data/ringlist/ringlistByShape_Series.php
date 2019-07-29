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
@$series=$_REQUEST["series"];
if($series==null){$series="";}
@$shape=$_REQUEST["shape"];
if($shape==null){$shape="";}


$sql="select count(*) c from ringdetail";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_assoc($result);
$totalRecode=$row["c"];//总记录数
$pageCount=ceil($totalRecode/$pageSize);//总页数

////////////////////////////搜索
//按系列
$sql="SELECT *,(select md from ringspic where rid=d.rid limit 1) md FROM ringdetail d WHERE series='$series' limit $offset,$pageSize";
$result=mysqli_query($conn,$sql);
$rows1=mysqli_fetch_all($result,1);
//按形状
$sql="SELECT *,(select md from ringspic where rid=d.rid limit 1) md FROM ringdetail d WHERE shape='$shape' limit $offset,$pageSize";
$result=mysqli_query($conn,$sql);
$rows3=mysqli_fetch_all($result,1);


$output=[
    "pno"=>$pno,
    "pageSize"=>$pageSize,
    "pageCount"=>$pageCount,
    "totalRecode"=>$totalRecode,
     "bySeries"=>$rows1,
     "byShape"=>$rows3,
];


echo json_encode($output);

