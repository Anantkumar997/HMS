package com.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.entities.Patient;
import com.entities.User;

@Component
public class UserDao {

	@Autowired
	HibernateTemplate hibernateTemplate;

	@Transactional
	public void save(User user) {
		this.hibernateTemplate.saveOrUpdate(user);
	}

	public List<User> getAll() {
		List<User> users = this.hibernateTemplate.loadAll(User.class);
		return users;
	}

	// delete the single Entry

	@Transactional
	public void delete(int userId) {
		User user = this.hibernateTemplate.load(User.class, userId);
		this.hibernateTemplate.delete(user);
	}

	// get the Single product
	public User getPatient(int userId) {
		return this.hibernateTemplate.get(User.class, userId);
	}
}
