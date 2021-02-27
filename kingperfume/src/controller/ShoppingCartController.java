package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.Cart;
import entity.Brand;
import entity.Product;
import entity.User;
import service.BrandService;
import service.ProductService;
import service.ShoppingCartService;

@Controller
@Transactional
@RequestMapping("/shopping-cart")
public class ShoppingCartController {

	@Autowired
	BrandService brandService;

	@Autowired
	ProductService productService;

	@Autowired
	ShoppingCartService shoppingCartService;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("")
	public String shoppingCart(ModelMap model) {
		User user = (User) session.getAttribute("usersession");
		if(user!=null) {
		List<Brand> listBrand = brandService.getAllBrand();
		model.addAttribute("listBrand", listBrand);
		return "shopping-cart";
		}
		return "redirect:/sign-in.htm";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/add/{productId}.htm", method = RequestMethod.GET)
	public String addShoppingCart(ModelMap model, HttpSession session, @PathVariable("productId") int productId, @ModelAttribute("productDetail") Cart cart) {
		User user = (User) session.getAttribute("usersession");
		if(user!=null) {
		List<Brand> listBrand = brandService.getAllBrand();
		model.addAttribute("listBrand", listBrand);

		int quantity = cart.getQuantity();
		System.out.println(quantity);
		
		HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
		if (cartItems == null) {
			cartItems = new HashMap<>();
		}
		Product product = productService.getProductById(productId);
		if (product != null) {
			if (cartItems.containsKey(productId)) {
				Cart item = cartItems.get(productId);
				item.setProduct(product);
				item.setQuantity(item.getQuantity() + 1);
				cartItems.put(productId, item);
			} else {
				Cart item = new Cart();
				item.setProduct(product);
				item.setQuantity(1);
				cartItems.put(productId, item);
			}
		}
		session.setAttribute("myCartItems", cartItems);
		session.setAttribute("myCartTotal", totalPrice(cartItems));
		session.setAttribute("myCartNum", cartItems.size());
		return "shopping-cart";
		}
		return "redirect:/sign-in.htm";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "sub/{productId}.htm", method = RequestMethod.GET)
	public String viewUpdate(ModelMap mm, @PathVariable("productId") long productId) {
		User user = (User) session.getAttribute("usersession");
		if(user!=null) {
		HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
		if (cartItems == null) {
			cartItems = new HashMap<>();
		}
		session.setAttribute("myCartItems", cartItems);
		
		return "shopping-cart";
		}
		return "redirect:/sign-in.htm";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "remove/{productId}.htm", method = RequestMethod.GET)
	public String viewRemove(ModelMap mm, @PathVariable("productId") int productId) {
		User user = (User) session.getAttribute("usersession");
		if(user!=null) {
		HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
		if (cartItems == null) {
			cartItems = new HashMap<>();
		}
		if (cartItems.containsKey(productId)) {
			cartItems.remove(productId);
		}
		session.setAttribute("myCartItems", cartItems);
		session.setAttribute("myCartTotal", totalPrice(cartItems));
		session.setAttribute("myCartNum", cartItems.size());
		return "shopping-cart";
		}
		return "redirect:/sign-in.htm";
	}

	public double totalPrice(HashMap<Integer, Cart> cartItems) {
		int count = 0;
		for (Entry<Integer, Cart> list : cartItems.entrySet()) {
			count += list.getValue().getProduct().getPrice() * list.getValue().getQuantity();
		}
		return count;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("paying")
	public String paying(ModelMap model) {
		HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
		User user = (User) session.getAttribute("usersession");
		if(user!=null) {
			shoppingCartService.paying(cartItems, user, totalPrice(cartItems));
			cartItems = new HashMap<>();
			session.setAttribute("myCartItems", cartItems);
			session.setAttribute("myCartTotal", 0);
			session.setAttribute("myCartNum", 0);
			return "thank-you";
		}
		return "redirect:/sign-in.htm";
	}
}
