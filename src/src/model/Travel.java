package model;

import java.io.Serializable;

public class Travel implements Serializable {
	private String sitePlace;
	private String siteFood;
	private String siteSpot;
	private String siteLocation;
	private String siteHotel;
	private String siteBudget;
	private String siteImage;
	private int siteMonth;

	public Travel(String sitePlace, String siteFood, String siteSpot, String siteLocation,
			String siteHotel, String siteBudget, String siteImage, int siteMonth) {
		this.sitePlace = sitePlace;
		this.siteFood = siteFood;
		this.siteSpot = siteSpot;
		this.siteLocation = siteLocation;
		this.siteHotel = siteHotel;
		this.siteBudget = siteBudget;
		this.siteImage = siteImage;
		this.siteMonth = siteMonth;
	}

	public Travel() {
		this.sitePlace = "";
		this.siteFood = "";
		this.siteSpot = "";
		this.siteLocation = "";
		this.siteHotel = "";
		this.siteBudget = "";
		this.siteImage = "";
		this.siteMonth = 0;
	}

	public String getSitePlace() {
		return sitePlace;
	}

	public void setSitePlace(String sitePlace) {
		this.sitePlace = sitePlace;
	}

	public String getSiteFood() {
		return siteFood;
	}

	public void setSiteFood(String siteFood) {
		this.siteFood = siteFood;
	}

	public String getSiteSpot() {
		return siteSpot;
	}

	public void setSiteSpot(String siteSpot) {
		this.siteSpot = siteSpot;
	}

	public String getSiteLocation() {
		return siteLocation;
	}

	public void setSiteLocation(String siteLocation) {
		this.siteLocation = siteLocation;
	}

	public String getSiteHotel() {
		return siteHotel;
	}

	public void setSiteHotel(String siteHotel) {
		this.siteHotel = siteHotel;
	}

	public String getSiteBudget() {
		return siteBudget;
	}

	public void setSiteBudget(String siteBudget) {
		this.siteBudget = siteBudget;
	}

	public String getSiteImage() {
		return siteImage;
	}

	public void setSiteImage(String siteImage) {
		this.siteImage = siteImage;
	}

	public int getSiteMonth() {
		return siteMonth;
	}

	public void setSiteMonth(int siteMonth) {
		this.siteMonth = siteMonth;
	}

}
