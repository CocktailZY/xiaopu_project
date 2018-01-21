package com.zy.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.zy.dao.ICarDao;
import com.zy.model.Car;
import com.zy.model.Entrepot;
@Component(value="CarDao")
public class CarDaoImpl implements ICarDao {

	private SessionFactory sessionFactory;

	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public void save(Car dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void update(Car dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void delete(Car dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.delete(dto);
		session.getTransaction().commit();
		session.close();
	}

	public Car get(int id) {
		Session session = sessionFactory.openSession();
		Car dto = (Car)session.get(Car.class, id);
		session.close();
		return dto;
	}

	public List<Car> list(Car dto) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Car");
		List<Car> list = query.list();
		session.close();
		return list;
	}

	public List<Car> listByUserId(int userId) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Car where user.id="+userId);
		List<Car> list = query.list();
		session.close();
		return list;
	}

	public List<Car> listByCusId(int cusId) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Car where customer.id="+cusId);
		List<Car> list = query.list();
		session.close();
		return list;
	}

}
