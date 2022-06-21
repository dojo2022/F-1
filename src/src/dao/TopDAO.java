package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Schedule;

public class TopDAO {
	// 引数paramで検索項目を指定し、検索結果のリストを返す
		public List<Schedule> selectTodo(Schedule uid) {
			Connection conn = null;
			List<Schedule> todo = new ArrayList<Schedule>();

			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6_data/GandA", "sa", "");

				// SQL文を準備する
				String sql1 = "SELECT * from Schedule WHERE USER =? ORDER BY DATE"  ;
				//String sql2 = "SELECT * from schedule WHERE user =? and date_sub(CURRENT_DATE,INTERVAL 1 DAY)";

				PreparedStatement pStmt1 = conn.prepareStatement(sql1);
				//PreparedStatement pStmt2 = conn.prepareStatement(sql2);

				// SQL文を完成させる
				if (uid.getUser() != null && !uid.getUser().equals("")) {
					pStmt1.setString(1, uid.getUser());
				} else {
					pStmt1.setString(1, "");
				}
				//チームメンバーに確認取る

				// SQL文を実行し、結果表を取得する
				ResultSet rs1 = pStmt1.executeQuery();
				//ResultSet rs2 = pStmt2.executeQuery();
				// 結果表をコレクションにコピーする
				while (rs1.next()) {
					Schedule list=new Schedule(
							rs1.getString("USER"),
							rs1.getString("DATE"),
							rs1.getString("SUB"),
							rs1.getString("TITLE"),
							rs1.getString("START_TIME"),
							rs1.getString("END_TIME"));
					todo.add(list);
				}
//				while (rs2.next()) {
//					Schedule list=new Schedule(
//							rs2.getString("USER"),
//							rs2.getString("DATE"),
//							rs2.getString("SUB"),
//							rs2.getString("TITLE"),
//							rs2.getString("START_TIME"),
//							rs2.getString("END_TIME"));
//					todo.add(list);
//				}
			}
			catch (SQLException e) {
				e.printStackTrace();
				todo = null;
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
				todo = null;
			}
			finally {
				// データベースを切断
				if (conn != null) {
					try {
						conn.close();
					}
					catch (SQLException e) {
						e.printStackTrace();
						todo = null;
					}
				}
			}

