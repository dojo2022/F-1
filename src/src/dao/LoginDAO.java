package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//import model.User;

public class LoginDAO {
	// ログインできるならtrueを返す
	public boolean isLoginOK(String userid,String pw) {
		Connection conn = null;
		boolean loginResult = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6_data/GandA", "sa", "");

			// SELECT文を準備する
			String sql = "select count(*) from ACCOUNT where PASSWORD = ? and USER_ID = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1,pw);
			pStmt.setString(2,userid);

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// ユーザーIDとパスワードが一致するユーザーがいたかどうかをチェックする
			rs.next();
			if (rs.getInt("count(*)") == 1) {
				loginResult = true;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			loginResult = false;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			loginResult = false;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					loginResult = false;
				}
			}
		}

		// 結果を返す
		return loginResult;
	}

	public String select(String userid) {
		Connection conn = null;
		String user="";

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6_data/GandA", "sa", "");

			// SELECT文を準備する
			String sql = "select user from ACCOUNT where USER_ID =?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			System.out.println("USER:"+userid);
			pStmt.setString(1,userid);

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// ユーザーIDとパスワードが一致するユーザーがいたかどうかをチェックする
			rs.next();
			user = rs.getString("USER");
		}
		catch (SQLException e) {
			e.printStackTrace();
			user ="";
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			user ="";
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				user ="";
				}
			}
		}

		// 結果を返す
		return user;
		//return "竹入偽もの";
	}

}
