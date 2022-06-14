package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RecipeDAO;
import model.Recipe;

/**
 * Servlet implementation class RecipeSearchServlet
 */
@WebServlet("/RecipeSearchServlet")
public class RecipeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
				/*HttpSession session = request.getSession();
				if (session.getAttribute("id") == null) {
					response.sendRedirect("/GandA/LoginServlet");
					return;
				}*/

				// リクエストパラメータを取得する
				request.setCharacterEncoding("UTF-8");
				String nameDish = request.getParameter("NAMEDISH");
				String genre = request.getParameter("GENRE");
				if(genre.equals("指定なし")) {
					genre = "";
				}
				String ingredient = request.getParameter("INGREDIENT");
				int timeCooking;
				if(request.getParameter("TIMECOOKING").equals("指定なし")) {
					timeCooking = 0;
				}else {
					timeCooking = Integer.parseInt(request.getParameter("TIMECOOKING"));
				}


				// 検索処理を行う
				RecipeDAO reDao = new RecipeDAO();
				List<Recipe> recipeList = reDao.select(new Recipe(nameDish, genre, ingredient, timeCooking, "", "", ""));

				// 検索結果をリクエストスコープに格納する
				request.setAttribute("recipeList", recipeList);

				// 結果ページにフォワードする
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/recipe_search.jsp");
				dispatcher.forward(request, response);
	}

}
