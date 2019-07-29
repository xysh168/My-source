<?php
header("Content-Type:application/json");
require_once("../init.php");
$proName=$_REQUEST["proName"];
$sql="select title from shops where proId=(select proId from provinces where proName='$proName')";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_all($result,1);
if($row){
	echo json_encode($row);
}

