package servlet;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TravelDAO;
import model.Travel;


/**
 * Servlet implementation class TravelServlet
 */
@WebServlet("/TravelServlet")
public class TravelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
/*		if (session.getAttribute("id") == null) {
			response.sendRedirect("/GandA/LoginServlet");
			return;
		}
*/


		//現在の月を取得
		Calendar c = Calendar.getInstance();
		int month = (int)(c.get(Calendar.MONTH) + 1);
		session.setAttribute("picMonth", (int)month);



		// ピックアップ表示処理？
		TravelDAO traDao = new TravelDAO();
		List<Travel> travelList = traDao.select(month);





		//pic検索したデータをセッションスコープに格納する
		session.setAttribute("travelList", travelList);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/travel.jsp");
		dispatcher.forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
/*	if (session.getAttribute("id") == null) {
			response.sendRedirect("/GandA/LoginServlet");
			return;
		}
*/
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");


/*		Calendar c = Calendar.getInstance();
		int month = (int)(c.get(Calendar.MONTH) + 1);
		session.setAttribute("picMonth", (int)month);



		// ピックアップ表示処理？
		TravelDAO traDao = new TravelDAO();
		List<Travel> travelList = traDao.select(month);


		//pic検索したデータをセッションスコープに格納する
		session.setAttribute("travelList", travelList);    */

		// 結果ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/travel.jsp");
		dispatcher.forward(request, response);


	}
}
