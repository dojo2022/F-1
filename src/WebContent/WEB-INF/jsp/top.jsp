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
		<jsp:include page="/WEB-INF/jsp/header.jsp" flush="true"/>
		</header>
		<main>
		<div id="text_top">
			<div id="text_left">
				<!--
				<h2 id="h1"></h2>
				<div class="box scroll">

					<span class="first-text">12:00</span><span class="first-text2"><a class="modal-open">打合せ</a></span>
					<span class="first-text"></span><span class="first-text2"></span>

				</div>
				-->
			</div>
			<div id="text_right">
				<!--
				<h2 id="h2"></h2>
				<div class="box scroll">
					<span class="first-text"> </span><span class="first-text2"></span>
					<span class="first-text"></span><span class="first-text2"></span>
				</div>
				-->
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
		</main>>
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
		var schedule = [<%= todoList.size() %>];
		//取得した日付（文字列）を数値に変換
		<% int i; %>
		<% for(i = 0; i < todoList.size(); i++){ %>
			schedule[<%= i %>] = new Array(5);
			//日付
			schedule[<%= i %>][0] = "<%= todoList.get(i).getDate() %>";
			//内容
			schedule[<%= i %>][1] = "<%= todoList.get(i).getSub() %>";
			//タイトル
			schedule[<%= i %>][2] = "<%= todoList.get(i).getTitle() %>";
			//
			schedule[<%= i %>][3] = "<%= todoList.get(i).getStartTime() %>";
			//
			schedule[<%= i %>][4] = "<%= todoList.get(i).getEndTime() %>";

		<% } %>

		var display1 = "直近のスケジュールがありません";
		var display2 = "直近のスケジュールがありません";
		var i,j;
		var size = <%= todoList.size() %>;

		//直近のスケジュール検索
		if(size >= 1){
			display1 = "<h2 id=\"h1\">" + (schedule[0][0].replace(/(\/0{1})/g, '/')) + "</h2><div class=\"box scroll\">";
			display1 +=
				"<span class=\"first-text\">" + schedule[0][3] + "</span><span class=\"first-text2\"><a class=\"modal-open\">" + schedule[0][2] + "</a></span>";
			for(i = 1; i < size; i++){
				if(schedule[0][0] != schedule[i][0]){
					break;
				}
				display1 +=
				"<span class=\"first-text\">" + schedule[i][3] + "</span><span class=\"first-text2\"><a class=\"modal-open\">" + schedule[i][2] + "</a></span>";
			}
			display1 += "</div>";

			if(i < size){
				display2 ="<h2 id=\"h2\">" + schedule[0][0] + "</h2><div class=\"box scroll\">";
				display2 +=
					"<span class=\"first-text\">" + schedule[i][3] + "</span><span class=\"first-text2\"><a class=\"modal-open\">" + schedule[i][2] + "</a></span>";
				i += 1;
				for(j = i + 1; j < size; j++){
					if(schedule[i][0] != schedule[j][0]){
						break;
					}
					display2 +=
					"<span class=\"first-text\">" + schedule[i][3] + "</span><span class=\"first-text2\"><a class=\"modal-open\">" + schedule[i][2] + "</a></span>";
				}
				display2 += "</div>";
			}

		}
		document.querySelector('#text_left').innerHTML = display1;
		document.querySelector('#text_right').innerHTML = display2;


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