package service.Impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import entity.Brand;
import entity.User;
import service.BrandService;;
@Service
public class BrandServiceImpl implements BrandService{
	@Autowired
	SessionFactory factory;
	
	@Override
	public List<Brand> getAllBrand() {
		Session session = factory.openSession();
		try {
			String hql = "FROM Brand";
			Query query = session.createQuery(hql);
			List<Brand> result = query.list();
			if (result != null) {
				return result;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	@Override
	public boolean insertBrand(Brand brand) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(brand);
			t.commit();
			return true;
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		return false;
	}
	
	@Override
	public boolean updateBrand(Brand brand) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(brand);
			t.commit();
			return true;
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		return false;
	}
	
	@Override
	public boolean removeBrand(int id) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Brand brand = (Brand) session.get(Brand.class, id);
			session.delete(brand);
			t.commit();
			return true;
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		return false;
	}
	public boolean isExitBrandname(String name) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			String hql = "SELECT count(u.id) FROM Brand u WHERE u.name=:name";
			Query query = session.createQuery(hql);
			query.setParameter("name", name);
			Long result = (Long) query.uniqueResult();
			t.commit();
			if(result > 0) {
				return true;
			}
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		return false;
	}
}
