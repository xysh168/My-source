<?php
header("Content-Type:application/json");
require_once("../init.php");
$sql="select rid,price,series,mainsize,color,neatness,cut,(select md from ringspic where rid=d.rid limit 1) md from ringdetail d where ishotsales='1'";
$result=mysqli_query($conn,$sql);
$rows=mysqli_fetch_all($result,1);
if($rows){
	echo json_encode($rows);
}

