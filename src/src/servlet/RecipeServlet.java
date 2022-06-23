package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import model.Recipe;

/**
 * Servlet implementation class RecipeServlet
 */
@WebServlet("/RecipeServlet")
public class RecipeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする

		 HttpSession session = request.getSession();
		 if (session.getAttribute("id") == null) {
		  response.sendRedirect("/GandA/LoginServlet");
		  return;
		 }


		 //献立の検索は最初の一回のみで十分であるため
		if(session.getAttribute("pickMenu") == null){
			//今日の曜日取得(取得される値は1(日曜)から7(土曜))
			Calendar dayOfWeek = Calendar.getInstance();
			int day = dayOfWeek.get(Calendar.DAY_OF_WEEK) - 2;
			//日曜は献立の最後であるため日曜(-1)の時はdayを6にする
			if(day == -1) {
				day = 6;
			}

			// スクレイピング
			Document source;
			Elements elements;
			// の該当ページ(検索内容に応じたページ)にGETリクエストを送る
			source = Jsoup.connect("https://recipe.rakuten.co.jp/menu/").userAgent("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/7046A194A").get();
			elements = source.select(".weekly_menu__contents a");

			// 使用する変数の宣言、初期化
			Document recipes;
			Elements images, links, dishes;
			int i = 0;
			String imagePath = "", link = "";
			String nameDish = "";
			List<Recipe> pickMenu = new ArrayList<Recipe>();


			/* 該当ページを基に必要情報取得 */
			// 曜日ごとの献立ページのURL取得
			recipes = Jsoup.connect(elements.get(day).absUrl("href")).userAgent("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/7046A194A").get();

			// 料理名の取得
			dishes = recipes.select(".menu_detail__menu_title");
			// 料理画像の取得
			images = recipes.select(".menu_detail__menu_item img");
			//料理のレシピが記述されたページのURL（一部）取得
			links = recipes.select(".menu_detail__menu_item a");

			for(i = 0; i < 3; i++) {
				nameDish = dishes.get(i).text();
				imagePath = images.get(i).attr("src");
				link = links.get(i).attr("href");
				// リストに追加（スコープへの格納に使用）
				pickMenu.add(new Recipe(nameDish, "", "", "", link, "", imagePath));
			}


			// 検索結果をリクエストスコープに格納する
			//request.setAttribute("pickMenu", pickMenu);

			// 検索結果をセッションスコープに格納する
			session.setAttribute("pickMenu", pickMenu);
		}
		// レシピページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/recipe.jsp");
		dispatcher.forward(request, response);
	}
}
