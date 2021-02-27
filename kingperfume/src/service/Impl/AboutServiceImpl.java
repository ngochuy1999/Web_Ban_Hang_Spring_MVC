package service.Impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import entity.About;
import service.AboutService;

@Service
public class AboutServiceImpl implements AboutService{
	@Autowired
	SessionFactory factory;
	
	@Override
	public List<About> getAllAbout() {
		Session session = factory.openSession();
		try {
			String hql = "FROM About";
			Query query = session.createQuery(hql);
			List<About> result = query.list();
			if (result != null) {
				return result;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
}
