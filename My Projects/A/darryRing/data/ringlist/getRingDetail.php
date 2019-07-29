<?php
header("Content-Type:application/json");
require_once("../init.php");
$rid=$_REQUEST["rid"];
$output=[];
//$series=$_REQUEST["series"];
$sql="select *,(select md from ringspic where rid=d.rid limit 1) md from ringDetail d where rid='$rid'";
$result=mysqli_query($conn,$sql);
$row1=mysqli_fetch_all($result,1);
$output["rings"]=$row1;

$sql="select * from ringspic where rid='$rid'";
$result=mysqli_query($conn,$sql);
$row2=mysqli_fetch_all($result,1);
$output["pics"]=$row2;

$sql="SELECT color,mainsize,price,rid FROM `ringdetail` WHERE series='FOREVER'";
$result=mysqli_query($conn,$sql);
$row3=mysqli_fetch_all($result,1);
$output["matchs"]=$row3;

echo json_encode($output);
