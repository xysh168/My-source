<?php 
  //获取用户输入的验证码
  header("Content-Type:application/json");
  session_start();
  $yzm=$_REQUEST["yzm"];
  //获取系统生成的验证码并与用户输入的进行比对
  if($yzm!=$_SESSION["captcha"]){
    echo '{"code":-1,"msg":"验证码格式不正确，请检查"}';
    exit;
  }else{

    echo '{"code":1,"msg":"验证通过"}';
  }



?>



