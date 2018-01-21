package com.zy.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;


import com.zy.dao.IUserDao;
import com.zy.model.Role;
import com.zy.model.Users;
@Component(value="UserDao")
public class UserDaoImpl implements IUserDao {
	private SessionFactory sessionFactory;

	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public int count(String hql) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql);
		Number count=(Number) query.uniqueResult();
		session.close();
		return count.intValue();

	}
	
	public List<Users> listPage(String hql, int pageNum, int row) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql);
		List<Users> list = query.setFirstResult((pageNum - 1) * row).setMaxResults(row).list();
		if (list != null && list.size() > 0) {
			return list;
		}
		session.close();
		return null;

	}
	
	public void save(Users dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void update(Users dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void delete(Users dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.delete(dto);
		session.getTransaction().commit();
		session.close();
	}

	public Users get(int id) {
		Session session = sessionFactory.openSession();
		Users dto = (Users)session.get(Users.class, id);
		session.close();
		return dto;
	}

	public List<Users> list(Users dto) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Users");
		List<Users> list = query.list();
		session.close();
		return list;
	}

	public List<Users> getByRoleId(int roleId) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		List<Users> user = session.createQuery("from Users where roleId="+roleId).list();
		session.close();
		return user;
	}

	public Users login(String username, String password) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Users where username='"+username+"' and password='"+password+"'");
		List<Users> list = query.list();
		Users dto = null;
		if(list.size()==1){
			dto = list.get(0);
		}
		session.close();
		return dto;
	}
	
	public Users loginMessage(String username) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Users where username='"+username+"'");
		List<Users> list = query.list();
		Users dto = null;
		if(list.size()==1){
			dto = list.get(0);
		}
		session.close();
		return dto;
	}

}
