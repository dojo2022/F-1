<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <title>レシピ</title>
    <link rel="stylesheet" type="text/css" href="css/recipe.css">
</head>

<body>
    <div id="wrapper-recipe">
        <header>

        </header>

        <main>
            <!-- おすすめ料理表示 -->
            <div class="pick">
                <h1>【<%= recipeList.get(0).getNameDish() %>】</h1>
                <div class="space-detail">
                    <img src="C:\dojo6\src\WebContent\img\recipe/R.jpg" alt="料理の画像" id="image-pick">

                    <!-- 料理の詳細 -->
                    <div class="detail-pick">
                        <h2>Genre</h2>
                        <p><%= recipeList.get(0).getGenre() %></p>
                        <h2>Time</h2>
                        <p>約<%= recipeList.get(0).getTimeCooking() %>分</p>
                        <h2>Ingredient</h2>
                       	<p><%= recipeList.get(0).getIngredient() %></p>
                    </div>
                </div>

                <!-- 料理の説明 -->
                <div class="explain-pick">
                    <p><%= recipeList.get(0).getSubRecipe() %></p>
                </div>
            </div>


            <div class="form-search-show">
                <!-- 検索項目表示ボタン -->
                <button type="button" id="form-search" onclick="show()"><img src="c:/dojo6/src/WebContent/img/画像3.png" alt="" height="30px"
                        width="40px"></button>

                <!-- 検索フォーム -->
                <div id="space-search">
                    <form action="search-recipe.html">
                        <label>Name<span id="balloon-pop-name">料理名</span><input type="text" size="15" id="name"></label>
                        <label>Genre<br><span id="balloon-pop-genre">ジャンル</span><select id="genre">
                                <option></option>
                                <option>和食</option>
                                <option>洋食</option>
                            </select></label>
                        <label>Ingredient<span id="balloon-pop-ingredient">具材</span><input type="text" size="15"
                                id="ingredient"></label>
                        <label>Time<br><span id="balloon-pop-time">調理時間</span><select id="time-cooking">
                                <option></option>
                                <option>30分</option>
                                <option>1時間</option>
                            </select></label>
                        <input type="submit" value="search" id="search">
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
        </script>

        <footer>
        </footer>
    </div>
</body>

</html>