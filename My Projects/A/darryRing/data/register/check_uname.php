<?php 

  #1、连接到数据库
  require("../init.php");
  #2、获取传递过来的数据
  $uname=$_REQUEST["uname"];
  #3、拼SQL语句
  $sql="select uname from user where uname='$uname'";
  #4、执行查询操作，并给出响应
  $result=mysqli_query($conn,$sql);
  $row = mysqli_fetch_row($result);
  if($row == null){
     echo json_encode(["code"=>200,"msg"=>"通过"]);
  }else{
    echo json_encode(["code"=>201,"msg"=>"用户名称已被占用"]);
  }
?>