<?php
header("Content-Type:application/json");
require_once("../init.php");
$proId=$_REQUEST["proId"];
$sql="select title from shops where proId='$proId' limit 6";
$result=mysqli_query($conn,$sql);
$rows=mysqli_fetch_all($result,1);
if($rows){
	echo json_encode($rows);
}