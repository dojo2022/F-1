<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>カレンダー | G＆A</title>
<link rel="stylesheet" href="/GandA/css/schedule.css">
</head>

<body onload="setScheduleDate(); todayCalendar();">

	<div class="wrapper-calendar">
		<!-- ヘッダー（ここから） -->
		<header>
		 <jsp:include page="/WEB-INF/jsp/header.jsp" flush="true"/>
		</header>
		<!-- ヘッダー（ここまで） -->
		<!-- メイン（ここから） -->
		<main>
			<div class="wrapper">
				<!-- ボタンクリックで月移動 -->
				<div id="next-prev-button">
					<button id="prev" onclick="prev()">‹</button>
					<button id="next" onclick="next()">›</button>
					<!-- xxxx年xx月を表示 -->
					<p id="header-title"></p>
				</div>

				<!-- カレンダー -->
				<div id="calendar"></div>

				<div class="footer-container-calendar">
					<label>日付指定：</label><select id="month" onchange="jump()">
						<option value=0>1月</option>
						<option value=1>2月</option>
						<option value=2>3月</option>
						<option value=3>4月</option>
						<option value=4>5月</option>
						<option value=5>6月</option>
						<option value=6>7月</option>
						<option value=7>8月</option>
						<option value=8>9月</option>
						<option value=9>10月</option>
						<option value=10>11月</option>
						<option value=11>12月</option>
					</select> <select id="year" onchange="jump()"></select>
				</div>
			</div>
		</main>
		<!-- メイン（ここまで） -->
		<!-- フッター（ここから） -->
		<footer onload="today()"> </footer>
		<!-- フッター（ここまで） -->
	</div>
	<!--jsプログラム-->
	<script>
		var dateCount = 0;
		var scheduleYear = [""];
		var scheduleMonth = [""];
		var scheduleDay = [""];
		var selectYear = document.getElementById("year");
		var selectMonth = document.getElementById("month");
		var createYear = generateYearRange(1970, 2200);

		document.getElementById("year").innerHTML = createYear;

		const week = ["日", "月", "火", "水", "木", "金", "土"];
		const today = new Date();
		// 月末だとずれる可能性があるため、1日固定で取得
		var showDate = new Date(today.getFullYear(), today.getMonth(), 1);

		// 初期表示
		function todayCalendar() {
			showProcess(today, calendar);
		}
		// 前の月表示
		function prev() {
			showDate.setMonth(showDate.getMonth() - 1);
			showProcess(showDate);
		}
		// 次の月表示
		function next() {
			showDate.setMonth(showDate.getMonth() + 1);
			showProcess(showDate);
		}
		//指定した月表示
		function jump() {
			showDate.setMonth(parseInt(selectMonth.value));
			showDate.setYear(parseInt(selectYear.value));
			showProcess(showDate);
		}

		//日付指定の年の範囲指定
		function generateYearRange(start, end) {
			var years = "";
			for (var year = start; year <= end; year++) {
				years += "<option value='" + year + "'>" + year + "</option>";
			}
			return years;
		}

		//予定がある日を設定
		function setScheduleDate() {
			dateCount = 0;
			var i = 0;
			<c:forEach var="e" items="${dateList}">
		 	//console.log("${e}");
		 	<c:forEach var="str" items="${fn:split(e,'/')}">
		 		//console.log("${str}");
		 		if (i == 0){
		 			scheduleYear[dateCount]  = "${str}";
		 		}else if (i == 1){
		 			scheduleMonth[dateCount] = "${str}";
		 		}else if (i == 2){
		 			scheduleDay[dateCount]   = "${str}";
		 		}else{
		 			scheduleYear[dateCount]  = "";
		 			scheduleMonth[dateCount] = "";
		 			scheduleDay[dateCount]   = "";
		 		}
		 		i++;
		 	</c:forEach>
		 	i = 0;
			dateCount++;
		 </c:forEach>
		}

		// カレンダー表示
		function showProcess(date) {
			var year = date.getFullYear();
			var month = date.getMonth();
			selectYear.value = year;
			selectMonth.value = month;
			document.querySelector('#header-title').innerHTML = year + "年 " + (month + 1) + "月";

			var calendar = createProcess(year, month);
			document.querySelector('#calendar').innerHTML = calendar;
		}

		// カレンダー作成
		function createProcess(year, month) {
			// 曜日
			var calendar = "<table><tr class='dayOfWeek'>";
			for (var i = 0; i < week.length; i++) {
				calendar += "<th>" + week[i] + "</th>";
			}
			calendar += "</tr>";

			var judgeYear  = parseInt(selectYear.value);
			var judgeMonth = parseInt(selectMonth.value) + 1;

			var count = 0;
			var startDayOfWeek = new Date(year, month, 1).getDay();
			var endDate = new Date(year, month + 1, 0).getDate();
			var lastMonthEndDate = new Date(year, month, 0).getDate();
			var row = Math.ceil((startDayOfWeek + endDate) / week.length);
			// 1行ずつ設定
			for (var i = 0; i < row; i++) {
				calendar += "<tr>";
				// 1colum単位で設定
				for (var j = 0; j < week.length; j++) {
					if (i == 0 && j < startDayOfWeek) {
						// 1行目で1日まで先月の日付を設定
						calendar += "<td class='disabled'>" + (lastMonthEndDate - startDayOfWeek + j + 1) + "</td>";
					} else if (count >= endDate) {
						// 最終行で最終日以降、翌月の日付を設定
						count++;
						calendar += "<td class='disabled'>" + (count - endDate) + "</td>";
					} else {
						// 当月の日付を曜日に照らし合わせて設定
						count++;
						if (year == today.getFullYear()
							&& month == (today.getMonth())
							&& count == today.getDate()) {
							var sendMonth = judgeMonth;
							var sendDay = count;
							if (sendMonth <= 9){
								sendMonth = "0" + sendMonth;
							}
							if (count <= 9){
								sendDay= "0" + count;
							}
							calendar += "<td class='today'><a href='/GandA/ScheduleRegisterServlet?year=" + judgeYear + "&month=" + sendMonth + "&day=" + sendDay + "'>" + count + "</a>";
							for (var k = 0; k < dateCount; k++){
								//console.log(parseInt(scheduleYear[k]));
								//console.log(parseInt(scheduleMonth[k]));
								//console.log(parseInt(scheduleDay[k]));
								//console.log(judgeYear);
								//console.log(judgeMonth);
								//console.log(count);
								if (judgeYear == scheduleYear[k] && judgeMonth == scheduleMonth[k]
									&& count == parseInt(scheduleDay[k])){
									calendar += "<span class='day-schedule'>👤</span>";
									break;
								}
							}
							calendar += "</td>";
						} else {
							var sendMonth = judgeMonth;
							var sendDay = count;
							if (sendMonth <= 9){
								sendMonth = "0" + sendMonth;
							}
							if (count <= 9){
								sendDay= "0" + count;
							}
							calendar += "<td class='other'><a href='/GandA/ScheduleRegisterServlet?year=" + judgeYear + "&month=" + sendMonth + "&day=" + sendDay + "'>" + count + "</a>";
							for (var k = 0; k < dateCount; k++){
								if (judgeYear == scheduleYear[k] && judgeMonth == scheduleMonth[k]
									&& count == parseInt(scheduleDay[k])){
									calendar += "<span class='day-schedule'>👤</span>";
									break;
								}
							}
							calendar += "</td>";
						}
					}
				}
				calendar += "</tr>";
			}
			calendar += "</table>";
			return calendar;
		}
	</script>
</body>

</html>