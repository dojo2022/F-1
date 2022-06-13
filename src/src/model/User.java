package model;

import java.io.Serializable;

public class User implements Serializable {
	private int id;
	private String user;
	private String userId;
	private String password;

	public User(int id, String user, String userId, String password) {
		this.id = id;
		this.user = user;
		this.userId = userId;
		this.password = password;
	}

	public User() {
		this.id = -1;
		this.user = "";
		this.userId = "";
		this.password = "";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
