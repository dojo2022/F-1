package model;

import java.io.Serializable;

public class Recipe implements Serializable {
	private String nameDish;
	private String genre;
	private String ingredient;
	private int timeCooking;
	private String season;
	private String subRecipe;
	private String imageRecipe;

	public Recipe(String nameDish, String genre, String ingredient, int timeCooking,
			String season, String subRecipe, String imageRecipe) {
		this.nameDish = nameDish;
		this.genre = genre;
		this.ingredient = ingredient;
		this.timeCooking = timeCooking;
		this.season = season;
		this.subRecipe = subRecipe;
		this.imageRecipe = imageRecipe;
	}

	public Recipe() {
		this.nameDish = "";
		this.genre = "";
		this.ingredient = "";
		this.timeCooking = 0;
		this.season = "";
		this.subRecipe = "";
		this.imageRecipe = "";
	}

	public String getNameDish() {
		return nameDish;
	}

	public void setNameDish(String nameDish) {
		this.nameDish = nameDish;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getIngredient() {
		return ingredient;
	}

	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}

	public int getTimeCooking() {
		return timeCooking;
	}

	public void setTimeCooking(int timeCooking) {
		this.timeCooking = timeCooking;
	}

	public String getSeason() {
		return season;
	}

	public void setSeason(String season) {
		this.season = season;
	}

	public String getSubRecipe() {
		return subRecipe;
	}

	public void setSubRecipe(String subRecipe) {
		this.subRecipe = subRecipe;
	}

	public String getImageRecipe() {
		return imageRecipe;
	}

	public void setImageRecipe(String imageRecipe) {
		this.imageRecipe = imageRecipe;
	}

}
