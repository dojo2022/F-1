<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
        <form id="regist_user_form" name="Form1" method="POST" action="/GandA/UserRegisterServlet">
            <div class="icon_main" style="height:75px;">
                <img src="icon_main.png" alt="アイコン画" width="120" height="100">
            </div>
            <div id="input_box">
                <p>ID:<br>
                    <input type="text" name="USERID" id="user_id">
                </p>
                <p>Name:<br>
                    <input type="text" name="USER" id="name">
                </p>
                <p>Password:<br>
                    <input type="password" name="PASSWORD" id="password">
                </p>
                <p>
                    <input type="submit" value="登録" class="submit"><br>
                    <input type="button" value="戻る" class="button" id="back">
                </p>
            </div>
        </form>
</body>
</html>