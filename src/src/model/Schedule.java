package model;

import java.io.Serializable;

public class Schedule implements Serializable {
	private String user;
	private String date;
	private String sub;
	private String tittle;

	public Schedule(String user, String date, String sub,String tittle) {
		this.user = user;
		this.date = date;
		this.sub = sub;
		this.tittle = tittle;
	}

	public Schedule() {
		this.user = "";
		this.date = "";
		this.sub = "";
		this.tittle = "";
	}

	public String getUser() {
		return user;
	}

	public void setId(String user) {
		this.user = user;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getSub() {
		return sub;
	}

	public void setSub(String sub) {
		this.sub = sub;
	}
	public String getTittle() {
		return tittle;
	}

	public void setTittle(String tittle) {
		this.tittle = tittle;
	}
}
