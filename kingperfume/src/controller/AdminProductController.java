package controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import bean.Cart;
import entity.Brand;
import entity.Product;
import entity.Role;
import entity.User;
import service.BrandService;
import service.ProductService;
import service.SexService;
import service.SupplierService;

@Controller
@RequestMapping("/admin/")
public class AdminProductController {

	@Autowired
	HttpSession session;

	@Autowired
	SessionFactory factory;

	@Autowired
	ProductService productService;

	@Autowired
	BrandService brandService;
	
	@Autowired
	SexService sexService;


	@Autowired
	SupplierService supplierService;

	@Autowired
	ServletContext context;

	@RequestMapping(value = "product", method = RequestMethod.GET)
	public String viewProductList(ModelMap model) {
		if (session.getAttribute("adminsession") != null) {
			model.addAttribute("listProduct", productService.getListNav(0, 10));
			model.addAttribute("page", productService.countTotalRecords() / 10);
			model.addAttribute("totalItem", productService.countTotalRecords());
			model.addAttribute("countItem", 10);
			return "admin/product_list";
		}else{
			return "redirect:/admin/login.htm";
			}
	}

	@RequestMapping(value = "product/{page}", method = RequestMethod.GET)
	public String viewProductListByPage(ModelMap model, @PathVariable("page") int page) {
		if (session.getAttribute("adminsession") != null) {
		model.addAttribute("listProduct", productService.getListNav((page - 1) * 10, 10));
		model.addAttribute("page", productService.countTotalRecords() / 10);
		model.addAttribute("totalItem", productService.countTotalRecords());
		if ((page * 10) > productService.countTotalRecords()) {
			model.addAttribute("countItem", productService.countTotalRecords() - (page - 1) * 10);
		} else {
			model.addAttribute("countItem", 10);
		}
		return "admin/product_list";
		}else{
			return "redirect:/admin/login.htm";
		}
	}

	@RequestMapping(value = "product/insert", method = RequestMethod.GET)
	public String product_form(ModelMap model) {
		if (session.getAttribute("adminsession") != null) {
		model.addAttribute("product", new Product());
		model.addAttribute("sexs", sexService.getAllSex());
		model.addAttribute("brands", brandService.getAllBrand());
		model.addAttribute("showroom", supplierService.getAllSupplier());
		model.addAttribute("productStatus", productService.getAllProductStatus());
		return "admin/product_form";
		}else{
			return "redirect:/admin/login.htm";
		}
	}

	@RequestMapping(value = "product/insert", method = RequestMethod.POST)
	public String product_form(ModelMap model,@ModelAttribute("product") Product product,BindingResult errors) {
		if(product.getName().trim().length() == 0){
			errors.rejectValue("name", "product",  "Vui lòng nhập tên sản phẩm !");
		}else if(productService.isExitName(product.getName())){
			errors.rejectValue("name", "product",  "Tên sản phẩm đã tồn tại!");
		}
		if(product.getMadein().trim().length() == 0){
			errors.rejectValue("madein", "product",  "Vui lòng nhập xuất xứ !");
		}
		if(product.getUrl().trim().length() == 0){
			errors.rejectValue("url", "product",  "Vui lòng nhập url hình ảnh !");
		}
		if(product.getDescription().trim().length() == 0){
			errors.rejectValue("description", "product",  "Vui lòng nhập giới thiệu !");
		}
		if(product.getPrice() == 0){
			errors.rejectValue("price", "product",  "Vui lòng nhập giá sản phẩm !");
		}
		else if(product.getPrice() < 0 || product.getPrice() > 20000000){
			errors.rejectValue("price", "product",  "Vui lòng kiểm tra lại giá!");
		}
		if(product.getQuantity() == 0){
			errors.rejectValue("quantity", "product",  "Vui lòng nhập số lượng sản phẩm !");
		}
		else if(product.getQuantity() < 0 || product.getQuantity() > 1000){
			errors.rejectValue("quantity", "product",  "kiểm tra lại số lượng!");
		}
		if(product.getYear() == 0){
			errors.rejectValue("year", "product",  "Vui lòng nhập năm sản xuất !");
		}
		else if(product.getYear() < 1800 || product.getYear()> 2021){
			errors.rejectValue("year", "product",  "Vui lòng kiểm tra lại năm sản xuất!");
		}

		Date date = new Date();  
		product.setUpdateAt(date);
		
		if(errors.hasErrors()){
			model.addAttribute("message", "Thêm sản phẩm mới thất bại!");
			model.addAttribute("sexs", sexService.getAllSex());
			model.addAttribute("brands", brandService.getAllBrand());
			model.addAttribute("showroom", supplierService.getAllSupplier());
			model.addAttribute("productStatus", productService.getAllProductStatus());
			return "admin/product_form";
		}
		else{
			boolean check = productService.insertProduct(product);
			if (check) {
				model.addAttribute("message", "Thêm sản phẩm mới thành công!");
			} else {
				model.addAttribute("message", "Thêm sản phẩm mới thất bại!");
			}
			return "admin/product_form";
		}
	}

