package com.zy.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.zy.dao.IGoodsTypeDao;
import com.zy.model.Goods;
import com.zy.model.GoodsType;
@Component(value="GoodTypeDao")
public class GoodsTypeDaoImpl implements IGoodsTypeDao {

	private SessionFactory sessionFactory;

	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public void save(GoodsType dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void update(GoodsType dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void delete(GoodsType dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.delete(dto);
		session.getTransaction().commit();
		session.close();
	}

	public GoodsType get(int id) {
		Session session = sessionFactory.openSession();
		GoodsType dto = (GoodsType)session.get(GoodsType.class, id);
		session.close();
		return dto;
	}

	public List<GoodsType> list(GoodsType dto) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from GoodsType");
		List<GoodsType> list = query.list();
		session.close();
		return list;
	}

}
