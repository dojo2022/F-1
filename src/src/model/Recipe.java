package model;

import java.io.Serializable;

public class Recipe implements Serializable {
	private String nameDish;
	private String genre;
	private String ingredient;
	private String timeCooking;
	private String link;
	private String subRecipe;
	private String imageRecipe;

	public Recipe(String nameDish, String genre, String ingredient, String timeCooking,
			String link, String subRecipe, String imageRecipe) {
		this.nameDish = nameDish;
		this.genre = genre;
		this.ingredient = ingredient;
		this.timeCooking = timeCooking;
		this.link = link;
		this.subRecipe = subRecipe;
		this.imageRecipe = imageRecipe;
	}

	public Recipe() {
		this.nameDish = "";
		this.genre = "";
		this.ingredient = "";
		this.timeCooking = "";
		this.link = "";
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

	public String getTimeCooking() {
		return timeCooking;
	}

	public void setTimeCooking(String timeCooking) {
		this.timeCooking = timeCooking;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
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
