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
	public List<Travel> select() {
		Connection conn = null;
		List<Travel> travelList = new ArrayList<Travel>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");
			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6_data/GandA", "sa", "");
			// SQL文を準備する
			String sql = "SELECT SITE_PLACE, SITE_FOOD, SITE_SPOT, SITE_LOCATION, SITE_HOTEL, SITE_BUDGET, SITE_IMAGE, SITE_MONTH FROM TRAVEL WHERE SITE_MONTH = 6 ORDER BY RAND() LIMIT 1";
			PreparedStatement pictravel = conn.prepareStatement(sql);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pictravel.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Travel comment = new Travel(

				rs.getString("site_place"),
				rs.getString("site_food"),
				rs.getString("site_spot"),
				rs.getString("site_location"),
				rs.getString("site_hotel"),
				rs.getString("site_budget"),
				rs.getString("site_image"),
				rs.getInt("site_month")
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
