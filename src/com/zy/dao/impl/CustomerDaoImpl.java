package com.zy.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.zy.dao.ICustomerDao;
import com.zy.model.Customer;
import com.zy.model.Goods;
@Component(value="CustomerDao")
public class CustomerDaoImpl implements ICustomerDao{

	private SessionFactory sessionFactory;

	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public void save(Customer dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void update(Customer dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void delete(Customer dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.delete(dto);
		session.getTransaction().commit();
		session.close();
	}

	public Customer get(int id) {
		Session session = sessionFactory.openSession();
		Customer dto = (Customer)session.get(Customer.class, id);
		session.close();
		return dto;
	}

	public List<Customer> list(Customer dto) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Customer");
		List<Customer> list = query.list();
		session.close();
		return list;
	}


}
