package model;

import java.io.Serializable;

public class Schedule implements Serializable {
	private int id;
	private String date;
	private String sub;

	public Schedule(int id, String date, String sub) {
		this.id = id;
		this.date = date;
		this.sub = sub;
	}

	public Schedule() {
		this.id = -1;
		this.date = "";
		this.sub = "";
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

}
