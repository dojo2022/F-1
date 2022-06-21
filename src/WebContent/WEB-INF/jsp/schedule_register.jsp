<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>スケジュール登録 | G＆A</title>
<link rel="stylesheet" href="/GandA/css/schedule.css">
</head>

<body onload="todaySchedule(); displaySchedule();">
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
						<input name="year" id="year">
						<input name="month" id="month">
						<input name="day" id="day">

						<input type="submit" value="登録" id="register" onclick="judgeTime()">
					</form>
				</div>
			</div>
			<div class="time-schedule">
				<p>
					<span class="time">00:00</span>
				</p>
				<p>
					<span class="time">01:00</span>
				</p>
				<p>
					<span class="time">02:00</span>
				</p>
				<p>
					<span class="time">03:00</span>
				</p>
				<p>
					<span class="time">04:00</span>
				</p>
				<p>
					<span class="time">05:00</span>
				</p>
				<p>
					<span class="time">06:00</span>
				</p>
				<p>
					<span class="time">07:00</span>
				</p>
				<p>
					<span class="time">08:00</span>
				</p>
				<p>
					<span class="time">09:00</span>
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
				<div id="schedule-add"></div>
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

		function todaySchedule(){
			//日付取得
			if(queryString) {
				queryString = queryString.substring(1);
				var parameters = queryString.split('&');

				for (var i = 0; i < parameters.length; i++) {
					var element = parameters[i].split('=');
					var paramName = decodeURIComponent(element[0]);
					var paramValue = decodeURIComponent(element[1]);

					queryObject[paramName] = paramValue;
					if (i == 0) {
						year = queryObject[paramName];
					} else if (i == 1) {
						month = queryObject[paramName];
					} else {
						day = queryObject[paramName];
					}
				}

				console.log(year);
				console.log(month);
				console.log(day);
				console.log("${fn:length(cardList)}");
			} else {
				year = "${dateNow[0]}";
				month = "${dateNow[1]}";
				day = "${dateNow[2]}";

				console.log(year);
				console.log(month);
				console.log(day);
				console.log("${isInsert}");
				console.log("${fn:length(cardList)}");
			}

			document.querySelector('#year').value = year;
			document.querySelector('#month').value = month;
			document.querySelector('#day').value = day;

			if (month.slice(0,1) == "0"){
				month = month.slice(1);
			}
			if (day.slice(0,1) == "0"){
				day = day.slice(1);
			}
			//日付表示
			document.querySelector('#register-date').innerHTML = year + "年 " + month + "月" + day + "日";
			document.getElementById("date").value = year + "/" + month + "/" + day;
		}

		//スケジュール表示
		function displaySchedule(){
			var schedule = "";
			var startTime = "";
			var endTime = "";
			var i = 0;
			<c:forEach var="e" items="${cardList}">
				console.log("${e.title}");
				console.log("${e.sub}");
				console.log("${e.startTime}");
				console.log("${e.endTime}");
				startTime = "${e.startTime}".substr(0,2);
				endTime = "${e.endTime}".substr(0,2);
				console.log("-----");
				console.log(startTime);
				console.log(endTime);
				schedule += "<input type='text' class='line-add add" + i + "' readonly>";
				i++;
			</c:forEach>
			var sss = -1370;
			var add = "add0";
			document.getElementById("schedule-add").innerHTML = schedule;
			document.getElementsByClassName(add)[0].style.top = "-1370px";
			//document.querySelector('.add0').style.top = "-1370px";
			document.querySelector('.add0').style.height = "107px";
			document.querySelector('.add0').style.marginBottom = "-109px";
			document.querySelector('.add1').style.top = "-1258px";
			document.querySelector('.add1').style.height = "51px";
			document.querySelector('.add1').style.marginBottom = "-53px";

		}

		function setTimeRange(start, end) {
			var times = "";
			for (var time = start; time <= end; time++) {
				if (time <= 9){
					times += "<option value='0" + time + ":00'>0" + time + ":00</option>";
				} else{
					times += "<option value='" + time + ":00'>" + time + ":00</option>";
				}
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
			if (time <= 8){
				selectStart.value = "0" + time + ":00";
				selectEnd.value = "0" + (time + 1) + ":00";
			} else if (time == 9){
				selectStart.value = "0" + time + ":00";
				selectEnd.value = time + 1 + ":00";
			} else {
				selectStart.value = time + ":00";
				selectEnd.value = time + 1 + ":00";
			}

			if (show_flag.style.display == "block") {
				//block(表示)のときnone(非表示)にする
				show_flag.style.display = "none";
			} else {
				//none(非表示)のときblock(表示)にする
				show_flag.style.display = "block";
			}
		}
		function judgeTime(){
			console.log("judge");
		}
	</script>
</body>

</html>