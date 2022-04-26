package com.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Patient {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int pId;
	private String pName;
	private String disease;
	private int bedNo;
	private String bedType;
	private String email;
	private String city;
	private String country;

	public Patient() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Patient(int pId, String pName, String disease, String email, String city, String country, int bedNo,
			String bedType) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.disease = disease;
		this.bedNo = bedNo;
		this.bedType = bedType;
		this.email = email;
		this.city = city;
		this.country = country;
	}

	public int getBedNo() {
		return bedNo;
	}

	public void setBedNo(int bedNo) {
		this.bedNo = bedNo;
	}

	public String getBedType() {
		return bedType;
	}

	public void setBedType(String bedType) {
		this.bedType = bedType;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getDisease() {
		return disease;
	}

	public void setDisease(String disease) {
		this.disease = disease;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.pId + ", " + this.pName + ", " + this.email + ", " + this.city + "," + this.country;
	}

}
