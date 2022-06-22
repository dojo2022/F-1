package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import model.Recipe;

/**
 * Servlet implementation class RecipeSearchServlet
 */
@WebServlet("/RecipeSearchServlet")
public class RecipeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		/*
		 * HttpSession session = request.getSession();
		 * if (session.getAttribute("id") == null) {
		 * response.sendRedirect("/GandA/LoginServlet");
		 * return;
		 * }
		 */

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String genre = request.getParameter("GENRE");
		String ingredient = request.getParameter("INGREDIENT");
		int guide = Integer.parseInt(request.getParameter("TIMECOOKING"));

		// スクレイピング
		Document source;
		Elements elements;
		String searchString = genre + " " + ingredient;

		//乱数生成
		Random rand = new Random();
	    int category = rand.nextInt(46) + 10;

		// の該当ページ(検索内容に応じたページ)にGETリクエストを送る
		if (!genre.isEmpty() || !ingredient.isEmpty()) {
			if(guide == 0) { //調理時間が選択させていない場合
				source = Jsoup.connect("https://recipe.rakuten.co.jp/search/" + searchString).get();
			}else {         //調理時間が選択されている場合
				source = Jsoup.connect("https://recipe.rakuten.co.jp/search/" + searchString + "/?time=" + guide).get();
			}
			elements = source.select(".recipe_ranking__item a");
		} else if(guide != 0){
			//乱数をもとにカテゴリーのページ決定
			//ページを選択された調理時間の目安で絞り込む
			source = Jsoup.connect("https://recipe.rakuten.co.jp/category/" + category + "/?time=" + guide).get();
			elements = source.select(".recipe_ranking__item a");
		}else {
			//何も入力、選択されていない場合
			source = Jsoup.connect("https://recipe.rakuten.co.jp/").get();
			elements = source.select(".weekly_recipe__list a");
		}

		// 使用する変数の宣言、初期化
		Document recipes;
		Element image, dish, time, comment;
		Elements dishIngredients, ingredientQuantity, instructions;
		int i = 0, j = 0, data_num = 0;
		String nameDish = "", sub = "", timeCooking = "", link = "", imagePath = "";
		ingredient = "";
		List<Recipe> recipeList = new ArrayList<Recipe>();

		//検索が見つかった場合
		if (elements.size() != 0) {
			// 該当ページを基に必要情報取得
			if(elements.size() < 10) {
				data_num = elements.size();
			}else {
				data_num = 10;
			}
			for (i = 0; i < data_num; i++) {
				// 料理ごとのレシピページにGETリクエストを送る
				recipes = Jsoup.connect(elements.get(i).absUrl("href")).get();

				//料理ごとのレシピページのURL格納
				link = elements.get(i).absUrl("href");

				// 料理名取得
				dish = recipes.select("h1").get(0);
				nameDish = dish.text().replace(" レシピ・作り方", "");

				// 料理のコメント取得
				//コメントの有無を確認（sizeが0ならコメントはない）
				if(recipes.select(".recipe_info_user__comment").size() != 0) {
					comment = recipes.select(".recipe_info_user__comment").get(0);
					genre = comment.text();
				}else {
					genre = "コメントはありません";
				}

				// 調理時間の取得
				if(recipes.select(".recipe_info__time").size() != 0) {
					time = recipes.select(".recipe_info__time").get(0);
					timeCooking = time.text();
					// 取得した調理時間（文字列）内の数字以外を空白に置き換え、その後数値に変換している
					//timeCooking = Integer.parseInt(time.text().replaceAll("[^0-9]", ""));
				} else {
					timeCooking = "調理時間の目安はありません";
				}

				// 具材の取得
				dishIngredients = recipes.select(".recipe_material__item_name");
				// 具材の量取得
				ingredientQuantity = recipes.select(".recipe_material__item_serving");

				for (j = 0; j < dishIngredients.size() - 1; j++) {
					ingredient += dishIngredients.get(j).text() + ":" + ingredientQuantity.get(j).text() + ",";
				}
				// 最後の具材では”、”を表示させない
				ingredient += dishIngredients.get(j).text() + ":" + ingredientQuantity.get(j).text();


				// 作り方取得
				instructions = recipes.select(".recipe_howto__list");
				for (Element instruction : instructions) {
					sub += instruction.text();
				}

				// 料理画像の取得
				image = recipes.select(".recipe_info_img img").get(0);
				imagePath = image.attr("src");

				// リストに追加（リクエストスコープへの格納に使用）
				recipeList.add(new Recipe(nameDish, genre, ingredient, timeCooking, link, sub, imagePath));

				// 次のレシピの内容と重ならないように初期化
				ingredient = "";
				sub = "";
			}
		} else {   //検索が見つからなかった場合
			recipeList.add(new Recipe("not found", "", "", "", "", "", ""));
		}

		// 検索結果をリクエストスコープに格納する
		request.setAttribute("recipeList", recipeList);

		// 結果ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/recipe_search.jsp");
		dispatcher.forward(request, response);
	}

}
