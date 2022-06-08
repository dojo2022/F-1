package model;
import java.io.Serializable;

public class Bc implements Serializable {
	private String number;	// NUMBER
	private String name;	// NAME
	private String address;	// ADDRESS
	private String company;
	private String deploy;
	private String position;
	private String zipcode;
	private String phone;
	private String fax;
	private String email;
	private String remarks;

	public Bc(String number, String name, String address, String company, String deploy, String position, String zipcode, String phone, String fax, String email, String remarks) {
		this.number = number;
		this.name = name;
		this.address = address;
		this.company = company;
		this.deploy = deploy;
		this.position = position;
		this.zipcode = zipcode;
		this.phone = phone;
		this.fax = fax;
		this.email = email;
		this.remarks = remarks;
	}

	public Bc() {
		this.number = "";
		this.name = "";
		this.address = "";
		this.company = "";
		this.deploy = "";
		this.position = "";
		this.zipcode = "";
		this.phone = "";
		this.fax = "";
		this.email = "";
		this.remarks = "";
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getDeploy() {
		return deploy;
	}

	public void setDeploy(String deploy) {
		this.deploy = deploy;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

}
