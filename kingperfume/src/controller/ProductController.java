package controller;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import entity.Brand;
import entity.Product;
import service.BrandService;
import service.ProductService;

@Controller
@Transactional
public class ProductController {

	@Autowired
	BrandService brandService;

	@Autowired
	ProductService productService;

	@RequestMapping("/product")
	public String listProductHandler(ModelMap model, Integer offset, Integer maxResults) {
		List<Brand> listBrand = brandService.getAllBrand();
		model.addAttribute("listBrand", listBrand);
		List<Product> list = productService.getAllProduct(offset, maxResults);
		model.addAttribute("listProduct", list);
		model.addAttribute("count", productService.countTotalRecords());
		model.addAttribute("offset", offset);
		return "product";
	}

	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String getDetailProduct(Model model, @PathVariable("id") int id) {
		Product product = productService.getProductById(id);
		if (product != null) {
			model.addAttribute("productDetail", product);
		}
		List<Brand> listBrand = brandService.getAllBrand();
		model.addAttribute("listBrand", listBrand);
		return "detail";
	}

	@RequestMapping(value = "find")
	public String findProduct(ModelMap model) {
		model.addAttribute("product", new Product());
		return "product";
	}

	@RequestMapping(value = "find", method = RequestMethod.POST)
	public String findProduct(ModelMap model,@ModelAttribute("product") Product product) {
		List<Product> list = productService.findProduct(product.getName());
		if (list != null) {
			model.addAttribute("listProduct", list);
			return "product";
		}
		return "404";
	}
}
