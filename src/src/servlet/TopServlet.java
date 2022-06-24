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
		if (session.getAttribute("userid") == null) {
			response.sendRedirect("/GandA/LoginServlet");
			return;
		}

		String user = (String)session.getAttribute("userid");
		Calendar today = Calendar.getInstance();
		String date = String.format("%d/%02d/%02d", today.get(Calendar.YEAR), today.get(Calendar.MONTH) + 1,today. get(Calendar.DATE));

		// 検索処理を行う
		TopDAO toDao = new TopDAO();
		List<Schedule> todoList = toDao.selectTodo(new Schedule(user, date,"","","",""));
		//List<Schedule> cardList = toDao.selectTodo(new Schedule(user,date,sub,title,start_time,end_time));

		// 検索結果をリクエストスコープに格納する
		request.setAttribute("todoList", todoList);

		// topページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/top.jsp");
		dispatcher.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("userid") == null) {
			response.sendRedirect("/simpleBC/LoginServlet");
			return;
		}

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String user = (String)session.getAttribute("userid");
		String date = request.getParameter("DATE");
		String sub = request.getParameter("SUB");
		String title = request.getParameter("TITLE");
		String startTime = request.getParameter("STARTTIME");
		String endTime = request.getParameter("ENDTIME");

		//前の開始時間がなければ更新、削除できない
		String startTimeOld = request.getParameter("STARTTIMEOLD");

		// 更新または削除を行う
		TopDAO toDao = new TopDAO();
		if (request.getParameter("SUBMIT").equals("更新")) {
			if (toDao.update((new Schedule(user,date,sub,title,startTime,endTime)),startTimeOld)) {	// 更新成功
				request.setAttribute("result", "更新成功！");
			}else {												// 更新失敗
				request.setAttribute("result", "更新失敗！");
			}
		}else {
			if (toDao.delete(user,date,startTimeOld)) {	// 削除成功
				request.setAttribute("result", "削除成功！");
			}else {												// 更新失敗
				request.setAttribute("result", "削除失敗！");
			}
		}

		Calendar today = Calendar.getInstance();
		String nowDay = String.format("%d/%02d/%02d", today.get(Calendar.YEAR), today.get(Calendar.MONTH) + 1,today. get(Calendar.DATE));
		List<Schedule> todoList = toDao.selectTodo(new Schedule(user, nowDay,"","","",""));

		// 検索結果をリクエストスコープに格納する
		request.setAttribute("todoList", todoList);

		//topサーブレットにリダイレクトする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/top.jsp");
		dispatcher.forward(request, response);
	}
}