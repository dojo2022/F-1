<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>旅行先｜G&A</title>
    <link rel="stylesheet" href="/GandA/css/travel.css">
    <link rel="shortcut icon" href="/GandA/img/other/favicon.ico">
</head>



<body>


<script>
	console.log("${travelList.get(0).sitePlace}");
</script>

    <div class="wrapper-travel">
        <header>
       <jsp:include page="/WEB-INF/jsp/header.jsp" flush="true"/>
        </header>

        <main>
            <h1 id="title-travel">【 ${travelList.get(0).sitePlace} 】</h1>
            <div class="flex-travel">

                <!--おすすめ旅行先の説明 -->
                <div id="text-pickup">

                    <h2 id="picmenu-food">≪food≫</h2>
                      <p id="explain-food">${travelList.get(0).siteFood}</p>
                    <h2 id="picmenu-spot">≪spot≫</h2>
                      <p id="explain-spot">${travelList.get(0).siteSpot}</p>
                    <h2 id="picmenu-hotel">≪hotel≫</h2>
                      <p id="explain-hotel">${travelList.get(0).siteHotel}</p>
                    <h2 id="picmenu-budget">≪budget≫</h2>
                      <p id="explain-budget">${travelList.get(0).siteBudget}</p>
                    <h2 id="picmenu-location">≪location≫</h2>
                      <p id="explain-location">${travelList.get(0).siteLocation}</p>
                </div>

                <!--旅行先写真 -->
                <div id="picture-travel">
                    <img src="img/travel/${travelList.get(0).siteImage}" alt="image-spot">



                    <!--旅行先の季節アイコン-->
                    <div class="icon-season">
                      <h1 id="title-season">Season: </h1>

                      <c:choose>
                      <c:when test="${travelList.get(0).siteMonth <= 4}">
                      <div id="season-spring"><img src="img/travel/spring.png" alt="icon-spring"></div>
                      </c:when>

                      <c:when test="${travelList.get(0).siteMonth == 5}">
                      <div id="season-summer"><img src="img/travel/summer.png" alt="icon-summer"></div>
                      </c:when>
                      <c:when test="${travelList.get(0).siteMonth == 6}">
                      <div id="season-summer"><img src="img/travel/summer.png" alt="icon-summer"></div>
                      </c:when>
                      <c:when test="${travelList.get(0).siteMonth == 7}">
                      <div id="season-summer"><img src="img/travel/summer.png" alt="icon-summer"></div>
                      </c:when>

                      <c:when test="${travelList.get(0).siteMonth == 8}">
                      <div id="season-autumn"><img src="img/travel/autumn.png" alt="icon-autumn"></div>
                      </c:when>
                      <c:when test="${travelList.get(0).siteMonth == 9}">
                      <div id="season-autumn"><img src="img/travel/autumn.png" alt="icon-autumn"></div>
                      </c:when>
                      <c:when test="${travelList.get(0).siteMonth == 10}">
                      <div id="season-autumn"><img src="img/travel/autumn.png" alt="icon-autumn"></div>
                      </c:when>


                      <c:otherwise>
                      <div id="season-winter"><img src="img/travel/winter.png" alt="icon-winter"></div>
                      </c:otherwise>
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