package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Bc;

public class BcDAO {
	// 引数paramで検索項目を指定し、検索結果のリストを返す
	public List<Bc> select(Bc param) {
		Connection conn = null;
		List<Bc> cardList = new ArrayList<Bc>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/simpleBC", "sa", "");

			// SQL文を準備する
			String sql = "select NUMBER, NAME, ADDRESS, COMPANY, DEPLOY, POSITION, ZIPCODE, PHONE, FAX, EMAIL, REMARKS from BC WHERE NUMBER LIKE ? AND NAME LIKE ? AND ADDRESS LIKE ? AND COMPANY LIKE ? AND DEPLOY LIKE ? AND POSITION LIKE ? AND ZIPCODE LIKE ? AND PHONE LIKE ? AND FAX LIKE ? AND EMAIL LIKE ? AND REMARKS LIKE ? ORDER BY NUMBER";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (param.getNumber() != null) {
				pStmt.setString(1, "%" + param.getNumber() + "%");
			}
			else {
				pStmt.setString(1, "%");
			}
			if (param.getName() != null) {
				pStmt.setString(2, "%" + param.getName() + "%");
			}
			else {
				pStmt.setString(2, "%");
			}
			if (param.getAddress() != null) {
				pStmt.setString(3, "%" + param.getAddress() + "%");
			}
			else {
				pStmt.setString(3, "%");
			}
			if (param.getCompany() != null) {
				pStmt.setString(4, "%" + param.getCompany() + "%");
			}
			else {
				pStmt.setString(4, "%");
			}
			if (param.getDeploy() != null) {
				pStmt.setString(5, "%" + param.getDeploy() + "%");
			}
			else {
				pStmt.setString(5, "%");
			}
			if (param.getPosition() != null) {
				pStmt.setString(6, "%" + param.getPosition() + "%");
			}
			else {
				pStmt.setString(6, "%");
			}
			if (param.getZipcode() != null) {
				pStmt.setString(7, "%" + param.getZipcode() + "%");
			}
			else {
				pStmt.setString(7, "%");
			}
			if (param.getPhone() != null) {
				pStmt.setString(8, "%" + param.getPhone() + "%");
			}
			else {
				pStmt.setString(8, "%");
			}
			if (param.getFax() != null) {
				pStmt.setString(9, "%" + param.getFax() + "%");
			}
			else {
				pStmt.setString(9, "%");
			}
			if (param.getEmail() != null) {
				pStmt.setString(10, "%" + param.getEmail() + "%");
			}
			else {
				pStmt.setString(10, "%");
			}
			if (param.getRemarks() != null) {
				pStmt.setString(11, "%" + param.getRemarks() + "%");
			}
			else {
				pStmt.setString(11, "%");
			}

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Bc card = new Bc(
				rs.getString("NUMBER"),
				rs.getString("NAME"),
				rs.getString("ADDRESS"),
				rs.getString("COMPANY"),
				rs.getString("DEPLOY"),
				rs.getString("POSITION"),
				rs.getString("ZIPCODE"),
				rs.getString("PHONE"),
				rs.getString("FAX"),
				rs.getString("EMAIL"),
				rs.getString("REMARKS")
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
	public boolean insert(Bc card) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/simpleBC", "sa", "");

			// SQL文を準備する
			String sql = "insert into BC (NUMBER, NAME, ADDRESS, COMPANY, DEPLOY, POSITION, ZIPCODE, PHONE, FAX, EMAIL, REMARKS) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (card.getNumber() != null && !card.getNumber().equals("")) {
				pStmt.setString(1, card.getNumber());
			}
			else {
				pStmt.setString(1, "");
			}
			if (card.getName() != null && !card.getName().equals("")) {
				pStmt.setString(2, card.getName());
			}
			else {
				pStmt.setString(2, "");
			}
			if (card.getAddress() != null && !card.getAddress().equals("")) {
				pStmt.setString(3, card.getAddress());
			}
			else {
				pStmt.setString(3, "");
			}
			if (card.getCompany() != null && !card.getCompany().equals("")) {
				pStmt.setString(4, card.getCompany());
			}
			else {
				pStmt.setString(4, "");
			}
			if (card.getDeploy() != null && !card.getDeploy().equals("")) {
				pStmt.setString(5, card.getDeploy());
			}
			else {
				pStmt.setString(5, "");
			}
			if (card.getPosition() != null && !card.getPosition().equals("")) {
				pStmt.setString(6, card.getPosition());
			}
			else {
				pStmt.setString(6, "");
			}
			if (card.getZipcode() != null && !card.getZipcode().equals("")) {
				pStmt.setString(7, card.getZipcode());
			}
			else {
				pStmt.setString(7, "");
			}
			if (card.getPhone() != null && !card.getPhone().equals("")) {
				pStmt.setString(8, card.getPhone());
			}
			else {
				pStmt.setString(8, "");
			}
			if (card.getFax() != null && !card.getFax().equals("")) {
				pStmt.setString(9, card.getFax());
			}
			else {
				pStmt.setString(9, "");
			}
			if (card.getEmail() != null && !card.getEmail().equals("")) {
				pStmt.setString(10, card.getEmail());
			}
			else {
				pStmt.setString(10, "");
			}
			if (card.getRemarks() != null && !card.getRemarks().equals("")) {
				pStmt.setString(11, card.getRemarks());
			}
			else {
				pStmt.setString(11, "");
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
	public boolean update(Bc card) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/simpleBC", "sa", "");

			// SQL文を準備する
			String sql = "update BC set NAME=?, ADDRESS=?, COMPANY=?, DEPLOY=?, POSITION=?, ZIPCODE=?, PHONE=?, FAX=?, EMAIL=?, REMARKS=? where NUMBER=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (card.getName() != null && !card.getName().equals("")) {
				pStmt.setString(1, card.getName());
			}
			else {
				pStmt.setString(1, "");
			}
			if (card.getAddress() != null && !card.getAddress().equals("")) {
				pStmt.setString(2, card.getAddress());
			}
			else {
				pStmt.setString(2, "");
			}
			if (card.getCompany() != null && !card.getCompany().equals("")) {
				pStmt.setString(3, card.getCompany());
			}
			else {
				pStmt.setString(3, "");
			}
			if (card.getDeploy() != null && !card.getDeploy().equals("")) {
				pStmt.setString(4, card.getDeploy());
			}
			else {
				pStmt.setString(4, "");
			}
			if (card.getPosition() != null && !card.getPosition().equals("")) {
				pStmt.setString(5, card.getPosition());
			}
			else {
				pStmt.setString(5, "");
			}
			if (card.getZipcode() != null && !card.getZipcode().equals("")) {
				pStmt.setString(6, card.getZipcode());
			}
			else {
				pStmt.setString(6, "");
			}
			if (card.getPhone() != null && !card.getPhone().equals("")) {
				pStmt.setString(7, card.getPhone());
			}
			else {
				pStmt.setString(7, "");
			}
			if (card.getFax() != null && !card.getFax().equals("")) {
				pStmt.setString(8, card.getFax());
			}
			else {
				pStmt.setString(8, "");
			}
			if (card.getEmail() != null && !card.getEmail().equals("")) {
				pStmt.setString(9, card.getEmail());
			}
			else {
				pStmt.setString(9, "");
			}
			if (card.getRemarks() != null && !card.getRemarks().equals("")) {
				pStmt.setString(10, card.getRemarks());
			}
			else {
				pStmt.setString(10, "");
			}
			pStmt.setString(11, card.getNumber());

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
	public boolean delete(String number) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/simpleBC", "sa", "");

			// SQL文を準備する
			String sql = "delete from BC where NUMBER=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setString(1, number);

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



