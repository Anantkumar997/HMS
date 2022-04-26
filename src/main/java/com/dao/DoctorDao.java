package com.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.entities.Asset;
import com.entities.Doctor;

@Component
public class DoctorDao {

	@Autowired
	HibernateTemplate hibernateTemplate;

	@Transactional
	public void save(Doctor dr) {
		this.hibernateTemplate.saveOrUpdate(dr);
	}

	public List<Doctor> getAll() {
		List<Doctor> doctors = this.hibernateTemplate.loadAll(Doctor.class);
		return doctors;
	}

	// delete the single Entry

	@Transactional
	public void delete(int dId) {
		Doctor dr = this.hibernateTemplate.load(Doctor.class, dId);
		this.hibernateTemplate.delete(dr);
	}

	// get the Single product
	public Doctor getDoctor(int dId) {
		return this.hibernateTemplate.get(Doctor.class, dId);
	}
}
