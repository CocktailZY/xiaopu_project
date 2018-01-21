package com.zy.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.zy.dao.IOrderDao;
import com.zy.model.Order;
import com.zy.model.Users;
@Component(value="OrderDao")
public class OrderDaoImpl implements IOrderDao {

	private SessionFactory sessionFactory;

	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public void save(Order dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void update(Order dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void delete(Order dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.delete(dto);
		session.getTransaction().commit();
		session.close();
	}

	public Order get(int id) {
		Session session = sessionFactory.openSession();
		Order dto = (Order)session.get(Order.class, id);
		session.close();
		return dto;
	}

	public List<Order> listByTypeId(int id,int userId) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Order where orderType.id="+id+" and user.id="+userId);
		List<Order> list = query.list();
		session.close();
		return list;
	}
	
	public List<Order> list(Order dto) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Order");
		List<Order> list = query.list();
		session.close();
		return list;
	}
	
	public List<Order> listByType(int id) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Order where orderType.id="+id);
		List<Order> list = query.list();
		session.close();
		return list;
	}

	public int count(String hql) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql);
		Number count=(Number) query.uniqueResult();
		session.close();
		return count.intValue();

	}

	public List<Order> listPage(String hql, int pageNum, int row) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql);
		List<Order> list = query.setFirstResult((pageNum - 1) * row).setMaxResults(row).list();
		if (list != null && list.size() > 0) {
			return list;
		}
		session.close();
		return list;

	}

}
