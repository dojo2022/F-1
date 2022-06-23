package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Schedule;

public class ScheduleRegisterDAO {
	public List<Schedule> select(Schedule param) {
		Connection conn = null;
		List<Schedule> cardList = new ArrayList<Schedule>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6/data/GandA", "sa", "");

			// SQL文を準備する
			String sql = "select * from Schedule WHERE USER LIKE ? AND DATE LIKE ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (param.getUser() != null) {
				pStmt.setString(1, param.getUser());
			} else {
				pStmt.setString(1, "%");
			}
			if (param.getDate() != null) {
				pStmt.setString(2, param.getDate());
			} else {
				pStmt.setString(2, "%");
			}

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Schedule card = new Schedule(
				//データベースのカラム名を代入
				rs.getString("USER"),
				rs.getString("DATE"),
				rs.getString("SUB"),
				rs.getString("TITLE"),
				rs.getString("START_TIME"),
				rs.getString("END_TIME")
				);
				cardList.add(card);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			cardList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			cardList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					cardList = null;
				}
			}
		}

		// 結果を返す
		return cardList;
	}

	// 引数cardで指定されたレコードを登録し、成功したらtrueを返す
	public boolean insert(Schedule card) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6/data/GandA", "sa", "");

			// SQL文を準備する
			String sql = "insert into Schedule (USER, DATE, SUB, TITLE, START_TIME, END_TIME) values (?, ?, ?, ?, ?, ?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (card.getUser() != null && !card.getUser().equals("")) {
				pStmt.setString(1, card.getUser());
			} else {
				pStmt.setString(1, null);
			}
			if (card.getDate() != null && !card.getDate().equals("")) {
				pStmt.setString(2, card.getDate());
			} else {
				pStmt.setString(2, null);
			}
			if (card.getSub() != null && !card.getSub().equals("")) {
				pStmt.setString(3, card.getSub());
			} else {
				pStmt.setString(3, null);
			}
			if (card.getTitle() != null && !card.getTitle().equals("")) {
				pStmt.setString(4, card.getTitle());
			} else {
				pStmt.setString(4, null);
			}
			if (card.getStartTime() != null && !card.getStartTime().equals("")) {
				pStmt.setString(5, card.getStartTime());
			} else {
				pStmt.setString(5, null);
			}
			if (card.getEndTime() != null && !card.getEndTime().equals("")) {
				pStmt.setString(6, card.getEndTime());
			} else {
				pStmt.setString(6, null);
			}

			// SQL文を実行する
			if (pStmt.executeUpdate() == 1) {
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
	public boolean update(Schedule card,String oldStart) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6/data/GandA", "sa", "");

			// SQL文を準備する
			String sql = "update Schedule set DATE=?, SUB=?, TITLE=?, START_TIME=?, END_TIME=? where USER=? and DATE=? and START_TIME=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (card.getDate() != null && !card.getDate().equals("")) {
				pStmt.setString(1, card.getDate());
			} else {
				pStmt.setString(1, "");
			}
			if (card.getSub() != null && !card.getSub().equals("")) {
				pStmt.setString(2, card.getSub());
			} else {
				pStmt.setString(2, "");
			}
			if (card.getTitle() != null && !card.getTitle().equals("")) {
				pStmt.setString(3, card.getTitle());
			} else {
				pStmt.setString(3, "");
			}
			if (card.getStartTime() != null && !card.getStartTime().equals("")) {
				pStmt.setString(4, card.getStartTime());
			} else {
				pStmt.setString(4, "");
			}
			if (card.getEndTime() != null && !card.getEndTime().equals("")) {
				pStmt.setString(5, card.getEndTime());
			} else {
				pStmt.setString(5, "");
			}
			pStmt.setString(6, card.getUser());
			pStmt.setString(7, card.getDate());
			pStmt.setString(8, oldStart);

			// SQL文を実行する
			if (pStmt.executeUpdate() == 1) {
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
	public boolean delete(String user,String date,String start) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6/data/GandA", "sa", "");

			// SQL文を準備する
			String sql = "delete from Schedule where USER=? and DATE=? and START_TIME=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setString(1, user);
			pStmt.setString(2, date);
			pStmt.setString(3, start);

			// SQL文を実行する
			if (pStmt.executeUpdate() == 1) {
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
