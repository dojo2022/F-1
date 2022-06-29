package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Schedule;

public class CalendarDAO {
	public List<String> select(Schedule param) {
		Connection conn = null;
		List<Schedule> cardList = new ArrayList<Schedule>();
		List<String> dateList = new ArrayList<String>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6/data/GandA", "sa", "");

			// SQL文を準備する
			String sql = "select * from Schedule WHERE USER LIKE ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (param.getUser() != null) {
				pStmt.setString(1, param.getUser());
			}else {
				pStmt.setString(1, "%");
			}

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Schedule card = new Schedule(
				rs.getString("USER"),
				rs.getString("DATE"),
				rs.getString("SUB"),
				rs.getString("TITLE"),
				rs.getString("START_TIME"),
				rs.getString("END_TIME")
				);
				cardList.add(card);
				dateList.add(rs.getString("DATE"));
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
		return dateList;
	}

}
