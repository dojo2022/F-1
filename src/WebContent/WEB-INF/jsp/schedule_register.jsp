<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>スケジュール登録 | G＆A</title>
<link rel="stylesheet" href="/GandA/css/schedule.css">
</head>

<body>
	<div class="wrapper-schedule">
		<!-- ヘッダー（ここから） -->
		<header> </header>
		<!-- ヘッダー（ここまで） -->
		<!-- メイン（ここから） -->
		<main>
			<h1 id="register-date"></h1>
			<div id="form-register-show">
				<!-- 検索フォーム -->
				<div id="space-register">
					<form method="POST" action="/GandA/ScheduleRegisterServlet">
						<label>日付<input type="text" name="DATE" id="date" readonly></label><br>
						<label>タイトル<input type="text" maxlength="20" name="TITLE" id="title"></label><br>
						<label>内容<input type="text" maxlength="100" name="SUB" id="sub"></label><br>
						<label>開始<select name="START" id="start"></select></label>
						<label>終了<select name="END" id="end"></select></label><br>
						<input type="submit" value="登録" id="register">
					</form>
				</div>
			</div>
			<div class="time-schedule">
				<p>
					<span class="time">&nbsp&nbsp0:00</span>
				</p>
				<p>
					<span class="time">&nbsp&nbsp1:00</span>
				</p>
				<p>
					<span class="time">&nbsp&nbsp2:00</span>
				</p>
				<p>
					<span class="time">&nbsp&nbsp3:00</span>
				</p>
				<p>
					<span class="time">&nbsp&nbsp4:00</span>
				</p>
				<p>
					<span class="time">&nbsp&nbsp5:00</span>
				</p>
				<p>
					<span class="time">&nbsp&nbsp6:00</span>
				</p>
				<p>
					<span class="time">&nbsp&nbsp7:00</span>
				</p>
				<p>
					<span class="time">&nbsp&nbsp8:00</span>
				</p>
				<p>
					<span class="time">&nbsp&nbsp9:00</span>
				</p>
				<p>
					<span class="time">10:00</span>
				</p>
				<p>
					<span class="time">11:00</span>
				</p>
				<p>
					<span class="time">12:00</span>
				</p>
				<p>
					<span class="time">13:00</span>
				</p>
				<p>
					<span class="time">14:00</span>
				</p>
				<p>
					<span class="time">15:00</span>
				</p>
				<p>
					<span class="time">16:00</span>
				</p>
				<p>
					<span class="time">17:00</span>
				</p>
				<p>
					<span class="time">18:00</span>
				</p>
				<p>
					<span class="time">19:00</span>
				</p>
				<p>
					<span class="time">20:00</span>
				</p>
				<p>
					<span class="time">21:00</span>
				</p>
				<p>
					<span class="time">22:00</span>
				</p>
				<p>
					<span class="time">23:00</span>
				</p>
				<p>
					<span class="time">24:00</span>
				</p>

				<input type="text" class="line line0" readonly onclick="show(0)">
				<input type="text" class="line line1" readonly onclick="show(1)">
				<input type="text" class="line line2" readonly onclick="show(2)">
				<input type="text" class="line line3" readonly onclick="show(3)">
				<input type="text" class="line line4" readonly onclick="show(4)">
				<input type="text" class="line line5" readonly onclick="show(5)">
				<input type="text" class="line line6" readonly onclick="show(6)">
				<input type="text" class="line line7" readonly onclick="show(7)">
				<input type="text" class="line line8" readonly onclick="show(8)">
				<input type="text" class="line line9" readonly onclick="show(9)">
				<input type="text" class="line line10" readonly onclick="show(10)">
				<input type="text" class="line line11" readonly onclick="show(11)">
				<input type="text" class="line line12" readonly onclick="show(12)">
				<input type="text" class="line line13" readonly onclick="show(13)">
				<input type="text" class="line line14" readonly onclick="show(14)">
				<input type="text" class="line line15" readonly onclick="show(15)">
				<input type="text" class="line line16" readonly onclick="show(16)">
				<input type="text" class="line line17" readonly onclick="show(17)">
				<input type="text" class="line line18" readonly onclick="show(18)">
				<input type="text" class="line line19" readonly onclick="show(19)">
				<input type="text" class="line line20" readonly onclick="show(20)">
				<input type="text" class="line line21" readonly onclick="show(21)">
				<input type="text" class="line line22" readonly onclick="show(22)">
				<input type="text" class="line line23" readonly onclick="show(23)">

			</div>
			<a href="/GandA/CalendarServlet">戻る</a>
		</main>
		<!-- メイン（ここまで） -->
		<!-- フッター（ここから） -->
		<footer> </footer>
		<!-- フッター（ここまで） -->
	</div>
	<!--jsプログラム-->
	<script>
		console.log("kaisi");
		var queryString = window.location.search;
		var queryObject = new Object();
		var year = 0;
		var month = 0;
		var day = 0;
		var selectStart = document.getElementById("start");
		var selectEnd = document.getElementById("end");
		var startTime = setTimeRange(0, 23);
		var endTime = setTimeRange(1, 24);

		//日付取得
		if(queryString){
			queryString = queryString.substring(1);
			var parameters = queryString.split('&');

			for (var i = 0; i < parameters.length; i++) {
				var element = parameters[i].split('=');
				var paramName = decodeURIComponent(element[0]);
				var paramValue = decodeURIComponent(element[1]);

				queryObject[paramName] = paramValue;
				console.log(queryObject[paramName]);
				if (i == 0) {
					year = queryObject[paramName];
				} else if (i == 1) {
					month = queryObject[paramName];
				} else {
					day = queryObject[paramName];
				}
			}
		}
		//日付表示
		document.querySelector('#register-date').innerHTML = year + "年 " + month + "月" + day + "日";
		if (month <= 9){
			month = 0 + month;
		}
		if (day <= 9){
			day = 0 + day;
		}
		document.getElementById("date").value = year + "/" + month + "/" + day;

		function setTimeRange(start, end) {
			var times = "";
			for (var time = start; time <= end; time++) {
				times += "<option value='" + time + ":00'>" + time + ":00</option>";
			}
			return times;
		}

		document.getElementById("start").innerHTML = startTime;
		document.getElementById("end").innerHTML = endTime;

		//検索フォームは最初非表示
		document.getElementById("space-register").style.display = "none";
		//検索欄表示用のボタンが押された時の処理
		function show(time) {
			const show_flag = document.getElementById("space-register");
			selectStart.value = time + ":00";
			selectEnd.value = time + 1 + ":00";
			if (show_flag.style.display == "block") {
				//block(表示)のときnone(非表示)にする
				show_flag.style.display = "none";
			} else {
				//none(非表示)のときblock(表示)にする
				show_flag.style.display = "block";
			}
		}
	</script>
</body>

</html>