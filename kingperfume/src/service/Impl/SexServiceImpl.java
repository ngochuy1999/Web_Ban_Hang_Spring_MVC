package service.Impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import entity.Sex;
import service.SexService;
@Service
public class SexServiceImpl implements SexService{
	@Autowired
	SessionFactory factory;
	
	@Override
	public List<Sex> getAllSex() {
		Session session = factory.openSession();
		try {
			String hql = "FROM Sex";
			Query query = session.createQuery(hql);
			List<Sex> result = query.list();
			if (result != null) {
				return result;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
}
