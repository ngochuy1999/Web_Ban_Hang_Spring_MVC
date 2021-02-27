package controller;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import entity.About;
import entity.Brand;
import service.AboutService;
import service.BrandService;

@Controller
@Transactional
@RequestMapping("/")
public class AboutController {
	
	@Autowired
	BrandService brandService;
	
	@Autowired
	AboutService aboutService;
	
	@RequestMapping("about")
	public String about(ModelMap model) {	
		List<Brand> listBrand = brandService.getAllBrand();
		model.addAttribute("listBrand", listBrand);
		
		List<About> listAbout = aboutService.getAllAbout();
		model.addAttribute("listAbout", listAbout);
		return "about";
	}
	
}
