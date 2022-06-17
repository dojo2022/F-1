<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    <link rel="stylesheet" href="css/common.css">

    <!-- ヘッダー部分  -->
    <div class="wrapper-header">
        <header id="header" class="header">
            <div class="images-icon">

                <!--メインアイコン-->
                <div><a href="/GandA/TopServlet"><img src="img/other/icon_main.png" alt="G&Alogo" id="icon-main"></a></div>
                <!--名前、時間-->
                <div class="text-header">
                    Name:
                        <div id="text-username"></div>

                    Time:
                        <div id="text-time"></div>

                </div>
                <!--ログアウトアイコン-->
                <div id="box-logout"><a href="/GandA/LogoutServlet"><img src="img/other/icon_logout.png" alt="logoutlogo" id="icon-logout"></a>
                </div>

            </div>
        <!-- メニューバー部分 -->

        <div id="text_menu">
            <p id="box-menu">
                <a href="/GandA/CalendarServlet"><img src="img/other/calendar.png" id="menu-in-icon"><span id="first-text">C</span><span id="second-text">alendar</span></a>
            </p>
            <p id="box-menu">
                <a href="/GandA/TopServlet"><img src="img/other/menu.png" id="menu-in-icon"><span id="first-text">S</span><span id="second-text">chedule</span></a>
            </p>
            <p id="box-menu">
                <a href="/GandA/RecipeServlet"><img src="img/other/recipe.png" id="menu-in-icon"><span id="first-text">C</span><span id="second-text">ooking</span></a>
            </p>
            <p id="box-menu">
                <a href="/GandA/TravelServlet"><img src="img/other/travel.png" id="menu-in-icon"><span id="first-text">T</span><span id="second-text">ravel</span></a>
            </p>
        </div>


        </header>


        <script>
            //現在時刻表示
            'use strict';

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

            const output = `${year}/${month + 1}/${date} ${hour}:${min}`;
            document.getElementById("text-time").textContent = output;
            //console.log(output);



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
