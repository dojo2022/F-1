package model;

import java.io.Serializable;
import java.util.Date;

public class Schedule implements Serializable {
	private int id;
	private Date date;
	private String sub;

	public Schedule(int id, Date date, String sub) {
		this.id = id;
		this.date = date;
		this.sub = sub;
	}

	public Schedule() {
		this.id = 0;
		this.date = new Date();
		this.sub = "";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getSub() {
		return sub;
	}

	public void setSub(String sub) {
		this.sub = sub;
	}

}
