package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Recipe;

public class RecipeDAO {
    // 引数paramで検索項目を指定し、検索結果のリストを返す
	public List<Recipe> select(Recipe param) {
		Connection conn = null;
		List<Recipe> recipeList = new ArrayList<Recipe>();

        try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6_data/GandA", "sa", "");

			String sql;
			PreparedStatement pStmt;
			// SQL文を準備する
			if(param.getTimeCooking() != 0){
				sql = "SELECT name_dish, genre, ingredient, time_cooking, season, sub_recipe, image_recipe FROM RECIPE_SHOW WHERE name_dish LIKE ? AND genre LIKE ? AND ingredient LIKE ? AND time_cooking = ? ORDER BY name_dish";
				pStmt = conn.prepareStatement(sql);
			}else {
				sql = "SELECT name_dish, genre, ingredient, time_cooking, season, sub_recipe, image_recipe FROM RECIPE_SHOW WHERE name_dish LIKE ? AND genre LIKE ? AND ingredient LIKE ? AND time_cooking >= 0 ORDER BY name_dish";
				pStmt = conn.prepareStatement(sql);
			}
			// SQL文を完成させる
			if (param.getTimeCooking() != 0) {
				pStmt.setInt(4, param.getTimeCooking());
			}

			if (param.getNameDish() != null) {
				pStmt.setString(1, "%" + param.getNameDish() + "%");
			}
			else {
				pStmt.setString(1, "%");
			}
            if (param.getGenre() != null) {
				pStmt.setString(2, "%" + param.getGenre() + "%");
			}
			else {
				pStmt.setString(2, "%");
			}
            if (param.getIngredient() != null) {
				pStmt.setString(3, "%" + param.getIngredient() + "%");
			}
			else {
				pStmt.setString(3, "%");
			}

//			if (param.getNameDish() != null) {
//				pStmt.setString(1, "%" + param.getNameDish() + "%");
//			}
//			else {
//				pStmt.setString(1, "%");
//			}
//            if (param.getGenre() != null) {
//				pStmt.setString(2, "%" + param.getGenre() + "%");
//			}
//			else {
//				pStmt.setString(2, "%");
//			}
//            if (param.getIngredient() != null) {
//				pStmt.setString(3, "%" + param.getIngredient() + "%");
//			}
//			else {
//				pStmt.setString(3, "%");
//			}
//            if (param.getTimeCooking() != 0) {
//				pStmt.setString(4, "%" + param.getTimeCooking() + "%");
//			}
//			else {
//				pStmt.setString(4, "%");
//			}

            // SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Recipe recipe = new Recipe(
				rs.getString("name_dish"),
				rs.getString("genre"),
				rs.getString("ingredient"),
				rs.getInt("time_cooking"),
				rs.getString("season"),
				rs.getString("sub_recipe"),
				rs.getString("image_recipe")
				);
				recipeList.add(recipe);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			recipeList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			recipeList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					recipeList = null;
				}
			}
		}

		// 結果を返す
		return recipeList;
	}


}
