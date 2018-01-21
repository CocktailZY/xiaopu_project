package com.zy.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.zy.dao.IGoodToSupplier;
import com.zy.model.GoodToSupplier;
import com.zy.model.Goods;
import com.zy.model.Supplier;
@Component(value="GoodToSupplierDao")
public class GoodToSupplierImpl implements IGoodToSupplier{

	private SessionFactory sessionFactory;

	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void save(GoodToSupplier dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void update(GoodToSupplier dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void delete(GoodToSupplier dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.delete(dto);
		session.getTransaction().commit();
		session.close();
	}

	public GoodToSupplier get(int id) {
		Session session = sessionFactory.openSession();
		GoodToSupplier dto = (GoodToSupplier)session.get(GoodToSupplier.class, id);
		session.close();
		return dto;
	}
	

	public List<GoodToSupplier> list(GoodToSupplier dto) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from GoodToSupplier");
		List<GoodToSupplier> list = query.list();
		session.close();
		return list;
	}

	public List<GoodToSupplier> listByGoodId(int id) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from GoodToSupplier where goods.id="+id);
		List<GoodToSupplier> list = query.list();
		session.close();
		return list;
	}

	public List<GoodToSupplier> listBySupId(int id) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from GoodToSupplier where supplier.id="+id);
		List<GoodToSupplier> list = query.list();
		session.close();
		return list;
	}
	
	public GoodToSupplier getByPG(String jp, int goodId){
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from GoodToSupplier where jprice='"+jp+"' and goods.id="+goodId);
		List<GoodToSupplier> list = query.list();
		GoodToSupplier sup = new GoodToSupplier();
		if(list.size()>0){
			sup=list.get(0);
		}
		session.close();
		return sup;
	}
	
}
