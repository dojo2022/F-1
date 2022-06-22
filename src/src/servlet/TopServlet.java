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

import dao.TopDAO;
import model.Schedule;

/**
 * Servlet implementation class TopServlet
 */
@WebServlet("/TopServlet")
public class TopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
//		if (session.getAttribute("id") == null) {
//			response.sendRedirect("/simpleBC/LoginServlet");
//			return;
//		}

		String user_id = (String)session.getAttribute("userid");
		//String user_id = "a";
		Calendar today = Calendar.getInstance();
		String date = String.format("%d/%02d/%02d", today.get(Calendar.YEAR), today.get(Calendar.MONTH) + 1,today. get(Calendar.DATE));
//

		// 検索処理を行う
		TopDAO toDao = new TopDAO();
		List<Schedule> todoList = toDao.selectTodo(new Schedule(user_id, date,"","","",""));
		//List<Schedule> cardList = toDao.selectTodo(new Schedule(user,date,sub,title,start_time,end_time));

		// 検索結果をリクエストスコープに格納する
		request.setAttribute("todoList", todoList);

		// 登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/top.jsp");
		dispatcher.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
//		if (session.getAttribute("id") == null) {
//			response.sendRedirect("/simpleBC/LoginServlet");
//			return;
//		}

		// リクエストパラメータを取得する
				request.setCharacterEncoding("UTF-8");
				String user = (String)session.getAttribute("userid");
				String date = request.getParameter("DATE");
				String sub = request.getParameter("SUB");
				String title = request.getParameter("TITLE");
				String start_time = request.getParameter("START_TIME");
				String end_time = request.getParameter("END_TIME");

				// 登録処理を行う
				TopDAO toDao = new TopDAO();
				boolean todoList = toDao.insert(new Schedule(user,"","","","",""));

				// 検索結果をリクエストスコープに格納する
				request.setAttribute("todoList", todoList);

				//登録サーブレットにリダイレクトする
				response.sendRedirect("/GandA/TopServlet");
	}
}