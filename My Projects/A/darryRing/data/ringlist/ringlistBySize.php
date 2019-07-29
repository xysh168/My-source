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
@$maxsize=$_REQUEST["maxsize"];
if($maxsize==null){$maxsize="";}
@$minsize=$_REQUEST["minsize"];
if($minsize==null){$minsize="";}


$sql="select count(*) c from ringdetail";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_assoc($result);
$totalRecode=$row["c"];//总记录数
$pageCount=ceil($totalRecode/$pageSize);//总页数

////////////////////////////搜索
//按重量
$sql="SELECT *,(select md from ringspic where rid=d.rid limit 1) md FROM ringdetail d WHERE mainsize> $minsize and mainsize< $maxsize limit $offset,$pageSize";
$result=mysqli_query($conn,$sql);
$rows2=mysqli_fetch_all($result,1);
if($rows2==null){$rows2=[];};



$output=[
    "pno"=>$pno,
    "pageSize"=>$pageSize,
    "pageCount"=>$pageCount,
    "totalRecode"=>$totalRecode,
    "bySize"=>$rows2,

];


echo json_encode($output);

