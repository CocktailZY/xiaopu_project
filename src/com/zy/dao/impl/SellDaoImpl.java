package com.zy.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.zy.dao.ISellDao;
import com.zy.model.Role;
import com.zy.model.Sell;
@Component(value="SellDao")
public class SellDaoImpl implements ISellDao {

	private SessionFactory sessionFactory;

	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	
	public void save(Sell dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void update(Sell dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void delete(Sell dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.delete(dto);
		session.getTransaction().commit();
		session.close();
	}

	public Sell get(int id) {
		Session session = sessionFactory.openSession();
		Sell dto = (Sell)session.get(Sell.class, id);
		session.close();
		return dto;
	}

	public List<Sell> list(Sell dto) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Sell");
		List<Sell> list = query.list();
		session.close();
		return list;
	}
	public List<Sell> listByCusId(int id) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Sell where customer.id="+id);
		List<Sell> list = query.list();
		session.close();
		return list;
	}

}
