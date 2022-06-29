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
                        <div id="text-username">${name}</div>

                    Time:
                        <div id="text-time"></div>


                <!--ログアウトアイコン-->
                <div id="box-logout"><a href="/GandA/LogoutServlet" class="link-menu">Log out</a></div>
                </div>

            </div>


                        <!--ハンバーガーメニュー-->
            <div id="drawer">
                <input id="input" type="checkbox" class="unshown">
                <label id="open" for="input"><span></span></label>
                <label class="unshown" id="close" for="input"></label>
                <div id="menu-content">


                    <nav>
                        <div class="menu-pro">M E N U</div>
                        <ul class="flex-pro">
                            <li id="box-pro">
                                <a href="/GandA/TopServlet" class="link-pro">

                                    <span id="first-pro1">Top</span>
                                </a>
                            </li>
                            <li id="box-pro">
                                <a href="/GandA/CalendarServlet" class="link-pro">
                                    <span id="first-pro">Calendar</span>
                                </a>
                            </li>
                            <li id="box-pro">
                                <a href="/GandA/RecipeServlet" class="link-pro">

                                    <span id="first-pro">Cooking</span>
                                </a>
                            </li>
                            <li id="box-pro">
                                <a href="/GandA/TravelServlet" class="link-pro">

                                    <span id="first-pro">Travel</span>
                                </a>
                            </li>

                        </ul>
                    </nav>
                    <!--ログアウト-->
                    <div id="box-logout-pro"><a href="/GandA/LogoutServlet" class="link-menu-pro">Log out</a></div>
                </div>
            </div>
            <!--ハンバーガー終わり-->




        <!-- メニューバー部分 -->

        <div id="text_menu">
                <nav>
                <div class="menu-center">M E N U</div>
                <ul class="menu-flex">
                    <li id="box-menu">
                        <a href="/GandA/TopServlet" class="link-menu">

                            <span id="first-text-pro">Top</span></a><span id="second-text">|</span>

                    </li>
                    <li id="box-menu">
                        <a href="/GandA/CalendarServlet" class="link-menu">

                            <span id="first-text">Calendar</span></a><span id="second-text">|</span>

                    </li>
                    <li id="box-menu">
                        <a href="/GandA/RecipeServlet" class="link-menu">

                            <span id="first-text">Cooking</span></a><span id="second-text">|</span>

                    </li>
                    <li id="box-menu">
                        <a href="/GandA/TravelServlet" class="link-menu">

                            <span id="first-text">Travel</span>
                        </a>
                    </li>

                </ul>
                </nav>
            </div>


        </header>


        <script>
            //現在時刻表示
            'use strict';

            function set2fig(num) {
	        // 桁数が1桁だったら先頭に0を加えて2桁に調整する
	        var ret;
	        if( num < 10 ) { ret = "0" + num; }
	        else {
	          ret = num;
	        }
	        return ret;
	        }

	        function showClock2() {
	          var nowTime = new Date();
	          var nowHour = set2fig( nowTime.getHours() );
	          var nowMin  = set2fig( nowTime.getMinutes() );

	          var msg =  nowHour + ":" + nowMin;
	          document.getElementById('text-time').innerHTML = msg;
	        }
	        setInterval('showClock2()',1000);


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
