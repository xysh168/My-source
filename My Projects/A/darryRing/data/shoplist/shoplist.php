<?php
header("Content-Type:application/json");
require_once("../init.php");
$sql="select sid,title,province,sname,openingHours,hotline,shopPic,address from shops   where proId='101' limit 9 ";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_all($result,1);
echo json_encode($row);
