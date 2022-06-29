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
    <title>レシピ検索結果 | G＆A</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/recipe.css">
    <link rel="shortcut icon" href="/GandA/img/other/favicon.ico">
</head>

<body>
    <div id="wrapper-search-recipe">
        <!-- ヘッダー部分  -->
        <header>
            <jsp:include page="/WEB-INF/jsp/menu.jsp" flush="true"/>
        </header>

        <main>
            <!-- 検索結果表示-->
            <div id="list-dish">

                <!-- 料理表示 -->
                <c:forEach var="e" items="${recipeList}" >
	                <div class="dish">
	                    <h2 class="name-dish"><a href="${e.link}" target="_blank" rel="noopener noreferrer">【${e.nameDish}】</a></h2>
	                    <div class="space-detail">
	                        <a href="${e.link}" target="_blank" rel="noopener noreferrer"><img src="${e.imageRecipe}" alt="料理の画像" class="image-dish"></a>

	                        <!-- 料理の詳細 -->
	                        <div class="detail-dish">
	                            <h3>Comment</h3>
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
        </div>
        <script>
            if(<%= recipeList.get(0).getNameDish().equals("not found") %>){
                document.getElementById("list-dish").innerHTML = "<div id=\"not-found\"><p>該当するレシピがありませんでした</p><img src=\"img/recipe/dogeza.png\" alt=\"土下座の画像\" id=\"not-found-image\"></div>";
            }
        </script>
</body>

</html>