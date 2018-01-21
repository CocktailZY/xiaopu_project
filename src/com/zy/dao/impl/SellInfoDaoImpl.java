package com.zy.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.zy.dao.ISellInfoDao;
import com.zy.model.Car;
import com.zy.model.SellInfo;
@Component(value="SellInfoDao")
public class SellInfoDaoImpl implements ISellInfoDao {

	private SessionFactory sessionFactory;

	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public void save(SellInfo dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void update(SellInfo dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void delete(SellInfo dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.delete(dto);
		session.getTransaction().commit();
		session.close();
	}

	public SellInfo get(int id) {
		Session session = sessionFactory.openSession();
		SellInfo dto = (SellInfo)session.get(SellInfo.class, id);
		session.close();
		return dto;
	}

	public List<SellInfo> list(SellInfo dto) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from SellInfo");
		List<SellInfo> list = query.list();
		session.close();
		return list;
	}

	public List<SellInfo> listBySellId(int id) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from SellInfo where sell.id="+id);
		List<SellInfo> list = query.list();
		session.close();
		return list;
	}

}
