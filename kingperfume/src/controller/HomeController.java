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
public class HomeController {
	@Autowired
	BrandService brandService;

	@Autowired
	ProductService productService;

	@RequestMapping("index")
	public String index(ModelMap model) {
		List<Brand> listBrand = brandService.getAllBrand();
		model.addAttribute("listBrand", listBrand);

		List<Product> listNewProduct = productService.getNewProduct();
		model.addAttribute("listNewProduct", listNewProduct);

		List<Product> listProductDior = productService.getProductByBrand(1);
		model.addAttribute("listProductDior", listProductDior);
		
		List<Product> listProductVersace = productService.getProductByBrand(4);
		model.addAttribute("listProductVersace", listProductVersace);

		return "index";
	}

	@RequestMapping("error")
	public String error404(ModelMap model) {
		List<Brand> listBrand = brandService.getAllBrand();
		model.addAttribute("listBrand", listBrand);
		return "404";
	}

	@RequestMapping("thank-you")
	public String thank(ModelMap model) {
		List<Brand> listBrand = brandService.getAllBrand();
		model.addAttribute("listBrand", listBrand);
		return "thank-you";
	}

	@RequestMapping("success")
	public String success(ModelMap model) {
		List<Brand> listBrand = brandService.getAllBrand();
		model.addAttribute("listBrand", listBrand);
		return "success";
	}
}
