<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Recipe" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import = "java.util.List" %>
<%
	List<Recipe> recipeList = (List<Recipe>)request.getAttribute("recipeList");
%>

<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <title>レシピ検索</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/recipe.css">

</head>

<body>
    <div id="wrapper-search-recipe">


    <!-- ヘッダー部分  -->
    <div class="wrapper-header">
        <header id="header" class="header">
            <div class="images-icon">

                <!--メインアイコン-->
                <div><a href="/GandA/TopServlet"><img src="img/other/icon_main.png" alt="G&Alogo" id="icon-main"></a></div>
                <!--名前、時間-->
                <div class="text-header">
                    Name:
                        <div id="text-username">${name}</div>

                    Time:
                        <div id="text-time"></div>

                </div>
                <!--ログアウトアイコン-->
                <div id="box-logout"><a href="/GandA/LogoutServlet"><img src="img/other/icon_logout.png" alt="logoutlogo" id="icon-logout"></a>
                </div>

            </div>
        </header>

        <main>
            <!-- 検索結果表示 -->
            <div id="list-dish">

                <!-- 料理表示 -->
                <c:forEach var="e" items="${recipeList}" >
	                <div class="dish">
	                    <h2 class="name-dish"><a href="${e.link}">【${e.nameDish}】</a></h2>
	                    <div class="space-detail">
	                        <a href="${e.link}"><img src="${e.imageRecipe}" alt="料理の画像" class="image-dish"></a>

	                        <!-- 料理の詳細 -->
	                        <div class="detail-dish">
	                            <h3>Genre</h3>
	                            <p>
	                                ${e.genre}
	                            </p>
	                            <h3>Time</h3>
	                            <p>${e.timeCooking}</p>
	                            <h3>Ingredient</h3>
	                            <p>
	                                ${e.ingredient}
	                            </p>
	                        </div>
	                    </div>

	                    <!-- 料理の説明 -->
	                    <div class="explain">
	                        <p>${e.subRecipe}</p>
	                    </div>
	                </div>
				</c:forEach>
            </div>

            <!-- topへの遷移ボタンとbackボタン -->
            <div class="transition">
                <a href="#wrapper-search-recipe"><img src="img/recipe/top.png" alt="topへ" id="top" width="40px"
                        height="40px"></a>
                <button id="back"><a href="/GandA/RecipeServlet">back</a></button>
            </div>
        </main>

        <footer>

        </footer>

        <script>
            if(<%= recipeList.get(0).getNameDish().equals("not found") %>){
                document.getElementById("list-dish").innerHTML = "<div id=\"not-found\"><p>該当するレシピがありませんでした</p><img src=\"img/recipe/dogeza.png\" alt=\"土下座の画像\" id=\"not-found-image\"></div>";
            }


            //現在時刻表示
            'use strict';

            window.onload = function() {
            const now = new Date();
            const year = now.getFullYear();
            const month = now.getMonth();
            const date = now.getDate();
            var hour = now.getHours();
            var min = now.getMinutes();

            if (hour < 10) {
                hour = "0" + hour;
            }
            if (min < 10) {
                min = "0" + min;
            }

            const output = year + "/" + (month + 1) + "/" + date + "   " + hour + ":" + min;
            document.getElementById("text-time").textContent = output;

            }


            //ここからスクロールの表示非表示処理



           window.addEventListener("scroll", () => {
            onScroll();
           });

            // ヘッダーを取得
            const header = document.getElementById("header");
            // ヘッダーの高さを取得
            const hH = header.clientHeight;
            // 現在地を示す変数を定義
            let pos = 0;
            // スクロール直前の位置を示す変数を定義
            let lastPos = 0;


            const onScroll = () => {
                // スクロール位置がヘッダーの高さ分より大きい場合にclass名を追加し、そうでない場合にclass名を削除
                if (pos > hH && pos > lastPos) {
                    header.classList.add('header--unpinned');
                }
                if (pos < hH || pos < lastPos) {
                    header.classList.remove('header--unpinned');
                }


                // 最後のスクロール位置を保存
                lastPos = pos;
                console.log("てすと");
            };

            window.addEventListener("scroll", () => {
                // スクロールするごとにpos（現在地）の値を更新
                pos = window.scrollY;
                onScroll();

            }
            );

        </script>

  </div>



    </div>
</body>

</html>