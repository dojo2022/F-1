package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Travel;

//import java.sql.Connection;

public class TravelDAO {
	public List<Travel> select(int month) {
		Connection conn = null;
		List<Travel> travelList = new ArrayList<Travel>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");
			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6/data/GandA", "sa", "");
			// SQL文を準備する
			String sql = "SELECT * FROM TRAVEL WHERE SITE_MONTH = ? ORDER BY RAND() LIMIT 1";
			PreparedStatement pictravel = conn.prepareStatement(sql);

		  pictravel.setString(1, String.valueOf(month));







			// SQL文を実行し、結果表を取得する
			ResultSet rs = pictravel.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Travel comment = new Travel(

				rs.getString("SITE_PLACE"),
				rs.getString("SITE_FOOD"),
				rs.getString("SITE_SPOT"),
				rs.getString("SITE_LOCATION"),
				rs.getString("SITE_HOTEL"),
				rs.getString("SITE_BUDGET"),
				rs.getString("SITE_IMAGE"),
				rs.getInt("SITE_MONTH")
				);
				travelList.add(comment);
			}

		}
		catch
			 (SQLException e) {
					e.printStackTrace();
					travelList = null;
				}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			travelList = null;
		}


		finally {
			// データベースを切断
			if (conn != null) {
			try {
				conn.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
				travelList = null;
			}
			}
		}



		return travelList;
	}
}
