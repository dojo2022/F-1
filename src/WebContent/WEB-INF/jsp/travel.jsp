<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="css/travel.css">
</head>



<body>
    <div class="wrapper-travel">
        <header>
            <jsp:include page="header.jsp" flush="true" />
        </header>

        <main>
            <h1 id="title-travel">【湖畔のコテージ】</h1>
            <div class="flex-travel">

                <!--おすすめ旅行先の説明-->
                <div id="text-pickup">

                    <h2 id="picmenu-food">≪food≫</h2>
                      <p id="explain-food">清涼な水で育った小麦粉、パンが有名。特に真四角の食パンはほんのりと甘さが引き、そのまま食べても十分なおいしさを楽しめる。お越しになった際は、朝９時のできたてをぜひ。</p>
                    <h2 id="picmenu-spot">≪spot≫</h2>
                      <p id="explain-spot">山の中腹には縁結びの神社がある。春には満開の桜が咲き乱れ、夏は子供と虫取りやレジャーを楽しめる。秋は運動に最適な気候で、冬はワカサギ釣りをが盛ん。わたしも出会いがほしい。</p>
                    <h2 id="picmenu-hotel">≪hotel≫</h2>
                      <p id="explain-hotel">駅前徒歩5分:コンフォートhotelWW</p>
                    <h2 id="picmenu-budget">≪budget≫</h2>
                      <p id="explain-budget"> 自由席:￥2,700 宿泊代:￥20,000～40,000 総額:約￥50,000</p>
                    <h2 id="picmenu-location">≪location≫</h2>
                      <p id="explain-location">長野県　長野市　○○町　第四区　1674-32 東京から:特級azusa 約1時間</p>
                </div>

                <!--旅行先写真-->
                <div id="picture-travel">
                    <img src="images/example_spot_1.png" alt="image-spot">

                    <!--旅行先の季節アイコン-->
                    <div class="icon-season">
                      <h1 id="title-season">Season: </h1>
                      <div id="season-spring"><img src="images/spring.png" alt="icon-spring"></div>
                      <div id="season-summer"><img src="images/summer.png" alt="icon-summer"></div>
                      <div id="season-autumn"><img src="images/autumn.png" alt="icon-autumn"></div>
                      <div id="season-winter"><img src="images/winter.png" alt="icon-winter"></div>
                   </div>
                </div>
            </div>
        </main>

        <footer>
        </footer>

    </div>
</body>

</html>