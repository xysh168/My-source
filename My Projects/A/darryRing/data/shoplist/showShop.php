<?php
header("Content-Type:application/json");
require_once("../init.php");
$sid=$_REQUEST["sid"];
$sql="select * from shops where sid='$sid'";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_assoc($result);
if($row){
	echo json_encode($row);
}