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

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String user = "a";
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String date = year + "/" + month + "/" + day;
		String[] dateNow = new String[3];
		dateNow[0] = request.getParameter("year");
		dateNow[1] = request.getParameter("month");
		dateNow[2] = request.getParameter("day");

		// 検索処理を行う
		ScheduleRegisterDAO bDao = new ScheduleRegisterDAO();
		List<Schedule> cardList = bDao.select(new Schedule(user,date,"","","",""));

		// 検索結果をリクエストスコープに格納する
		request.setAttribute("cardList", cardList);
		request.setAttribute("dateNow", dateNow);

		// 登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/schedule_register.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
//		if (session.getAttribute("id") == null) {
//			response.sendRedirect("/simpleBC/LoginServlet");
//			return;
//		}

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String user = "a";
		String sub = request.getParameter("SUB");
		String title = request.getParameter("TITLE");
		String start = request.getParameter("START");
		String end = request.getParameter("END");
		String oldTitle =  request.getParameter("oldTitle");
		String oldStart =  request.getParameter("oldStart");

		String[] dateNow = new String[3];
		dateNow[0] = request.getParameter("year");
		dateNow[1] = request.getParameter("month");
		dateNow[2] = request.getParameter("day");
		String date = dateNow[0] + "/" + dateNow[1] + "/" + dateNow[2];

		// 登録処理を行う
		ScheduleRegisterDAO bDao = new ScheduleRegisterDAO();
		if (request.getParameter("SUBMIT").equals("登録")) {
			bDao.insert(new Schedule(user, date, sub, title, start, end));
		} else if (request.getParameter("SUBMIT").equals("更新")){
			bDao.update(new Schedule(user, date, sub, title, start, end),oldTitle,oldStart);
		}

		//編集サーブレットにリダイレクトする
		response.sendRedirect("/GandA/ScheduleRegisterServlet?year=" + dateNow[0] + "&month=" + dateNow[1] + "&day=" + dateNow[2]);
		return;
	}

}
