<?php
header("Content-Type:application/json");
require_once("../init.php");
//$output=[];
//
//$pno=$_REQUEST["pno"];//当前页
//if(!$pno){$pno=1;}
//$pageSize=$_REQUEST["pageSize"];//页面宽度
//if(!$pageSize){$pageSize=9;}
//$offset=($pno-1)*$pageSize;//当前页起始下标
//
//
//
//$sql="select count(*) c from ringdetail";
//$result=mysqli_query($conn,$sql);
//$row=mysqli_fetch_assoc($result);
//$totalRecode=$row["c"];//总记录数
//$pageCount=ceil($totalRecode/$pageSize);//总页数

//根据用户传入信息查询对应数据
$kw=$_REQUEST["kw"];
$sql="select *,(select md from ringspic where rid=d.rid) md from ringdetail d ";
if($kw){
  $kws=explode(" ",$kw);//$kw.split(" ")
  //$kws=["mac","256g","i7"]
  for($i=0;$i<count($kws);$i++){
    $kws[$i]=" series like '%$kws[$i]%' ";
  }

  $where=" where ".implode(" and ",$kws);
  //$where=" where series like '%mac%' and title like '%256g%' and title like '%i7%' ";
  $sql.=$where;
}

//$sql.=" limit $offset,$pageSize";

$result=mysqli_query($conn,$sql);
$rows=mysqli_fetch_all($result,1);

//$sql="select * from series";
//$result=mysqli_query($conn,$sql);
//$rows2=mysqli_fetch_all($result,1);
//$output=[
//    "pno"=>$pno,
//    "pageSize"=>$pageSize,
//    "pageCount"=>$pageCount,
//    "totalRecode"=>$totalRecode,
//    "rings"=>$rows1,
//    "series"=>$rows2
//];


echo json_encode($rows);

