package com.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Doctor {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int dId;
	private String dName;
	private String dspecilization;
	private String email;
	private String city;
	private String country;
	private Date joinDate;

	public Doctor() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Doctor(int dId, String dName, String dspecilization, String email, String city, String country,
			Date joinDate) {
		super();
		this.dId = dId;
		this.dName = dName;
		this.dspecilization = dspecilization;
		this.email = email;
		this.city = city;
		this.country = country;
		this.joinDate = joinDate;
	}

	public int getdId() {
		return dId;
	}

	public void setdId(int dId) {
		this.dId = dId;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	public String getDspecilization() {
		return dspecilization;
	}

	public void setDspecilization(String dspecilization) {
		this.dspecilization = dspecilization;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
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

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.dId + ", " + this.dName + ", " + this.dspecilization + ", " + this.email + ", " + this.city + ","
				+ this.country + ", " + this.joinDate;
	}
}
