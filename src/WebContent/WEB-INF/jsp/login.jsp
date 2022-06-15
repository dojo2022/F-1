<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/GandA/css/login.css">
</head>
<body>
  <!--ヘッダーここから-->
  <header>
    <span id="error_message"></span>
  </header>
  <!--ヘッダーここまで-->
  <!--メインここから-->
  <div id="login_box">
    <form id="login_form" name="Form1" method="GET" action="result.html">

      <div class="icon_main">
        <img src="/simpleBC/img/icon_main.png" alt="アイコン画像" width="120" height="100">
      </div>
      <div id="input_box">
        <p>ID:<br>
          <input type="text" name="user_id" id="user_id">
        </p>
        <p>Password:<br>
          <input type="password" name="password" id="password">
        </p>
        <p>
          <input type="submit" value="Log In" class="submit">

          <input type="button" value="新規登録" class="button" id="regist_user">
        </p>
      </div>
    </form>
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
      } else if (document.Form1.password.value.length < 8 && document.Form1.user_id.value != "") {
        flag = 2;
      }
      if (flag == 1) {
        // document.getElementById('error_message') = "IDとパスワードを入力してください";
        alert("IDとパスワードを入力してください");
        event.preventDefault();
        return false;
      } else if (flag == 2) {
        // document.getElementById('error_message') = "パスワードが８文字未満です";
        alert("パスワードが８文字未満です");
        event.preventDefault();
        return false;
      }
      else {
        return true;
      }
    }

    //新規登録ボタンを押したときの処理
    document.getElementById("regist_user").addEventListener("click", function () {
      location.replace("/GandA/UserRegisterServlet");
    }, false);
  </script>
  <!--JavaScriptここまで-->
</body>
</html>
