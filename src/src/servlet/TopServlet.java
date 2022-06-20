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
		//HttpSession session = request.getSession();
//	if (session.getAttribute("id") == null) {
//			response.sendRedirect("/simpleBC/LoginServlet");
//			return;
//		}

//		HttpSession session = request.getSession();
//	String user_id = (session.getAttribute("user_id")).toString();

//

		// 検索処理を行う
		TopDAO toDao = new TopDAO();
		List<Schedule> todoList = toDao.selectTodo(new Schedule("a","","","","",""));
		//List<Schedule> cardList = toDao.selectTodo(new Schedule(user,date,sub,title,start_time,end_time));

		// 検索結果をリクエストスコープに格納する
		request.setAttribute("todoList", todoList);

		// 登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/top.jsp?str=1");
		dispatcher.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
//	if (session.getAttribute("id") == null) {
//			response.sendRedirect("/simpleBC/LoginServlet");
//			return;
//		}

		// リクエストパラメータを取得する
				request.setCharacterEncoding("UTF-8");
				String user = "a";
				String date = request.getParameter("DATE");
				String sub = request.getParameter("SUB");
				String title = request.getParameter("TITLE");
				String start_time = request.getParameter("START_TIME");
				String end_time = request.getParameter("END_TIME");

				String[] dateNow = new String[3];
				dateNow[0] = request.getParameter("year");
				dateNow[1] = request.getParameter("month");
				dateNow[2] = request.getParameter("day");

				// 検索結果をリクエストスコープに格納する
				session.setAttribute("dateNow", dateNow);

				// 登録処理を行う
				TopDAO toDao = new TopDAO();
				boolean todoList = toDao.insert(new Schedule("a","","","","",""));

				//登録サーブレットにリダイレクトする
				response.sendRedirect("/GandA/TopServlet");
	}
}