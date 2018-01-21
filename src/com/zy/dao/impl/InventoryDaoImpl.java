package com.zy.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.zy.dao.IInventoryDao;
import com.zy.model.Inventory;
import com.zy.model.Purchase;
import com.zy.model.Users;

/**
 * 库存Dao实现
 * @author lenovo
 *
 */
@Component(value="InventoryDao")
public class InventoryDaoImpl implements IInventoryDao{

	private SessionFactory sessionFactory;

	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public void save(Inventory dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void update(Inventory dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void delete(Inventory dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(dto);
		session.getTransaction().commit();
		session.close();
	}

	public Inventory get(int id) {
		Session session = sessionFactory.openSession();
		Inventory dto = (Inventory)session.get(Inventory.class, id);
		session.close();
		return dto;
	}

	public List<Inventory> list(Inventory dto) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Inventory");
		List<Inventory> list = query.list();
		session.close();
		return list;
	}

	public Inventory listByGoodId(int id, int eId) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Inventory where goods.id="+id+" and entrepot.id="+eId);
		List<Inventory> list = query.list();
		Inventory inventory = new Inventory();
		if(list.size()>0){
			inventory = list.get(0);
		}
		session.close();
		return inventory;
	}

	public int count(String hql) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql);
		Number count=(Number) query.uniqueResult();
		session.close();
		return count.intValue();

	}
	
	public List<Inventory> listPage(String hql, int pageNum, int row) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql);
		List<Inventory> list = query.setFirstResult((pageNum - 1) * row).setMaxResults(row).list();
		if (list != null && list.size() > 0) {
			return list;
		}
		session.close();
		return list;

	}
	
}
