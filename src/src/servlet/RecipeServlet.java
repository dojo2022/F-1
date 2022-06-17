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
		/* * if (session.getAttribute("id") == null) {
		 * response.sendRedirect("/GandA/LoginServlet");
		 * return;
		 * }
		 */

		//毎回スクレイピングしていた場合、sessionに格納する
		//if(session.getAttribute("pickMenu") == null){
			//今日の曜日取得
			Calendar dayOfWeek = Calendar.getInstance();
			int day = dayOfWeek.get(Calendar.DAY_OF_WEEK) - 1;
			if(day == 0) {
				day = 6;
			}else {
				day--;
			}

			// スクレイピング
			Document source;
			Elements elements;
			// の該当ページ(検索内容に応じたページ)にGETリクエストを送る
			source = Jsoup.connect("https://recipe.rakuten.co.jp/menu/").get();
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
			recipes = Jsoup.connect(elements.get(day).absUrl("href")).get();

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
				// リストに追加（リクエストスコープへの格納に使用）
				pickMenu.add(new Recipe(nameDish, "", "", "", link, "", imagePath));
			}

			// 検索処理を行う
			/*
			 * RecipeDAO reDao = new RecipeDAO();
			 * List<Recipe> recipeList = reDao.select(new Recipe("", "", "", "", "", "",
			 * ""));
			 */
			// 検索結果をリクエストスコープに格納する
			request.setAttribute("pickMenu", pickMenu);

			// 検索結果をセッションスコープに格納する
			//session.setAttribute("pickMenu", pickMenu);
		//}
		// レシピページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/recipe.jsp");
		dispatcher.forward(request, response);
	}
}
