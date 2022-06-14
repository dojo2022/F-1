<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Recipe" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%
    List<Recipe> recipeList = (List<Recipe>)request.getAttribute("recipeList");
%>

<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <title>レシピ検索</title>
    <link rel="stylesheet" type="text/css" href="css/recipe.css">
</head>

<body>
    <div id="wrapper-search-recipe">
        <header>

        </header>

        <main>
            <!-- 検索結果表示 -->
            <div class="list-dish">

                <!-- 料理表示 -->
                <c:forEach var="e" items="${recipeList}" >
	                <div class="dish">
	                    <p class="name-dish">【${e.nameDish}】</p>
	                    <div class="space-detail">
	                        <img src="img/recipe/${e.imageRecipe}" alt="料理の画像" class="image-dish">

	                        <!-- 料理の詳細 -->
	                        <div class="detail-dish">
	                            <h2>Genre</h2>
	                            <p>
	                                ${e.genre}
	                            </p>
	                            <h2>Time</h2>
	                            <p>約${e.timeCooking}分</p>
	                            <h2>Ingredient</h2>
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

            <!-- topへの遷移とbackについて -->
            <div class="transition">
                <a href="#wrapper-search-recipe"><img src="img/recipe/top.png" alt="topへ" id="top" width="40px"
                        height="40px"></a>
                <button id="back"><a href="/GandA/RecipeServlet">back</a></button>
            </div>
        </main>

        <footer>

        </footer>

        <script>
        </script>
    </div>
</body>

</html>