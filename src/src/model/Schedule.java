package model;

import java.io.Serializable;

public class Schedule implements Serializable {
	private String user;
	private String date;
	private String sub;
	private String tittle;
	private String start_time;
	private String end_time;

	public Schedule(String user, String date, String sub,String tittle,String start_time,String end_time) {
		this.user = user;
		this.date = date;
		this.sub = sub;
		this.tittle = tittle;
		this.start_time = start_time;
		this.end_time = end_time;
	}

	public Schedule() {
		this.user = "";
		this.date = "";
		this.sub = "";
		this.tittle = "";
		this.start_time = "";
		this.end_time = "";
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
	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
}
