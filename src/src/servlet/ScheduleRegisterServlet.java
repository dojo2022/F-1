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

import dao.ScheduleRegisterDAO;
import model.Schedule;

/**
 * Servlet implementation class ScheduleRegisterServlet
 */
@WebServlet("/ScheduleRegisterServlet")
public class ScheduleRegisterServlet extends HttpServlet {
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
		Calendar cal = Calendar.getInstance();
		int yearNow = cal.get(Calendar.YEAR);
		int monthNow = cal.get(Calendar.MONTH) + 1;
		String dateNow = "" + yearNow + "/" + monthNow;




		// 検索処理を行う
		ScheduleRegisterDAO bDao = new ScheduleRegisterDAO();
		List<Schedule> cardList = bDao.select(new Schedule("a",dateNow,"","","",""));

		// 検索結果をリクエストスコープに格納する
		request.setAttribute("cardList", cardList);

		// 登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/schedule_register.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String user = "a";
		String date = request.getParameter("DATE");
		String sub = request.getParameter("SUB");
		String title = request.getParameter("TITLE");
		String start = request.getParameter("START");
		String end = request.getParameter("END");

		// 登録処理を行う
		ScheduleRegisterDAO bDao = new ScheduleRegisterDAO();
		bDao.insert(new Schedule(user, date, sub, title, start, end));

		//登録サーブレットにリダイレクトする
		response.sendRedirect("/GandA/ScheduleRegisterServlet");
	}

}
