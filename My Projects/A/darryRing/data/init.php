<?php 
header("Content-Type:application/json");
$conn= mysqli_connect("127.0.0.1","root","","darryring",3306);
$sql="SET NAMES UTF8";
mysqli_query($conn,$sql);