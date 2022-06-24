<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
img#main_pict {
    position: fixed;
    width: -webkit-fill-available;
    top: 0px;
    left: 0px;
    max-height: 657px;
}
img#background {
    position: absolute;
    top: 0px;
    left: 0px;
    width: 100vw;
    height: auto;
    max-height: 657px;
}
.content::-webkit-scrollbar{
  display: block;
}
#fade_xos{
    opacity: 0;
    -webkit-transition: all 4s;
    -moz-transition: all 4s;
    -o-transition: all 4s;
    -ms-transition: all 4s;
    transition: all 4s;
	/*margin: 100px auto 30px;
	padding:20px;
	text-align:center;
	border: solid 1px  #33764F;
	width: 450px;*/
}
.fa{
    animation-name:akarin;
    animation-duration:2s;
    animation-fill-mode: forwards;
}
@keyframes akarin {
0%{
opacity: 1;
transform: translateY(0px);
}
50%{
opacity: 1;
transform: translateX(0px);
}
100%{
opacity:0;
transform: translateY(-450px);
}
}
</style>
<link rel="stylesheet" type="text/css" href="/GandA/css/login.css">
</head>
<body>
<img id="background" src="img/other/log_back.png">
  <!--ヘッダーここから-->
  <header>
    <span id="error_message"></span>
  </header>
  <!--ヘッダーここまで-->
  <!--メインここから-->
  <div id="login_box">
  <div class="content">
		<div id="fade_xos">
    <form id="login_form" name="Form1" method="POST" action="/GandA/LoginServlet">
      <div class="icon_main">
        <img id="logo" src="img/other/icon_main.png" alt="アイコン画像" width="120" height="100">
      </div>
      <div id="input_box">
        <p>ID:　　　　　　　<span>半角英数字8字以上</span><br>
          <input type="text" name="user_id" id="user_id">
        </p>
        <p>Password:　　　<span>半角英数字8字以上</span><br>
          <input type="password" name="password" id="password">
          <input type="button" id="buttonPassword" value="表示" onclick="pushHideButton();">
        </p>
        <p>
          <input type="submit" value="Log In" class="submit">
          <input type="button" value="新規登録" class="button" id="regist_user">
        </p>
      </div>
    </form>
       </div>
  </div>
  <div style="clear:both"></div>
<img id="main_pict" src="img/other/frame.png">
</div>
  <!--メインここまで-->
  <!--フッターここから-->
  <footer>
    <!--<p>&copy;</p>-->
  </footer>
  <!--フッターここまで-->
  <!--JavaScriptここから-->
  <!--ログイン処理-->
  <script>
    //ログインボタンを押した時の処理
    document.getElementById('login_form').onsubmit = function (event) {
      var flag = 0;
      if (document.Form1.user_id.value == "" || document.Form1.password.value == "") {
        flag = 1;
      } else if (document.Form1.password.value.length < 8 ||document.Form1.user_id.value.length < 8 ) {
        flag = 2;
      }
      if (flag == 1) {
        // document.getElementById('error_message') = "IDとパスワードを入力してください";
        alert("未入力の項目があります");
        event.preventDefault();
        return false;
      } else if (flag == 2) {
        // document.getElementById('error_message') = "パスワードが８文字未満です";
        alert("ユーザID or パスワードが８文字未満です");
        event.preventDefault();
        return false;
      }
      else {
        return true;
      }
    }
    //ログインボタンを押したときの処理
    document.getElementById("regist_user").addEventListener("click", function () {
      location.replace("/GandA/UserRegisterServlet");
    }, false);
    //表示ボタンを押した時の処理
    function pushHideButton() {
        var txtPass = document.getElementById("password");
        var btnPass = document.getElementById("buttonPassword");
        if (txtPass.type === "text") {
          txtPass.type = "password";
          btnPass.value = "表示";
        } else {
          txtPass.type = "text";
          btnPass.value = "非表示";
        }
      }
//フェードアウトの処理
      $(function(){
        	  $(window).click(function (e){
        	     $("#fade_xos").css("opacity",1);
        		 $("img#main_pict").addClass("fa");
        		 //画像を透明にしただけでは実態は消えない。アニメーションが終わってから消す。
        		 window.setTimeout(skelton,2500);
        	  });
      });
       const skelton =()=>{
        	     $("img#main_pict").css("display","none")
      }
  </script>
  <!--JavaScriptここまで-->
</body>
</html>