	@RequestMapping(value = "product/update/{id}", method = RequestMethod.GET)
	public String editP(ModelMap model, @PathVariable("id") int id) {
		if (session.getAttribute("adminsession") != null) {
		Session session = factory.openSession();
		
		Product product = (Product) session.get(Product.class, id);
		model.addAttribute("product", product);
		model.addAttribute("sexs", sexService.getAllSex());
		model.addAttribute("brands", brandService.getAllBrand());
		model.addAttribute("showroom", supplierService.getAllSupplier());
		model.addAttribute("productStatus", productService.getAllProductStatus());
		return "admin/product_update";
		}else{
			return "redirect:/admin/login.htm";
		}
	}

	@RequestMapping(value = "product/update/{id}", method = RequestMethod.POST)
	public String editP(ModelMap model,@Validated @ModelAttribute("product") Product product,BindingResult errors,HttpServletRequest request) {
		if(product.getName().trim().length() == 0){
			errors.rejectValue("name", "product",  "Vui lòng nhập tên sản phẩm !");
		}
		if(product.getMadein().trim().length() == 0){
			errors.rejectValue("madein", "product",  "Vui lòng nhập xuất xứ !");
		}
		if(product.getUrl().trim().length() == 0){
			errors.rejectValue("url", "product",  "Vui lòng nhập url hình ảnh !");
		}
		if(product.getDescription().trim().length() == 0){
			errors.rejectValue("description", "product",  "Vui lòng nhập giới thiệu !");
		}
		if(product.getPrice() == 0){
			errors.rejectValue("price", "product",  "Vui lòng nhập giá sản phẩm !");
		}
		else if(product.getPrice() < 0 || product.getPrice() > 20000000){
			errors.rejectValue("price", "product",  "Vui lòng kiểm tra lại giá!");
		}
		else if(product.getQuantity() < 0 || product.getQuantity() > 1000){
			errors.rejectValue("quantity", "product",  "kiểm tra lại số lượng!");
		}
		if(product.getYear() == 0){
			errors.rejectValue("year", "product",  "Vui lòng nhập năm sản xuất !");
		}
		else if(product.getYear() < 1800 || product.getYear()> 2021){
			errors.rejectValue("year", "product",  "Vui lòng kiểm tra lại năm sản xuất!");
		}

		Date date = new Date();  
		product.setUpdateAt(date);
		
		if(errors.hasErrors()){
			model.addAttribute("message", "Cập nhật thất bại!");
			model.addAttribute("sexs", sexService.getAllSex());
			model.addAttribute("brands", brandService.getAllBrand());
			model.addAttribute("showroom", supplierService.getAllSupplier());
			model.addAttribute("productStatus", productService.getAllProductStatus());
			return "admin/product_update";
		}
		else{
			boolean check = productService.updateProduct(product);
			if (check) {
				model.addAttribute("message", "Cập nhật thành công!");
			} else {
				model.addAttribute("message", "Cập nhật thất bại!");
			}
			return "admin/product_update";
		}
	}


	@RequestMapping("product/remove/{id}")
	public String deleteProduct(ModelMap model, @PathVariable("id") int id) {
		if (session.getAttribute("adminsession") != null) {
			HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
			if(cartItems==null)
			{
				boolean check = productService.deleteProduct(id);
				if (check) {
					model.addAttribute("message", "Xóa thành công!");
				} else {
					model.addAttribute("message", "Xóa thất bại!");
				}
				return "redirect:/admin/product.htm";
			}else{
				if(!cartItems.containsKey(id)){
					boolean check = productService.deleteProduct(id);
					if (check) {
						model.addAttribute("message", "Xóa thành công!");
					} else {
						model.addAttribute("message", "Xóa thất bại!");
					}
					return "redirect:/admin/product.htm";
				}else{
					model.addAttribute("message", "Xóa thất bại!");
					return "redirect:/admin/product.htm";
				}
			}
		}else{
			return "redirect:/admin/login.htm";
		}
	}
}
