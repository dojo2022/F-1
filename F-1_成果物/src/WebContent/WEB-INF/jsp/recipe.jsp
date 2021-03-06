<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <title>献立 | G＆A</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/recipe.css">
    <link rel="shortcut icon" href="/GandA/img/other/favicon.ico">
</head>

<body>
    <div id="wrapper-recipe">
        <header>
        	<jsp:include page="/WEB-INF/jsp/header.jsp" flush="true"/>
        </header>

        <main>
            <!-- おすすめ料理表示 -->
            <div class="pick-menu">
                <h1>【今日の献立】</h1>
                <div class="pick">
                    <c:forEach var="e" items="${pickMenu}" >
                        <div class="space-detail">
                            <a href="https://recipe.rakuten.co.jp/${e.link}" target="_blank" rel="noopener noreferrer"><img src="${e.imageRecipe}" alt="料理の画像" class="image-pick"></a>
                            <h2><a href="https://recipe.rakuten.co.jp/${e.link}" target="_blank" rel="noopener noreferrer">【${e.nameDish}】</a></h2>
                        </div>
                    </c:forEach>
                </div>
            </div>


            <div class="form-search-show">
                <!-- 検索項目表示ボタン -->
                <button type="button" id="form-search" onclick="show()"><img src="img/recipe/search.png" alt="" height="30px" width="30px"></button>

                <!-- 検索フォーム -->
                <div id="space-search">
                    <form method="POST" action="/GandA/RecipeSearchServlet">
                    	<div id="key-word">
                    		<label>Key Word<input type="text" size="15" class="key"></label>
                    	</div>
                    	<input type="hidden" id="key-union" name="KEY" value="">

                        <!-- <label>Genre<span id="balloon-pop-genre">ジャンル</span><input type="text" size="15" name="GENRE" id="genre"></label> -->
                        <!-- <label>Ingredient<span id="balloon-pop-ingredient">具材</span><input type="text" size="15" name="INGREDIENT" id="ingredient"></label> -->
                        <label>Time<br>
                        <!-- <span id="balloon-pop-time">調理時間</span> -->
                        	<select name="TIMECOOKING" id="time-cooking">
                                <option value = "0">指定なし</option>
                                <option value = "1">5分以内</option>
                                <option value = "2">約10分</option>
                                <option value = "3">約15分</option>
                                <option value = "4">約30分</option>
                            </select>
                        </label>

                        <button type="button" id="add" onclick="key_add()">add</button>
                        <input type="submit" value="search" id="search" onclick="union()">
                    </form>
                </div>
            </div>
        </main>

        <script>
            //検索フォームは最初非表示
            document.getElementById("space-search").style.display = "none";
            //検索欄表示用のボタンが押された時の処理
            function show() {
                const show_flag = document.getElementById("space-search");

                if (show_flag.style.display == "block") {
                    //block(表示)のときnone(非表示)にする
                    show_flag.style.display = "none";
                } else {
                    //none(非表示)のときblock(表示)にする
                    show_flag.style.display = "block";
                }
            }

            let count = 0;
            function key_add(){
            	count += 1;
            	let item = document.createElement('label');
            	item.innerHTML = "Key Word<input type=\"text\" size=\"15\" class=\"key\">";
            	document.querySelector('#key-word').appendChild(item);
            }

            function union(){
            	let keyword = document.getElementsByClassName("key")[0].value;
            	//let keyword_list = document.getElementsByClassName("key");
            	//let keyword = keyword_list.item(0).value;
            	keyword += " ";
            	for(let i = 0; i < count; i++){
            		keyword += document.getElementsByClassName("key")[i + 1].value;
            		keyword += " ";
            	}
            	document.querySelector('#key-union').value = keyword;
            }
        </script>

        <footer>
        </footer>
    </div>
</body>

</html>