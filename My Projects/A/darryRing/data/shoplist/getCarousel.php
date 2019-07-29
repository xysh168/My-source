<?php
header("Content-Type:application/json");
require_once("../init.php");
$sql="select * from shoplist_carousel where isuse='1' and ref='shoplist-banner'";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_all($result,1);
echo json_encode($row);
