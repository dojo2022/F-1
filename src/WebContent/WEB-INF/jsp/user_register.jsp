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
<img id="background" src="img/other/log_back.png">

    <!--ヘッダーここから-->
    <header>
    </header>
    <!--ヘッダーここまで-->
    <!--メインここから-->
    <div id="login_box">
        <form id="regist_user_form" name="Form1" method="POST" action="/GandA/UserRegisterServlet">
            <div class="icon_main" style="height:75px;">
        <img src="img/other/icon_main.png" alt="アイコン画像" width="120" height="100">

            </div>
            <div id="input_box">
                <p>USER ID:<br>
                    <input type="text" name="user_id" id="user_id">
                </p>
                <p>Name:<br>
                    <input type="text" name="name" id="name">
                </p>
                <p>Password:<br>
                    <input type="password" name="password" id="password">
                </p>
                <p>
                    <input type="submit" value="登録" class="submit"><br>
                    <input type="button" value="戻る" class="button" id="back">
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
    <script>
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
    <!--JavaScriptここまで-->
</body>
</html>