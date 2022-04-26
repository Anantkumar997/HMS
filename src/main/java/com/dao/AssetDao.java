package com.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.entities.Asset;

@Component
public class AssetDao {
	@Autowired
	HibernateTemplate hibernateTemplate;

	@Transactional
	public void save(Asset as) {
		this.hibernateTemplate.saveOrUpdate(as);
	}

	// get all data
	public List<Asset> getAll() {
		List<Asset> assets = this.hibernateTemplate.loadAll(Asset.class);
		return assets;
	}

	// delete the single Entry

	@Transactional
	public void delete(int id) {
		Asset as = this.hibernateTemplate.load(Asset.class, id);
		this.hibernateTemplate.delete(as);
	}

	// get the Single product
	public Asset getAsset(int id) {
		return this.hibernateTemplate.get(Asset.class, id);
	}

}
