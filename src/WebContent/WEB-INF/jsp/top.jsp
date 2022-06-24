<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="model.Schedule" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import = "java.util.List" %>
<%
	List<Schedule> todoList = (List<Schedule>)request.getAttribute("todoList");
%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/top.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
	<div class="wrapper_top">
		<header>
			<jsp:include page="/WEB-INF/jsp/header.jsp" flush="true" />
		</header>
		<main>
			<div id="text_top">
				<div id="text_left">

				</div>
				<div id="text_right">

				</div>
			</div>
			<div class="modal-container">
				<div class="modal-body">
					<div class="modal-close"></div>
					<div class="modal-content">
						<form method="POST" action="/GandA/TopServlet" id="form">
							<input type="hidden" name="DATE" id="date">
							<p id="date-show"></p>
							<label>タイトル<br><input type="text" name="TITLE" id="title"></label><br>
							<label>内容<br><input type="text" name="SUB" id="sub"></label><br>
							<input type="hidden" name="STARTTIMEOLD" id="start-time-old">
							<select name="STARTTIME" id="start-time">
								<option hidden value="0"></option>
								<option value="00:00">00:00</option>
								<!-- <option value="00:30">00:30</option> -->
								<option value="01:00">01:00</option>
								<!-- <option value="01:30">01:30</option> -->
								<option value="02:00">02:00</option>
								<!-- <option value="02:30">02:30</option> -->
								<option value="03:00">03:00</option>
								<!-- <option value="03:30">03:30</option> -->
								<option value="04:00">04:00</option>
								<!-- <option value="04:30">04:30</option> -->
								<option value="05:00">05:00</option>
								<!-- <option value="05:30">05:30</option> -->
								<option value="06:00">06:00</option>
								<!-- <option value="06:30">06:30</option> -->
								<option value="07:00">07:00</option>
								<!-- <option value="07:30">07:30</option> -->
								<option value="08:00">08:00</option>
								<!-- <option value="08:30">08:30</option> -->
								<option value="09:00">09:00</option>
								<!-- <option value="09:30">09:30</option> -->
								<option value="10:00">10:00</option>
								<!-- <option value="10:30">10:30</option> -->
								<option value="11:00">11:00</option>
								<!-- <option value="11:30">11:30</option> -->
								<option value="12:00">12:00</option>
								<!-- <option value="12:30">12:30</option> -->
								<option value="13:00">13:00</option>
								<!-- <option value="13:30">13:30</option> -->
								<option value="14:00">14:00</option>
								<!-- <option value="14:30">14:30</option> -->
								<option value="15:00">15:00</option>
								<!-- <option value="15:30">15:30</option> -->
								<option value="16:00">16:00</option>
								<!-- <option value="16:30">16:30</option> -->
								<option value="17:00">17:00</option>
								<!-- <option value="17:30">17:30</option> -->
								<option value="18:00">18:00</option>
								<!-- <option value="18:30">18:30</option> -->
								<option value="19:00">19:00</option>
								<!-- <option value="19:30">19:30</option> -->
								<option value="20:00">20:00</option>
								<!-- <option value="20:30">20:30</option> -->
								<option value="21:00">21:00</option>
								<!-- <option value="21:30">21:30</option> -->
								<option value="22:00">22:00</option>
								<!-- <option value="22:30">22:30</option> -->
								<option value="23:00">23:00</option>
								<!-- <option value="23:30">23:30</option> -->
							</select>
							<span>～</span>
							<select name="ENDTIME" id="end-time">
								<option hidden value="0"></option>
								<!-- <option value="00:30">00:30</option> -->
								<option value="01:00">01:00</option>
								<!-- <option value="01:30">01:30</option> -->
								<option value="02:00">02:00</option>
								<!-- <option value="02:30">02:30</option> -->
								<option value="03:00">03:00</option>
								<!-- <option value="03:30">03:30</option> -->
								<option value="04:00">04:00</option>
								<!-- <option value="04:30">04:30</option> -->
								<option value="05:00">05:00</option>
								<!-- <option value="05:30">05:30</option> -->
								<option value="06:00">06:00</option>
								<!-- <option value="06:30">06:30</option> -->
								<option value="07:00">07:00</option>
								<!-- <option value="07:30">07:30</option> -->
								<option value="08:00">08:00</option>
								<!-- <option value="08:30">08:30</option> -->
								<option value="09:00">09:00</option>
								<!-- <option value="09:30">09:30</option> -->
								<option value="10:00">10:00</option>
								<!-- <option value="10:30">10:30</option> -->
								<option value="11:00">11:00</option>
								<!-- <option value="11:30">11:30</option> -->
								<option value="12:00">12:00</option>
								<!-- <option value="12:30">12:30</option> -->
								<option value="13:00">13:00</option>
								<!-- <option value="13:30">13:30</option> -->
								<option value="14:00">14:00</option>
								<!-- <option value="14:30">14:30</option> -->
								<option value="15:00">15:00</option>
								<!-- <option value="15:30">15:30</option> -->
								<option value="16:00">16:00</option>
								<!-- <option value="16:30">16:30</option> -->
								<option value="17:00">17:00</option>
								<!-- <option value="17:30">17:30</option> -->
								<option value="18:00">18:00</option>
								<!-- <option value="18:30">18:30</option> -->
								<option value="19:00">19:00</option>
								<!-- <option value="19:30">19:30</option> -->
								<option value="20:00">20:00</option>
								<!-- <option value="20:30">20:30</option> -->
								<option value="21:00">21:00</option>
								<!-- <option value="21:30">21:30</option> -->
								<option value="22:00">22:00</option>
								<!-- <option value="22:30">22:30</option> -->
								<option value="23:00">23:00</option>
								<!-- <option value="23:30">23:30</option> -->
								<option value="24:00">24:00</option>
							</select><br>
							<p id="update-check"></p>
							<input type="submit" value="削除"id="delete" name="SUBMIT">
							<input type="submit" value="更新" id="update" name="SUBMIT">
						</form>
					</div>
				</div>
			</div>
		</main>
	</div>

	<script>

		//今日が6/15
		//6/19
		//6/19
		//6/18
		//6/27
		//6/13
		//6/15
		//6/17

		//今日以降の直近の２日分を変数に入れる
		//配列の中身を全部調べて今日以降で小さい２つを変数に代入
		var schedule = [<%= todoList.size() %>];
		//取得した日付（文字列）を数値に変換
		<% int i; %>
		<% for (i = 0; i < todoList.size(); i++) { %>
			schedule[<%= i %>] = new Array(5);
			//日付
			schedule[<%= i %>][0] = "<%= todoList.get(i).getDate() %>";
			//内容
			schedule[<%= i %>][1] = "<%= todoList.get(i).getSub() %>";
			//タイトル
			schedule[<%= i %>][2] = "<%= todoList.get(i).getTitle() %>";
			//開始時間
			schedule[<%= i %>][3] = "<%= todoList.get(i).getStartTime() %>";
			//終了時間
			schedule[<%= i %>][4] = "<%= todoList.get(i).getEndTime() %>";

		<% } %>

		var display1 = "直近のスケジュールがありません";
		var display2 = "直近のスケジュールがありません";
		var i, j;
		var size = <%= todoList.size() %>;

		//直近のスケジュール検索
		if (size >= 1) {
			display1 = "<h2 id=\"h1\">" + (schedule[0][0].replace(/(\/0{1})/g, '/')) + "</h2><div class=\"box scroll\">";
			display1 +=
				"<span class=\"first-text\">" + schedule[0][3] + "</span><span class=\"first-text2\"><button class=\"modal-open\" value=\"0\">" + schedule[0][2] + "</button></span>";
			for (i = 1; i < size; i++) {
				if (schedule[0][0] != schedule[i][0]) {
					break;
				}
				display1 +=
					"<span class=\"first-text\">" + schedule[i][3] + "</span><span class=\"first-text2\"><button class=\"modal-open\" value=\"" + i + "\">" + schedule[i][2] + "</button></span>";
			}
			display1 += "</div>";

			if (i < size) {
				display2 = "<h2 id=\"h2\">" + (schedule[i][0].replace(/(\/0{1})/g, '/')) + "</h2><div class=\"box scroll\">";
				display2 +=
					"<span class=\"first-text\">" + schedule[i][3] + "</span><span class=\"first-text2\"><button class=\"modal-open\" value=\"" + i + "\">" + schedule[i][2] + "</button></span>";
				i += 1;
				for (j = i + 1; j < size; j++) {
					if (schedule[i][0] != schedule[j][0]) {
						break;
					}
					display2 +=
						"<span class=\"first-text\">" + schedule[i][3] + "</span><span class=\"first-text2\"><button class=\"modal-open\" value=\"" + i + "\">" + schedule[i][2] + "</button></span>";
				}
				display2 += "</div>";
			}

		}
		document.querySelector('#text_left').innerHTML = display1;
		document.querySelector('#text_right').innerHTML = display2;

		var index = -1;

		$(function () {
			// 変数に要素を入れる
			var open = $('.modal-open'),
				close = $('.modal-close'),
				container = $('.modal-container'),
				clear = $('#clear');
			//開くボタンをクリックしたらモーダルを表示する
			open.on('click', function () {
				container.addClass('active');

				//フォーム内のinput、selectのvalueに初期値格納
				index = event.target.value;
				document.querySelector('#date').value = schedule[index][0];
				document.querySelector('#date-show').textContent = (schedule[index][0].replace(/(\/0{1})/g, '/'))
				document.querySelector('#title').value = schedule[index][2];
				document.querySelector('#sub').value = schedule[index][1];
				document.querySelector('#start-time-old').value = schedule[index][3];

				document.querySelector('#start-time').options[0].value = schedule[index][3];
				document.querySelector('#end-time').options[0].value = schedule[index][4];
				document.querySelector('#start-time').options[0].textContent = schedule[index][3];
				document.querySelector('#end-time').options[0].textContent = schedule[index][4];

				//optionの位置を0番目に設定
				document.querySelector('#start-time').value = schedule[index][3];
				document.querySelector('#end-time').value= schedule[index][4];

				return false;
			});
			//閉じるボタンをクリックしたらモーダルを閉じる
			close.on('click', function () {
				container.removeClass('active');
			});
			//モーダルの外側をクリックしたらモーダルを閉じる
			$(document).on('click', function (e) {
				if (!$(e.target).closest('.modal-body').length) {
					container.removeClass('active');

				}
			});

			//フォームの内容をクリアする
			clear.on('click', function () {
				document.querySelector('#title').value = "";
				document.querySelector('#sub').value = "";
				document.querySelector('#start-time').options[0].textContent = "";
				document.querySelector('#end-time').options[0].textContent = "";
				document.querySelector('#start-time').value = "0";
				document.querySelector('#start-time').value = "0";
			});

			if("${result}" == "更新失敗！" || "${result}" == "削除失敗！"){
				alert("${result}");
			}
		});

		document.getElementById('update').onsubmit = function(event){
            const update_array = [document.getElementById('form').TITLE.value, document.getElementById('form').SUB.value,
            					   document.getElementById('form').STARTTIME.value, document.getElementById('form').ENDTIME.value];

            if(document.querySelector('#start-time').value >= document.querySelector('#end-time').value){
            	alert("開始時間を終了時間よりも前の時間にしてください");
            	return false;
			}

            var i;

            for(i = 0; i < size; i++){
            	if(i == index){
            		continue;
            	}

            	if(document.getElementById('form').DATE.value == schedule[i][0]){
            		if(document.getElementById('form').STARTTIME.value >= schedule[i][3] && document.getElementById('form').STARTTIME.value < schedule[i][4]){
            			alert("予定がかぶっています");
            			return false;
            		}else if(document.getElementById('form').ENDTIME.value > schedule[i][3] && document.getElementById('form').ENDTIME.value <= schedule[i][4]){
            			alert("予定がかぶっています");
            			return false;
            		}else if(document.getElementById('form').STARTTIME.value <= schedule[i][3] && document.getElementById('form').ENDTIME.value >= schedule[i][4]){
            			alert("予定がかぶっています");
            			return false;
            		}
            	}
            }

            if(update_array[0] != "" && update_array[2] != "" && update_array[3] != ""){
            	return true;
            }

            alert("タイトルを入力、開始時間、終了時間を選択してください");
            return false;
        };
	</script>
</body>

</html>