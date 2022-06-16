package model;

import java.io.Serializable;

public class LoginUser implements Serializable {
	private int id;// ID
	private String userId;// ログイン時のUSER

	public LoginUser() {
		this.userId="";
	}

	public LoginUser(String userId) {
		this.userId = userId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setId(String userId) {
		this.userId = userId;
	}

}
