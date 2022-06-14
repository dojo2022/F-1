package servlet;

import java.io.IOException;
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
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/GandA/LoginServlet");
			return;
		}
		// 検索ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/travel.jsp");
		dispatcher.forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/GandA/LoginServlet");
			return;
		}

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");

		String site_place = request.getParameter("site_place");
		String site_food = request.getParameter("site_food");
		String site_spot = request.getParameter("site_spot");
		String site_location = request.getParameter("site_location");
		String site_hotel = request.getParameter("site_hotel");
		String site_budget = request.getParameter("site_budget");
		String site_image = request.getParameter("site_image");
		int site_month = Integer.parseInt(request.getParameter("site_month"));

		// ピックアップ処理を行う？
		TravelDAO traDao = new TravelDAO();
		List<Travel> travelList = traDao.select(new Travel( site_place, site_food, site_spot, site_location, site_hotel, site_budget, site_image, site_month));


		// 検索結果をリクエストスコープに格納する
		request.setAttribute("travelList", travelList);

		// 結果ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/travel.jsp");
		dispatcher.forward(request, response);


	}
}
