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
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="shortcut icon" href="/GandA/img/other/favicon.ico">
</head>

<body onload="todaySchedule(); displaySchedule();">
	<div class="wrapper-schedule">
		<!-- ヘッダー（ここから） -->
        <header>
            <jsp:include page="/WEB-INF/jsp/menu.jsp" flush="true"/>
		</header>
		<!-- ヘッダー（ここまで） -->
		<!-- メイン（ここから） -->
		<main>
			<h2 id="register-date"></h2>
			<div id="form-register-show">
				<!-- 検索フォーム -->
				<div id="space-register">
					<form id="form1" method="POST" action="/GandA/ScheduleRegisterServlet">
						<label for="date">日付</label><input type="text" name="DATE" id="date" size ="15" readonly><br>
						<label>時間</label><select name="START" id="start"></select><span> ～</span>
						<select name="END" id="end"></select><br>
						<label class="label-title" for="title">タイトル</label><br><input type="text" name="TITLE" id="title" maxlength="20" size ="30"><br>
						<label class="label-sub" for="sub">内容</label><br><textarea name="SUB" id="sub" maxlength="100" rows="5" cols="20"></textarea><br>
						<input name="year" id="year">
						<input name="month" id="month">
						<input name="day" id="day">
						<input name="sub-hide" id="sub-hide">
						<input name="CHECK" id="judge-check">
						<label class="label-share" for="check">共有</label><input type="checkbox" value="check" id="check">
						<input type="submit" name="SUBMIT" value="登録" id="register">
					</form>
					<p id="error"></p>
				</div>
				<div id="space-register-add">
					<form id="form2" method="POST" action="/GandA/ScheduleRegisterServlet">
						<label for="date-add">日付</label><input type="text" name="DATE" id="date-add" size ="15" readonly><br>
						<label>時間</label><select name="START" id="start-add"></select><span> ～</span>
						<select name="END" id="end-add"></select><br>
						<label class="label-title" for="title-add">タイトル</label><br><input type="text" name="TITLE" id="title-add" maxlength="20" size ="30"><br>
						<label class="label-sub" for="sub-add">内容</label><br><textarea name="SUB" id="sub-add" maxlength="100" rows="5" cols="20"></textarea><br>
						<input name="year" id="year-add">
						<input name="month" id="month-add">
						<input name="day" id="day-add">
						<input name="oldStart" id="old-start">
						<input name="oldEnd" id="old-end">
						<input name="sub-hide" id="sub-hide-add">
						<input name="CHECK" id="judge-check-add">
						<input type="submit" name="SUBMIT" value="更新" id="update">
						<input type="submit" name="SUBMIT" value="削除" id="delete">
					</form>
					<p id="error-add"></p>
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
			<a href="/GandA/CalendarServlet"><button id="back">back</button></a>
		</main>
		<!-- メイン（ここまで） -->
		<!-- フッター（ここから） -->
		<footer> </footer>
		<!-- フッター（ここまで） -->
	</div>
	<!--jsプログラム-->
	<script>
		var queryString = window.location.search;
		var queryObject = new Object();
		var year = 0;
		var month = 0;
		var day = 0;
		var title = [];
		var sub = [];
		var startTimes = [];
		var endTimes = [];
		var titleAll = [];
		var subAll = [];
		var startTimesAll = [];
		var endTimesAll = [];
		var selectStart = document.getElementById("start");
		var selectEnd = document.getElementById("end");
		var selectStartAdd = document.getElementById("start-add");
		var selectEndAdd = document.getElementById("end-add");
		var startTime = setTimeRange(0, 23);
		var endTime = setTimeRange(1, 24);
		var startTimeAdd = setTimeRange(0, 23);
		var endTimeAdd = setTimeRange(1, 24);

		//時刻を表示
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
			} else {
				year = "${dateNow[0]}";
				month = "${dateNow[1]}";
				day = "${dateNow[2]}";
			}

			document.querySelector('#year').value = year;
			document.querySelector('#month').value = month;
			document.querySelector('#day').value = day;
			document.querySelector('#year-add').value = year;
			document.querySelector('#month-add').value = month;
			document.querySelector('#day-add').value = day;
			document.querySelector('#month-add').value = month;
			document.querySelector('#day-add').value = day;

			if (month.slice(0,1) == "0"){
				month = month.slice(1);
			}
			if (day.slice(0,1) == "0"){
				day = day.slice(1);
			}
			//日付表示
			document.querySelector('#register-date').innerHTML = year + "年 " + month + "月" + day + "日";
			document.getElementById("date").value = year + "/" + month + "/" + day;
			document.getElementById("date-add").value = year + "/" + month + "/" + day;

		}

		//スケジュール表示
		function displaySchedule(){
			var schedule = "";
			var count = 0;
			var countAll = 0;
			<c:forEach var="e" items="${cardList}">
				title[count] = "${e.title}";
				sub[count] = "${e.sub}";
				sub[count] = sub[count].replace(/(\^)/g, '\n');
				startTimes[count] = "${e.startTime}".substr(0,2);
				endTimes[count] = "${e.endTime}".substr(0,2);
				schedule += "<input type='text' class='line-title line-title" + count + "' readonly onclick='showAdd(" + startTimes[count] +  "," + endTimes[count] + "," + count + ")'>";
				schedule += "<textarea class='line-sub line-sub" + count + "' readonly onclick='showAdd(" + startTimes[count] +  "," + endTimes[count] + "," + count + ")'></textarea>";
				schedule += "<div class='div-t div-t" + count + "'></div>";
				schedule += "<div class='div-s div-s" + count + "'></div>";
				count++;
			</c:forEach>
			<c:forEach var="e" items="${allMembers}">
				console.log("start");
				titleAll[countAll] = "${e.title}";
				subAll[countAll] = "${e.sub}";
				subAll[countAll] = subAll[countAll].replace(/(\^)/g, '\n');
				startTimesAll[countAll] = "${e.startTime}".substr(0,2);
				endTimesAll[countAll] = "${e.endTime}".substr(0,2);
				schedule += "<input type='text' class='line-title-all line-title-all" + countAll + "' readonly onclick='showAddAll(" + startTimesAll[countAll] +  "," + endTimesAll[countAll] + "," + countAll + ")'>";
				schedule += "<textarea class='line-sub-all line-sub-all" + countAll + "' readonly onclick='showAddAll(" + startTimesAll[countAll] +  "," + endTimesAll[countAll] + "," + countAll + ")'></textarea>";
				schedule += "<div class='div-t-all div-t-all" + countAll + "'></div>";
				schedule += "<div class='div-s-all div-s-all" + countAll + "'></div>";
				countAll++;
			</c:forEach>
			document.getElementById("schedule-add").innerHTML = schedule;

			var positionStart = 0;
			var timeDiff = 0;
			for (var i = 0; i < count; i++) {
				var lineTitle = "line-title" + i;
				var lineSub = "line-sub" + i;
				var div1 = "div-t" + i;
				var div2 = "div-s" + i;

				positionStart = parseInt(startTimes[i]);
				timeDiff = parseInt(endTimes[i]) - parseInt(startTimes[i]) - 1;
				document.getElementsByClassName(div1)[0].style.top = -1370 + (positionStart * 56) +"px";
				document.getElementsByClassName(div1)[0].style.height = "13px";
				document.getElementsByClassName(div1)[0].style.marginBottom = "-15px";
				document.getElementsByClassName(div2)[0].style.top = -1355 + (positionStart * 56) +"px";
				document.getElementsByClassName(div2)[0].style.height = 40 + (timeDiff * 56) + "px";
				document.getElementsByClassName(div2)[0].style.marginBottom = -38 -(timeDiff * 56) + "px";
				document.getElementsByClassName(lineTitle)[0].style.top = -1370 + (positionStart * 56) +"px";
				document.getElementsByClassName(lineTitle)[0].style.height = "23px";
				document.getElementsByClassName(lineTitle)[0].style.marginBottom = "-25px";
				document.getElementsByClassName(lineTitle)[0].value = title[i];
				document.getElementsByClassName(lineSub)[0].style.top = -1345 + (positionStart * 56) +"px";
				document.getElementsByClassName(lineSub)[0].style.height = 24 + (timeDiff * 56) + "px";
				document.getElementsByClassName(lineSub)[0].style.marginBottom = -28 -(timeDiff * 56) + "px";
				document.getElementsByClassName(lineSub)[0].value = sub[i];
			}
			for (var i = 0; i < countAll; i++) {
				var lineTitleAll = "line-title-all" + i;
				var lineSubAll = "line-sub-all" + i;
				var div1All = "div-t-all" + i;
				var div2All = "div-s-all" + i;

				positionStart = parseInt(startTimesAll[i]);
				timeDiff = parseInt(endTimesAll[i]) - parseInt(startTimesAll[i]) - 1;
				document.getElementsByClassName(div1All)[0].style.top = -1370 + (positionStart * 56) +"px";
				document.getElementsByClassName(div1All)[0].style.height = "13px";
				document.getElementsByClassName(div1All)[0].style.marginBottom = "-15px";
				document.getElementsByClassName(div2All)[0].style.top = -1355 + (positionStart * 56) +"px";
				document.getElementsByClassName(div2All)[0].style.height = 40 + (timeDiff * 56) + "px";
				document.getElementsByClassName(div2All)[0].style.marginBottom = -38 -(timeDiff * 56) + "px";
				document.getElementsByClassName(lineTitleAll)[0].style.top = -1370 + (positionStart * 56) +"px";
				document.getElementsByClassName(lineTitleAll)[0].style.height = "23px";
				document.getElementsByClassName(lineTitleAll)[0].style.marginBottom = "-25px";
				document.getElementsByClassName(lineTitleAll)[0].value = titleAll[i];
				document.getElementsByClassName(lineSubAll)[0].style.top = -1345 + (positionStart * 56) +"px";
				document.getElementsByClassName(lineSubAll)[0].style.height = 24 + (timeDiff * 56) + "px";
				document.getElementsByClassName(lineSubAll)[0].style.marginBottom = -28 -(timeDiff * 56) + "px";
				document.getElementsByClassName(lineSubAll)[0].value = subAll[i];
			}
		}

		//時間の範囲設定
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

		//開始時間と終了時間を設定
		document.getElementById("start").innerHTML = startTime;
		document.getElementById("end").innerHTML = endTime;
		document.getElementById("start-add").innerHTML = startTimeAdd;
		document.getElementById("end-add").innerHTML = endTimeAdd;

		//登録、更新フォームは最初非表示
		document.getElementById("space-register").style.display = "none";
		document.getElementById("space-register-add").style.display = "none";

		////登録フォームの切り替え
		function show(time) {
			const show_flag = document.getElementById("space-register");
			const other_flag = document.getElementById("space-register-add");

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
			if (other_flag.style.display == "block") {
				other_flag.style.display = "none";
			}
			document.getElementById('error').textContent = ``;
		}

		//更新フォームの切り替え
		function showAdd(start,end,i) {
			const show_flag = document.getElementById("space-register-add");
			const other_flag = document.getElementById("space-register");

			document.getElementById("judge-check-add").value = "false";
			if (start <= 9) {
				selectStartAdd.value = "0" + start + ":00";
				document.getElementById("old-start").value = "0" + start + ":00";
			} else {
				selectStartAdd.value = start + ":00";
				document.getElementById("old-start").value = start + ":00";
			}
			if (end <= 9) {
				selectEndAdd.value = "0" + end + ":00";
				document.getElementById("old-end").value = end + ":00";
			} else {
				selectEndAdd.value = end + ":00";
				document.getElementById("old-end").value = end + ":00";
			}
			document.getElementById("title-add").value = title[i];
			document.getElementById("sub-add").value = sub[i];

			if (show_flag.style.display == "block") {
				//block(表示)のときnone(非表示)にする
				show_flag.style.display = "none";
			} else {
				//none(非表示)のときblock(表示)にする
				show_flag.style.display = "block";
			}
			if (other_flag.style.display == "block") {
				other_flag.style.display = "none";
			}
			document.getElementById('error-add').textContent = ``;
		}

		//更新フォーム(共有用)
		function showAddAll(start,end,i) {
			const show_flag = document.getElementById("space-register-add");
			const other_flag = document.getElementById("space-register");

			document.getElementById("judge-check-add").value = "true";
			if (start <= 9) {
				selectStartAdd.value = "0" + start + ":00";
				document.getElementById("old-start").value = "0" + start + ":00";
			} else {
				selectStartAdd.value = start + ":00";
				document.getElementById("old-start").value = start + ":00";
			}
			if (end <= 9) {
				selectEndAdd.value = "0" + end + ":00";
				document.getElementById("old-end").value = end + ":00";
			} else {
				selectEndAdd.value = end + ":00";
				document.getElementById("old-end").value = end + ":00";
			}
			document.getElementById("title-add").value = titleAll[i];
			document.getElementById("sub-add").value = subAll[i];

			if (show_flag.style.display == "block") {
				//block(表示)のときnone(非表示)にする
				show_flag.style.display = "none";
			} else {
				//none(非表示)のときblock(表示)にする
				show_flag.style.display = "block";
			}
			if (other_flag.style.display == "block") {
				other_flag.style.display = "none";
			}
			document.getElementById('error-add').textContent = ``;
		}

		//登録の判定
		document.getElementById('space-register').onsubmit = function(event) {
			//event.preventDefault();
			if (document.forms.form1.check.checked == true){
				document.getElementById("judge-check").value = "true";
			} else {
				document.getElementById("judge-check").value = "false";
			}
			var valueStart = document.getElementById("start").value;
			var valueEnd = document.getElementById("end").value;
			if (document.getElementById("title").value == ''){
				document.getElementById("error").textContent = `タイトルがないです`;
				event.preventDefault();
				return;
			}
			if (document.getElementById("start").value >= document.getElementById("end").value){
				document.getElementById("error").textContent = `適切な時間を設定してください`;
				event.preventDefault();
				return;
			}
			var i = 0;
			<c:forEach var="e" items="${cardList}">

				if (valueStart >= "${e.startTime}" && valueStart < "${e.endTime}") {
					//console.log(parseInt(startTimes[i]));
					//console.log(parseInt(endTimes[i]));
					//console.log("-------");
					document.getElementById("error").textContent = `時間が被っています`;
					event.preventDefault();
					return;
				}
				if (valueEnd > "${e.startTime}" && valueEnd <= "${e.endTime}") {
					document.getElementById("error").textContent = `時間が被っています`;
					event.preventDefault();
					return;
				}
				if (valueStart < "${e.startTime}" && valueEnd > "${e.startTime}") {
					document.getElementById("error").textContent = `時間が被っています`;
					event.preventDefault();
					return;
				}
				i++;
			</c:forEach>

			document.getElementById("sub-hide").value = document.getElementById("sub").value.replace(/\r?\n/g, "^");

		};

		//更新の判定
		document.getElementById('update').onclick = function(event) {
			//event.preventDefault();
			var valueStart = document.getElementById("start-add").value;
			var valueEnd = document.getElementById("end-add").value;
			var oldStart = document.getElementById("old-start").value;
			var oldEnd = document.getElementById("old-end").value;

			document.getElementById("sub-hide-add").value = document.getElementById("sub-add").value.replace(/\r?\n/g, "^");

			if (document.getElementById("title-add").value == ''){
				document.getElementById("error-add").textContent = `タイトルがないです`;
				event.preventDefault();
				return;
			}
			if (document.getElementById("start-add").value >= document.getElementById("end-add").value){
				document.getElementById("error-add").textContent = `適切な時間を設定してください`;
				event.preventDefault();
				return;
			}
			<c:forEach var="e" items="${cardList}">
				if (oldStart != "${e.startTime}"){
					if (valueStart >= "${e.startTime}" && valueStart < "${e.endTime}") {
						document.getElementById("error-add").textContent = `時間が被っています`;
						event.preventDefault();
						return;
					}
					if (valueEnd > "${e.startTime}" && valueEnd <= "${e.endTime}") {
						document.getElementById("error-add").textContent = `時間が被っています`;
						event.preventDefault();
						return;
					}
					if (valueStart < "${e.startTime}" && valueEnd > "${e.startTime}") {
						document.getElementById("error-add").textContent = `時間が被っています`;
						event.preventDefault();
						return;
					}
				}
			</c:forEach>
		};
	</script>
</body>

</html>