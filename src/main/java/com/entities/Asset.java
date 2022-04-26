package com.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Asset {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String type;
	private String quantity;
	private String avl;

	public Asset() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Asset(int id, String type, String quantity, String avl) {
		super();
		this.id = id;
		this.type = type;
		this.quantity = quantity;
		this.avl = avl;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getquantity() {
		return quantity;
	}

	public void setquantity(String quantity) {
		this.quantity = quantity;
	}

	public String getAvl() {
		return avl;
	}

	public void setAvl(String avl) {
		this.avl = avl;
	}

	@Override
	public String toString() {
		return "Asset [id=" + id + ", type=" + type + ", quantity=" + quantity + ", avl=" + avl + "]";
	}

}
