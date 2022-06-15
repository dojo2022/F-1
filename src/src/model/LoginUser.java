package model;

import java.io.Serializable;

public class LoginUser implements Serializable {
	private int id;// ID
	private String user_id;// ログイン時のUSER

	public LoginUser() {
		this.user_id="";
	}

	public LoginUser(String user_id) {
		this.user_id = user_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserId() {
		return user_id;
	}

	public void setId(String user_id) {
		this.user_id = user_id;
	}

}
