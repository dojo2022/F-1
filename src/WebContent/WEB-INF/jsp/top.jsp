<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		document.querySelector('#h1').innerHTML = "${todoList[0].date}";
		console.log("${todoList[0].date}");

		document.querySelector('#h2').innerHTML = "${todoList[0].date}";
		console.log("${todoList[0].date}");


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
		var display1 = 0;
		var display2 = 0;
		var today = 0;
		for (i = 0; i < 0; i++){
			if (today <= todoList[i]){

				if (display1 == 0){
					display1 = todoList[i];
				}else if (display2 == 0){
					if (display1 != display2){
						display2 = todoList[i];
					}
				}else{
					if ((display1 > todoList[i]) && (display1 != display2)){
						display1 = todoList[i];
					}else if ((display2 > todoList[i]) && (display1 != display2)){
						display2 = todoList[i];
					}
				}

			}
		}
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