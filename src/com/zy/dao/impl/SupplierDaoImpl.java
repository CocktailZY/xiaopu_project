package com.zy.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.zy.dao.ISupplierDao;
import com.zy.model.Goods;
import com.zy.model.Supplier;
@Component(value="SupplierDao")
public class SupplierDaoImpl implements ISupplierDao {

	private SessionFactory sessionFactory;

	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public void save(Supplier dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(dto);
		session.getTransaction().commit();
		session.close();

	}

	public void update(Supplier dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(dto);
		session.getTransaction().commit();
		session.close();

	}

	public void delete(Supplier dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.delete(dto);
		session.getTransaction().commit();
		session.close();
	}

	public Supplier get(int id) {
		Session session = sessionFactory.openSession();
		Supplier dto = (Supplier)session.get(Supplier.class, id);
		session.close();
		return dto;
	}

	public List<Supplier> list(Supplier dto) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Supplier");
		List<Supplier> list = query.list();
		session.close();
		return list;
	}
	
	

}
