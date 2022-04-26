package com.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.entities.Doctor;
import com.entities.Patient;

@Component
public class PatientDao {

	@Autowired
	HibernateTemplate hibernateTemplate;

	@Transactional
	public void save(Patient ps) {
		this.hibernateTemplate.saveOrUpdate(ps);

	}

	public List<Patient> getAll() {
		List<Patient> patients = this.hibernateTemplate.loadAll(Patient.class);
		return patients;
	}

	// delete the single Entry

	@Transactional
	public void delete(int pId) {
		Patient ps = this.hibernateTemplate.load(Patient.class, pId);
		this.hibernateTemplate.delete(ps);
	}

	// get the Single product
	public Patient getPatient(int pId) {
		return this.hibernateTemplate.get(Patient.class, pId);
	}
}
