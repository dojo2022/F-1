package model;

import java.io.Serializable;

public class Schedule implements Serializable {
	private int id;
	private String date;
	private String sub;
	private String tittle;

	public Schedule(int id, String date, String sub,String tittle) {
		this.id = id;
		this.date = date;
		this.sub = sub;
		this.tittle = tittle;
	}

	public Schedule() {
		this.id = -1;
		this.date = "";
		this.sub = "";
		this.tittle = "";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
