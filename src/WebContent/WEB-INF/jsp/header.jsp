<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="css/common.css">
</head>

<body>
    <div class="wrapper-header">
        <header id="scroll-hide">
            <div class="images-icon">
                <!--メインアイコン-->
                <div><a><img src="images/icon_main.png" alt="G&Alogo" id="icon-main"></a></div>
                <!--名前、時間の表示-->
                <div class="text-header">
                    Name:
                        <span id="text-username">林田</span>

                    Time:
                        <span id="text-time"></span>

                </div>
                <!--ログアウトアイコン-->
                <div id="box-logout"><a href=""><img src="images/icon_logout.png" alt="logoutlogo" id="icon-logout"></a>
                </div>

        <div id="text_menu">
            <p>
                <a href="Calendar.html"> <img src="Calendar.png"><span class="first-text">C</span><span>alendar</span></a>
            </p>
            <p>
                <a href="Schedule.html"><img src="Schedule.png"><span class="first-text">S</span><span>chedule</span></a>
            </p>
            <p>
                <a href="Cooking.html"><img src="Cooking.png"><span class="first-text">C</span><span>ooking</span></a>
            </p>
            <p>
                <a href="Travel.html"><img src="Travel.png"><span class="first-text">T</span><span>ravel</span></a>
            </p>
        </div>

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

            // ヘッダーを取得
            const header = document.getElementById("scroll-hide");
            // ヘッダーの高さを取得
            const hH = header.clientHeight;
            // 現在地を示す変数を定義
            let pos = 0;

            const onScroll = () => {
                // スクロール直前の位置を示す変数を定義
                let lastPos = 0;
                console.log("てすと");
                // スクロール位置がヘッダーの高さ分より大きい場合にclass名を追加し、そうでない場合にclass名を削除
                if (pos > hH && pos > lastPos) {
                    header.classList.add('scroll-hide--unpinned');
                }
                if (pos < hH || pos < lastPos) {
                    header.classList.remove('scroll-hide--unpinned');
                }
                // 最後のスクロール位置を保存
                lastPos = pos;
            };

            window.addEventListener("scroll", () => {
                // スクロールするごとにpos（現在地）の値を更新
                pos = window.scrollY;
                onScroll();

            }
            );

        </script>

  </div>
</body>


</html>