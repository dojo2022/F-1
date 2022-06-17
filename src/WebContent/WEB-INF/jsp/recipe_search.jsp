<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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