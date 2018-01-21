package com.zy.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.zy.dao.IGoodDao;
import com.zy.model.Goods;
import com.zy.util.PageBean;
@Component(value="GoodDao")
public class GoodsDaoImpl implements IGoodDao {

	private SessionFactory sessionFactory;

	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public void save(Goods dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void update(Goods dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void delete(Goods dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.delete(dto);
		session.getTransaction().commit();
		session.close();
	}

	public Goods get(int id) {
		Session session = sessionFactory.openSession();
		Goods dto = (Goods)session.get(Goods.class, id);
		session.close();
		return dto;
	}
	
	public List<Goods> list(Goods dto) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Goods");
		List<Goods> list = query.list();
		session.close();
		return list;
	}

	public List<Goods> list(Goods dto, PageBean page) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Goods");
		query.setFirstResult(page.getRowStart());
		query.setMaxResults(page.getPageSize());
		List<Goods> list = query.list();
		session.close();
		return list;
	}
	
	public List<Goods> listPage(int status, PageBean page) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Goods where status="+status);
		query.setFirstResult(page.getRowStart());
		query.setMaxResults(page.getPageSize());
		List<Goods> list = query.list();
		session.close();
		return list;
	}
	
	public List<Goods> listByStatus(int status) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Goods where status="+status);
		List<Goods> list = query.list();
		session.close();
		return list;
	}

	public List<Goods> listBySupId(int id) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Goods where supplier.id="+id);
		List<Goods> list = query.list();
		session.close();
		return list;
	}

}
