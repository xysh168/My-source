<?php
header("Content-Type:application/json");
require_once("../init.php");
$proId=$_REQUEST["proId"];
$sql="SELECT * FROM `cities` where proId='$proId'";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_all($result,1);
if($row){
	echo json_encode($row);
}