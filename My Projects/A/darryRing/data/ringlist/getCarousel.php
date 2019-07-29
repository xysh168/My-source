<?php
header("Content-Type:application/json");
require_once("../init.php");
$ref=$_REQUEST["ref"];
$sql="select * from shoplist_carousel where isuse='1' and ref='$ref'";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_all($result,1);
echo json_encode($row);
