package model;

import java.io.Serializable;

public class LoginUser implements Serializable {
	private int id;	// ログイン時のID

	public LoginUser() {
		this.id=0;
	}

	public LoginUser(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setUserId(int id) {
		this.id = id;
	}
}
