<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>スケジュール登録 | G＆A</title>
    <link rel="stylesheet" href="/GandA/css/schedule.css">
</head>

<body>
    <div class="wrapper_schedule">
        <!-- ヘッダー（ここから） -->
        <header>

        </header>
        <!-- ヘッダー（ここまで） -->
        <!-- メイン（ここから） -->
        <main>
            <div class="time-schedule">
                <p><span class="time">&nbsp&nbsp0:00</span></p>
                <p><span class="time">&nbsp&nbsp1:00</span></p>
                <p><span class="time">&nbsp&nbsp2:00</span></p>
                <p><span class="time">&nbsp&nbsp3:00</span></p>
                <p><span class="time">&nbsp&nbsp4:00</span></p>
                <p><span class="time">&nbsp&nbsp5:00</span></p>
                <p><span class="time">&nbsp&nbsp6:00</span></p>
                <p><span class="time">&nbsp&nbsp7:00</span></p>
                <p><span class="time">&nbsp&nbsp8:00</span></p>
                <p><span class="time">&nbsp&nbsp9:00</span></p>
                <p><span class="time">10:00</span></p>
                <p><span class="time">11:00</span></p>
                <p><span class="time">12:00</span></p>
                <p><span class="time">13:00</span></p>
                <p><span class="time">14:00</span></p>
                <p><span class="time">15:00</span></p>
                <p><span class="time">16:00</span></p>
                <p><span class="time">17:00</span></p>
                <p><span class="time">18:00</span></p>
                <p><span class="time">19:00</span></p>
                <p><span class="time">20:00</span></p>
                <p><span class="time">21:00</span></p>
                <p><span class="time">22:00</span></p>
                <p><span class="time">23:00</span></p>
                <p><span class="time">24:00</span></p>
                <input type="text" class="line0" readonly>
                <input type="text" class="line1" readonly>
                <input type="text" class="line2" readonly>
                <input type="text" class="line3" readonly>
                <input type="text" class="line4" readonly>
                <input type="text" class="line5" readonly>
                <input type="text" class="line6" readonly>
                <input type="text" class="line7" readonly>
                <input type="text" class="line8" readonly>
                <input type="text" class="line9" readonly>
                <input type="text" class="line10" readonly>
                <input type="text" class="line11" readonly>
                <input type="text" class="line12" readonly>
                <input type="text" class="line13" readonly>
                <input type="text" class="line14" readonly>
                <input type="text" class="line15" readonly>
                <input type="text" class="line16" readonly>
                <input type="text" class="line17" readonly>
                <input type="text" class="line18" readonly>
                <input type="text" class="line19" readonly>
                <input type="text" class="line20" readonly>
                <input type="text" class="line21" readonly>
                <input type="text" class="line22" readonly>
                <input type="text" class="line23" readonly>
            </div>
            <a href="/GandA/CalendarServlet">戻る</a>
        </main>
        <!-- メイン（ここまで） -->
        <!-- フッター（ここから） -->
        <footer>

        </footer>
        <!-- フッター（ここまで） -->
        <!--jsプログラム-->
        <script>
        	console.log("kaisi");
        	var queryString = window.location.search;
        	var queryObject = new Object();
        	if(queryString){
        	  queryString = queryString.substring(1);
        	  var parameters = queryString.split('&');

        	  for (var i = 0; i < parameters.length; i++) {
        	    var element = parameters[i].split('=');

        	    var paramName = decodeURIComponent(element[0]);
        	    var paramValue = decodeURIComponent(element[1]);

        	    queryObject[paramName] = paramValue;
        	  }
        	}
        	console.log(queryObject.date);
        </script>
    </div>
</body>

</html>