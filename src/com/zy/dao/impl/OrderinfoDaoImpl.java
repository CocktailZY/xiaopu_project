package com.zy.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.zy.dao.IOrderinfoDao;
import com.zy.model.Order;
import com.zy.model.Orderinfo;

@Component(value="OrderinfoDao")
public class OrderinfoDaoImpl implements IOrderinfoDao {

	private SessionFactory sessionFactory;

	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public void save(Orderinfo dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void update(Orderinfo dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(dto);
		session.getTransaction().commit();
		session.close();
	}
	


	public void delete(Orderinfo dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.delete(dto);
		session.getTransaction().commit();
		session.close();
	}

	public Orderinfo get(int id) {
		Session session = sessionFactory.openSession();
		Orderinfo dto = (Orderinfo)session.get(Orderinfo.class, id);
		session.close();
		return dto;
	}

	public List<Orderinfo> list(Orderinfo dto) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Orderinfo");
		List<Orderinfo> list = query.list();
		session.close();
		return list;
	}

	public List<Orderinfo> listByOrder(int id) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Orderinfo where order.id="+id);
		List<Orderinfo> list = query.list();
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
	
	public List<Orderinfo> listPage(String hql, int pageNum, int row) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql);
		List<Orderinfo> list = query.setFirstResult((pageNum - 1) * row).setMaxResults(row).list();
		if (list != null && list.size() > 0) {
			return list;
		}
		session.close();
		return list;

	}

}