			// 結果を返す
			return todo;
		}

		// 引数cardで指定されたレコードを登録し、成功したらtrueを返す
		public boolean insert(Schedule list) {
			Connection conn = null;
			boolean result = false;

			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6_data/GandA", "sa", "");

				// SQL文を準備する
				String sql1 = "INSERT INTO Schedule( user,date,sub,title,startTime,endTime) values (?, ?, ?, ?,?,?)";
				String sql2 = "INSERT INTO Schedule( user,date,sub,title,startTime,endTime) values (?, ?, ?, ?,?,?)";

				PreparedStatement pStmt1 = conn.prepareStatement(sql1);
				PreparedStatement pStmt2 = conn.prepareStatement(sql2);

				// SQL文を完成させる
				if (list.getUser() != null && !list.getUser().equals("")) {
					pStmt1.setString(1, list.getUser());
				}
				else {
					pStmt1.setString(1, null);
				}
				if (list.getDate() != null && !list.getDate().equals("")) {
					pStmt1.setString(2, list.getDate());
				}
				else {
					pStmt1.setString(2, null);
				}
				if (list.getSub() != null && !list.getSub().equals("")) {
					pStmt1.setString(3, list.getSub());
				}
				else {
					pStmt1.setString(3, null);
				}
				if (list.getTitle() != null && !list.getTitle().equals("")) {
					pStmt1.setString(4, list.getTitle());
				}
				else {
					pStmt1.setString(4, null);
				}
				if (list.getStartTime() != null && !list.getStartTime().equals("")) {
					pStmt1.setString(5, list.getStartTime());
				}
				else {
					pStmt1.setString(5, null);
				}
				if (list.getEndTime() != null && !list.getEndTime().equals("")) {
					pStmt1.setString(6, list.getEndTime());
				}
				else {
					pStmt1.setString(6, null);
				}
				if (list.getUser() != null) {
					pStmt2.setString(1, list.getUser());
				}
				else {
					pStmt2.setString(1, null);
				}
				if (list.getDate() != null && !list.getDate().equals("")) {
					pStmt2.setString(2, list.getDate());
				}
				else {
					pStmt2.setString(2, null);
				}
				if (list.getSub() != null && !list.getSub().equals("")) {
					pStmt2.setString(3, list.getSub());
				}
				else {
					pStmt2.setString(3, null);
				}
				if (list.getTitle() != null && !list.getTitle().equals("")) {
					pStmt2.setString(4, list.getTitle());
				}
				else {
					pStmt2.setString(4, null);
				}
				if (list.getStartTime() != null && !list.getStartTime().equals("")) {
					pStmt1.setString(5, list.getStartTime());
				}
				else {
					pStmt1.setString(5, null);
				}
				if (list.getEndTime() != null && !list.getEndTime().equals("")) {
					pStmt1.setString(6, list.getEndTime());
				}
				else {
					pStmt1.setString(6, null);
				}

				// SQL文を実行する
				if (pStmt1.executeUpdate() == 1) {
					result = true;
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			finally {
				// データベースを切断
				if (conn != null) {
					try {
						conn.close();
					}
					catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}

			// 結果を返す
			return result;
		}

		// 引数cardで指定されたレコードを更新し、成功したらtrueを返す
		public boolean update(Schedule list) {
			Connection conn = null;
			boolean result = false;

			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6_data/GandA", "sa", "");

				// SQL文を準備する
				String sql1 = "update Schedule set user=?, date=?, sub=?, title=?, startTime=?, endTime=?  WHERE user=? AND WHERE date >= CURRENT_DATE";
				String sql2 = "update Schedule set user=?, date=?, sub=?, title=?, startTime=?, endTime=?  WHERE user =? and date_sub(CURRENT_DATE,INTERVAL 1 DAY)";
				PreparedStatement pStmt1 = conn.prepareStatement(sql1);
				PreparedStatement pStmt2 = conn.prepareStatement(sql2);
				// SQL文を完成させる
				if (list.getUser() != null && !list.getUser().equals("")) {
					pStmt1.setString(1, list.getUser());
				}
				else {
					pStmt1.setString(1, null);
				}
				if (list.getDate() != null && !list.getDate().equals("")) {
					pStmt1.setString(2, list.getDate());
				}
				else {
					pStmt1.setString(2, null);
				}
				if (list.getSub() != null && !list.getSub().equals("")) {
					pStmt1.setString(3, list.getSub());
				}
				else {
					pStmt1.setString(3, null);
				}
				if (list.getTitle() != null && !list.getTitle().equals("")) {
					pStmt1.setString(4, list.getTitle());
				}
				else {
					pStmt1.setString(4, null);
				}
				if (list.getStartTime() != null && !list.getStartTime().equals("")) {
					pStmt1.setString(5, list.getStartTime());
				}
				else {
					pStmt1.setString(5, null);
				}
				if (list.getEndTime() != null && !list.getEndTime().equals("")) {
					pStmt1.setString(6, list.getEndTime());
				}
				else {
					pStmt1.setString(6, null);
				}
				if (list.getUser() != null && !list.getUser().equals("")) {
					pStmt2.setString(1, list.getUser());
				}
				else {
					pStmt2.setString(1, null);
				}
				if (list.getDate() != null && !list.getDate().equals("")) {
					pStmt2.setString(2, list.getDate());
				}
				else {
					pStmt2.setString(2, null);
				}
				if (list.getSub() != null && !list.getSub().equals("")) {
					pStmt2.setString(3, list.getSub());
				}
				else {
					pStmt2.setString(3, null);
				}
				if (list.getTitle() != null && !list.getTitle().equals("")) {
					pStmt2.setString(4, list.getTitle());
				}
				else {
					pStmt2.setString(4, null);
				}
				if (list.getStartTime() != null && !list.getStartTime().equals("")) {
					pStmt1.setString(5, list.getStartTime());
				}
				else {
					pStmt1.setString(5, null);
				}
				if (list.getEndTime() != null && !list.getEndTime().equals("")) {
					pStmt1.setString(6, list.getEndTime());
				}
				else {
					pStmt1.setString(6, null);
				}

				// SQL文を実行する
				if (pStmt1.executeUpdate() == 1) {
					result = true;
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			finally {
				// データベースを切断
				if (conn != null) {
					try {
						conn.close();
					}
					catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}

			// 結果を返す
			return result;
		}

		// 引数numberで指定されたレコードを削除し、成功したらtrueを返す
		public boolean delete(String date,String sub,String title,String startTime,String endTime) {
			Connection conn = null;
			boolean result = false;

			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6_data/GandA", "sa", "");

				// SQL文を準備する
				String sql1 = "delete from BC where USER=?";
				String sql2 = "delete from BC where USER=?";
				PreparedStatement pStmt1 = conn.prepareStatement(sql1);
				PreparedStatement pStmt2 = conn.prepareStatement(sql2);
				// SQL文を完成させる
				pStmt1.setString(1, date);
				pStmt1.setString(2, sub);
				pStmt1.setString(3, title);
				pStmt1.setString(4, startTime);
				pStmt1.setString(5, endTime);
				pStmt2.setString(1, date);
				pStmt2.setString(2, sub);
				pStmt2.setString(3, title);
				pStmt2.setString(4, startTime);
				pStmt2.setString(5, endTime);
				// SQL文を実行する
				if (pStmt1.executeUpdate() == 1) {
					result = true;
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			finally {
				// データベースを切断
				if (conn != null) {
					try {
						conn.close();
					}
					catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}

			// 結果を返す
			return result;
		}
}


