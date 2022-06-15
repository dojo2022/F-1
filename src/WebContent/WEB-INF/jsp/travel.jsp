<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="/GandA/css/travel.css">
</head>



<body>
    <div class="wrapper-travel">
        <header>

        </header>

        <main>
            <h1 id="title-travel">【${travelList[0].site_place}】</h1>
            <div class="flex-travel">

                <!--おすすめ旅行先の説明-->
                <div id="text-pickup">

                    <h2 id="picmenu-food">≪food≫</h2>
                      <p id="explain-food">${travelList[0].site_food}</p>
                    <h2 id="picmenu-spot">≪spot≫</h2>
                      <p id="explain-spot">${travelList[0].site_spot}</p>
                    <h2 id="picmenu-hotel">≪hotel≫</h2>
                      <p id="explain-hotel">${travelList[0].site_hotel}</p>
                    <h2 id="picmenu-budget">≪budget≫</h2>
                      <p id="explain-budget">${travelList[0].site_budget}</p>
                    <h2 id="picmenu-location">≪location≫</h2>
                      <p id="explain-location">${travelList[0].site_location}</p>
                </div>

                <!--旅行先写真 -->
                <div id="picture-travel">
                    <img src="img/travel/${travelList[0].siteLocation}" alt="image-spot">


                    <!--旅行先の季節アイコン-->
                    <div class="icon-season">
                      <h1 id="title-season">Season: </h1>

                      <c:choose>
                      <c:when test="${travelList[0].siteMonth >= 1} && ${travelList[0].siteMonth <= 4}">
                      <div id="season-spring"><img src="img/travel/spring.png" alt="icon-spring"></div>
                      </c:when>
                      <c:when test="${travelList[0].siteMonth >= 5} && ${travelList[0].siteMonth <= 7}">
                      <div id="season-summer"><img src="img/travel/summer.png" alt="icon-summer"></div>
                      </c:when>
                      <c:when test="${travelList[0].siteMonth >= 8} && ${travelList[0].siteMonth <= 10}">
                      <div id="season-autumn"><img src="img/travel/autumn.png" alt="icon-autumn"></div>
                      </c:when>
                      <c:when test="${travelList[0].siteMonth >= 11} && ${travelList[0].siteMonth <= 12}">
                      <div id="season-winter"><img src="img/travel/winter.png" alt="icon-winter"></div>
                      </c:when>
                      </c:choose>
                   </div>
                </div>
            </div>
        </main>

        <footer>
        </footer>

    </div>
</body>

</html>