package com.zy.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.zy.dao.IEntrepotDao;
import com.zy.model.Entrepot;
import com.zy.model.Role;
@Component(value="EntrepotDao")
public class EntrepotDaoImpl implements IEntrepotDao {

	private SessionFactory sessionFactory;

	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public void save(Entrepot dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void update(Entrepot dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void delete(Entrepot dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.delete(dto);
		session.getTransaction().commit();
		session.close();
	}

	public Entrepot get(int id) {
		Session session = sessionFactory.openSession();
		Entrepot dto = (Entrepot)session.get(Entrepot.class, id);
		session.close();
		return dto;
	}

	public List<Entrepot> list(Entrepot dto) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Entrepot");
		List<Entrepot> list = query.list();
		session.close();
		return list;
	}

}
