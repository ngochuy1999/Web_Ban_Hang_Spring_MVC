package controller;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import entity.Brand;
import entity.Product;
import service.BrandService;
import service.ProductService;

@Controller
@Transactional
@RequestMapping("/")
public class ShopController {

	@Autowired
	BrandService brandService;
	
	@Autowired
	ProductService productService;
	
	@RequestMapping("shop")
	public String shop(ModelMap model) {
		List<Brand> listBrand = brandService.getAllBrand();
		model.addAttribute("listBrand", listBrand);
		
		List<Product> listProductDior = productService.getProductByBrand(1);
		model.addAttribute("listProductDior", listProductDior);
		
		List<Product> listProductVersace = productService.getProductByBrand(4);
		model.addAttribute("listProductVersace", listProductVersace);
		
		List<Product> listProductChanel = productService.getProductByBrand(3);
		model.addAttribute("listProductChanel", listProductChanel);
		return "shop";
	}
}
