package com.zy.dao.impl;

import java.util.List;

import javax.annotation.Resource;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.zy.dao.IOrderTypeDao;
import com.zy.model.OrderType;

@Component(value="OrderTypeDao")
public class OrderTypeDaoImpl implements IOrderTypeDao{
	private SessionFactory sessionFactory;

	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void save(OrderType dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void update(OrderType dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void delete(OrderType dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.delete(dto);
		session.getTransaction().commit();
		session.close();
	}

	public OrderType get(int id) {
		Session session = sessionFactory.openSession();
		OrderType dto = (OrderType)session.get(OrderType.class, id);
		session.close();
		return dto;
	}

	public List<OrderType> list(OrderType dto) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from OrderType");
		List<OrderType> list = query.list();
		session.close();
		return list;
	}

}
