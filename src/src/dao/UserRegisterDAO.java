package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.User;

public class UserRegisterDAO {
	// 引数cardで指定されたレコードを登録し、成功したらtrueを返す
	public boolean insert(User userinfo) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6_data/GandA", "sa", "");

			// SQL文を準備する
			String sql = "insert into ACCOUNT (USER, USERID, PASSWORD) values (?, ?, ?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (userinfo.getUser() != null && !userinfo.getUser().equals("")) {
				pStmt.setString(1, userinfo.getUser());
			}
			else {
				pStmt.setString(1, "");
			}
			if (userinfo.getUserId() != null && !userinfo.getUserId().equals("")) {
				pStmt.setString(2, userinfo.getUserId());
			}
			else {
				pStmt.setString(2, "");
			}
			if (userinfo.getPassword() != null && !userinfo.getPassword().equals("")) {
				pStmt.setString(3, userinfo.getPassword());
			}
			else {
				pStmt.setString(3, "");
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

}
