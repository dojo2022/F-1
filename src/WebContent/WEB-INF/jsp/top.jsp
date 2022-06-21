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
		<div id="text_top">
			<div id="text_left">
				<h2 id="h1">aaa</h2>
				<div class="box scroll">
					<span class="first-text">12:00</span><span class="first-text2"><a
						class="modal-open">打合せ</a></span> <span class="first-text"></span><span
						class="first-text2"></span>
				</div>
			</div>
			<div id="text_right">
				<h2 id="h2"></h2>
				<div class="box scroll">
					<span class="first-text"> </span><span class="first-text2"></span>
					<span class="first-text"></span><span class="first-text2"></span>
				</div>
			</div>
		</div>
		<div class="modal-container">
			<div class="modal-body">
				<div class="modal-close"></div>
				<div class="modal-content">
					<p>ここに要素を書く</p>
				</div>
			</div>
		</div>
	</div>

	<c:forEach var="e" items="${todoList}">
		<p>${e.date}</p>
	</c:forEach>

	<script>
		//document.querySelector('#h1').innerHTML = "${todoList[0].date}";
		//console.log("${todoList[0].date}");

		//document.querySelector('#h2').innerHTML = "${todoList[1].date}";
		//console.log("${todoList[0].date}");


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
		var date = [<%= todoList.size() %>];
		//取得した日付（文字列）を数値に変換
		<% int i,j; %>
		<% for(i = 0; i < todoList.size(); i++){ %>
			date[<%= i %>] = new Array(3);
			//year
			date[<%= i %>][0] = <%= Integer.parseInt(todoList.get(i).getDate().substring(0, 4)) %>;
			//month
			date[<%= i %>][1] = <%= Integer.parseInt(todoList.get(i).getDate().substring(5, 7)) %>;
			//day
			date[<%= i %>][2] = <%= Integer.parseInt(todoList.get(i).getDate().substring(8)) %>;

		<% } %>

		var display1 = new Array(5).fill(0);
		var display2 = [5];
		var today = new Date();
		var schedule_date;
		var i,j,count;
		var size = <%= todoList.size() %>;

		//直近のスケジュール検索
		<% i = 0; %>
		for (i = 0; i < size; i++){
			schedule_date = date[i][0] * 10000 + date[i][1] * 100 + date[i][2];
			if (today <= schedule_date){
				display1[0] = "<%= todoList.get(i).getDate() %>";
				break;
			}
			<% i++; %>
		}


		display1[1] = "<%= todoList.get(i-1).getSub() %>";
		display1[2] = "<%= todoList.get(i-1).getTitle() %>";
		display1[3] = "<%= todoList.get(i-1).getStartTime() %>";
		display1[4] = "<%= todoList.get(i-1).getEndTime() %>";
		document.querySelector('#h1').innerHTML = display1[0];


		display2[0] = "<%= todoList.get(i).getDate() %>";
		display2[1] = "<%= todoList.get(i).getSub() %>";
		display2[2] = "<%= todoList.get(i).getTitle() %>";
		display2[3] = "<%= todoList.get(i).getStartTime() %>";
		display2[4] = "<%= todoList.get(i).getEndTime() %>";
		document.querySelector('#h2').innerHTML = display2[0];



		$(function(){
			  // 変数に要素を入れる
			  var open = $('.modal-open'),
			    close = $('.modal-close'),
			    container = $('.modal-container');
			  //開くボタンをクリックしたらモーダルを表示する
			  open.on('click',function(){
			    container.addClass('active');
			    return false;
			  });
			  //閉じるボタンをクリックしたらモーダルを閉じる
			  close.on('click',function(){
			    container.removeClass('active');
			  });
			  //モーダルの外側をクリックしたらモーダルを閉じる
			  $(document).on('click',function(e) {
			    if(!$(e.target).closest('.modal-body').length) {
			      container.removeClass('active');
			    }
			  });
			});
	</script>
</body>
</html>