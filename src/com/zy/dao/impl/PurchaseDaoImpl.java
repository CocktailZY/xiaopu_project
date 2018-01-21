package com.zy.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.zy.dao.IPurchaseDao;
import com.zy.model.Purchase;
import com.zy.model.Role;

@Component(value="PurchaseDao")
public class PurchaseDaoImpl implements IPurchaseDao{

	private SessionFactory sessionFactory;

	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void save(Purchase dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void update(Purchase dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void delete(Purchase dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.delete(dto);
		session.getTransaction().commit();
		session.close();
	}

	public Purchase get(int id) {
		Session session = sessionFactory.openSession();
		Purchase dto = (Purchase)session.get(Purchase.class, id);
		session.close();
		return dto;
	}

	public List<Purchase> list(Purchase dto) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Purchase");
		List<Purchase> list = query.list();
		session.close();
		return list;
	}
	
	public List<Purchase> listByUserId(int id) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Purchase where user.id="+id);
		List<Purchase> list = query.list();
		session.close();
		return list;
	}
	
	public List<Purchase> listByRoleId(int id) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Purchase where role.id="+id);
		List<Purchase> list = query.list();
		session.close();
		return list;
	}

	public Purchase getByGoodId(int id) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Purchase where goods.id="+id);
		List<Purchase> list = query.list();
		Purchase dto = new Purchase();
		if(list.size()>0){
			dto = list.get(0);
		}
		session.close();
		return dto;
	}
	
	public Purchase getByGUId(int goodId,int userId) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Purchase where goods.id="+goodId+"and user.id="+userId);
		List<Purchase> list = query.list();
		Purchase dto = new Purchase();
		if(list.size()>0){
			dto = list.get(0);
		}
		session.close();
		return dto;
	}

	public int count(String hql) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql);
		Number count=(Number) query.uniqueResult();
		session.close();
		return count.intValue();

	}
	
	public List<Purchase> listPage(String hql, int pageNum, int row) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql);
		List<Purchase> list = query.setFirstResult((pageNum - 1) * row).setMaxResults(row).list();
		if (list != null && list.size() > 0) {
			return list;
		}
		session.close();
		return list;

	}
	
}
