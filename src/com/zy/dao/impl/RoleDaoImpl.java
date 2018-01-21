package com.zy.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;


import com.zy.dao.IRoleDao;
import com.zy.model.Orderinfo;
import com.zy.model.Role;
@Component(value="RoleDao")
public class RoleDaoImpl implements IRoleDao {

	private SessionFactory sessionFactory;

	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void save(Role dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void update(Role dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void delete(Role dto) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.delete(dto);
		session.getTransaction().commit();
		session.close();
	}

	public Role get(int id) {
		Session session = sessionFactory.openSession();
		Role dto = (Role)session.get(Role.class, id);
		session.close();
		return dto;
	}

	public List<Role> list(Role dto) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Role");
		List<Role> list = query.list();
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
	
	public List<Role> listPage(String hql, int pageNum, int row) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql);
		List<Role> list = query.setFirstResult((pageNum - 1) * row).setMaxResults(row).list();
		if (list != null && list.size() > 0) {
			return list;
		}
		session.close();
		return null;

	}
}

