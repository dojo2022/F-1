<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規登録|G＆A</title>
<link rel="stylesheet" type="text/css" href="/GandA/css/login.css">
<link rel="shortcut icon" href="/GandA/img/other/favicon.ico">
</head>
<body>
  <div class="wrapper-user-register">
    <img src="img/other/icon_main.png" alt="アイコン画像" id="icon_main">
    <main>
      <div class="womanbox">
        <!--<img src="images/login1.png" id="woman">-->
        <img src="img/other/login1-second.png" id="woman">

      </div>

    </main>



    <footer>
      <div id="login_box">
        <div class="content">
          <div id="fade_xos">
<form id="regist_user_form" name="Form1" method="POST" action="/GandA/UserRegisterServlet">
              <div id="input_box">
                <input type="text" name="name" id="name" placeholder=" Name">
                <input type="text" name="user_id" id="user_id" placeholder=" ID">
                <input type="password" name="password" id="password" placeholder=" Password">
                <input type="submit" value="SIGN UP" class="submit" id="signup">
              </div>
              <p id="submit-box">
                <input type="button" value="Back" class="button" id="back">
              </p>
            </form>
          </div>
        </div>
      </div>

    </footer>

</div>


    <script>
  /*    const home = ["images/login1.png", "images/login1-second.png"];
      let count = -1;
      picChange();
      function picChange() {
        count++;
        if (count == home.length) count = 0;
        //画像選択
        document.getElementById('woman').src = home[count];
        //秒数の指定
        setTimeout("picChange()",10000);
      }*/


      const home = ["img/other/login1.png", "img/other/frame.png", "img/other/login1-second.png"];
      let count = -1;
      picChange();
      function picChange() {
        count++;
        if (count == home.length) count = 0;
        //画像選択
        document.getElementById('woman').src = home[count];
        //秒数の指定
        setTimeout("picChange()",10000);
      }


      //登録ボタンを押した時の処理
      document.getElementById('regist_user_form').onsubmit = function (event) {
          var flag = 0;
          if (document.Form1.user_id.value == "" || document.Form1.password.value == "" || document.Form1.name.value == "") {
              flag = 1;
          } else if (document.Form1.password.value.length < 8 ||document.Form1.user_id.value.length < 8 ) {
              flag = 2;
          }
          if (flag == 1) {
              alert("未入力の項目があります");
              event.preventDefault();
              return false;
          } else if (flag == 2) {
              alert("ユーザーID or パスワードが８文字未満です");
              event.preventDefault();
              return false;
          }
          else {
              return true;
          }
      }
      //戻るボタンを押した時の処理
      document.getElementById("back").addEventListener("click", function () {
          location.replace("/GandA/LoginServlet");
      }, false);
</script>
</body>
</html>