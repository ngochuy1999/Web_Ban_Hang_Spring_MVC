package controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import entity.Brand;
import service.BrandService;

@Controller
@RequestMapping("/admin/")
@Transactional
public class AdminBrandController {

	@Autowired
	BrandService brandService;

	@Autowired
	SessionFactory factory;

	@Autowired
	HttpSession session;

	@RequestMapping("brand")
	public String brand(ModelMap model) {
		if (session.getAttribute("adminsession") != null) {
			List<Brand> listBrand = brandService.getAllBrand();
			model.addAttribute("listBrand", listBrand);
			return "admin/brand_list";
		}else{
		return "redirect:/admin/login.htm";}	
	}

	@RequestMapping(value = "brand/insert", method = RequestMethod.GET)
	public String brand_form(ModelMap model) {
		if (session.getAttribute("adminsession") != null) {
		model.addAttribute("brand", new Brand());
		return "admin/brand_form";
		}else{
			return "redirect:/admin/login.htm";}	
	}

	@RequestMapping(value = "brand/insert", method = RequestMethod.POST)
	public String brand_form(ModelMap model, @Validated @ModelAttribute("brand") Brand brand, BindingResult errors) {
		if (errors.hasErrors()) {
			model.addAttribute("message", "Thêm mới thất bại!");
			return "admin/brand_form";
		} else {
			if(brandService.isExitBrandname(brand.getName()))
			{
				model.addAttribute("message", "Thêm mới thất bại!");
				errors.rejectValue("name","brand", "Tên thương hiệu đã tồn tại!");
			}else{
				boolean check = brandService.insertBrand(brand);
				if (check) {
					model.addAttribute("message", "Thêm mới thành công!");
				} else {
					model.addAttribute("message", "Thêm mới thất bại!");
				}
			}
			return "admin/brand_form";
		}
	}

	@RequestMapping(value = "brand/update/{id}", method = RequestMethod.GET)
	public String edit(ModelMap model, @PathVariable("id") int id) {
		if (session.getAttribute("adminsession") != null) {
		Session session = factory.getCurrentSession();
		Brand brand = (Brand) session.get(Brand.class, id);
		model.addAttribute("brand", brand);
		return "admin/brand_update";
		}else{
			return "redirect:/admin/login.htm";}
	}

	@RequestMapping(value = "brand/update/{id}", method = RequestMethod.POST)
	public String edit(ModelMap model, @Validated @ModelAttribute("brand") Brand brand,BindingResult errors) {
		if (errors.hasErrors()) {
			model.addAttribute("message", "Cập nhật thất bại!");
			return "admin/brand_update";
		} else {
			if(brandService.isExitBrandname(brand.getName())){
				model.addAttribute("message", "Cập nhật thất bại!");
				errors.rejectValue("name","brand", "Tên thương hiệu đã tồn tại!");
			}else{
				boolean check = brandService.updateBrand(brand);
				if (check) {
					model.addAttribute("message", "Cập nhật thành công!");
				}else {
					model.addAttribute("message", "Cập nhật thất bại!");
				}
			}
			return "admin/brand_update";
		}
	}

	@RequestMapping("brand/remove/{id}")
	public String delete(ModelMap model, @PathVariable("id") int id) {
		if (session.getAttribute("adminsession") != null) {
		boolean check = brandService.removeBrand(id);
		if (check==true) {
			model.addAttribute("message", "Xóa thành công!");
		} else {
			model.addAttribute("message", "Xóa thất bại!");
		}
		return "redirect:/admin/brand.htm";
		
		}else{
			return "redirect:/admin/login.htm";
			}
	}
}
