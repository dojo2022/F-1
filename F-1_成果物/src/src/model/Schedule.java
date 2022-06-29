package model;

import java.io.Serializable;

public class Schedule implements Serializable {
	private String user;
	private String date;
	private String sub;
	private String title;
	private String startTime;
	private String endTime;

	public Schedule(String user, String date, String sub,String title,String startTime,String endTime) {
		this.user = user;
		this.date = date;
		this.sub = sub;
		this.title = title;
		this.startTime = startTime;
		this.endTime = endTime;
	}

	public Schedule() {
		this.user = "";
		this.date = "";
		this.sub = "";
		this.title = "";
		this.startTime = "";
		this.endTime = "";
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
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
}
