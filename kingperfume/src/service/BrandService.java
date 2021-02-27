package service;

import java.util.List;


import entity.Brand;

public interface BrandService {

	List<Brand> getAllBrand();
	boolean insertBrand(Brand brand);
	boolean updateBrand(Brand brand);
	boolean removeBrand(int id);
	public boolean isExitBrandname(String name);
	
}
