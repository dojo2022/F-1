<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/GandA/css/top.css">
</head>
<body>
	<div class="wrapper_top">
		<header> </header>
		<div id="text_top">
			<div id="text_left">
				<h2>[]</h2>
				<div class="box scroll">
					<span class="first-text"> </span><span class="first-text2"></span>
					<span class="first-text"></span><span class="first-text2"></span>
				</div>
			</div>

			<div id="text_right">
				<h2 id="h2">[]</h2>
				<div class="box scroll">
					<span class="first-text"> </span><span class="first-text2"></span>
					<span class="first-text"></span><span class="first-text2"></span>
				</div>
			</div>
		</div>
		<c:forEach var="e" items="${todoList}">
			<p>${e.date}</p>
		</c:forEach>
	</div>

	<script>
	<c:forEach var="e" items="${todoList}">
		${e.date}
	</c:forEach>
	document.querySelector('#h2').innerHTML = "${todoList[0].date}";
		console.log("${todoList[0].date}");

		//今日が6/15
		6/19
		6/19
		6/18
		6/27
		6/13
		6/15
		6/17

		//今日以降の直近の２日分を変数に入れる
		//配列の中身を全部調べて今日以降で小さい２つを変数に代入
		display1 == 0;
		display2 == 0;
		for (i = 0; i < todoList.length i++){
			if (today =< todoList[i]){

				if (display1 == 0){
					display1 = todoList[i];
				}else if (display2 == 0){
					if (display1 != display2){
						display2 = todoList[i];
					}
				}else{
					if (display1 > todoList[i] && display1 != display2){
						display1 = todoList[i];
					}else if (display2 > todoList[i] && display1 != display2){
						display2 = todoList[i];
					}
				}

			}
		}
	</script>
</body>
</html>