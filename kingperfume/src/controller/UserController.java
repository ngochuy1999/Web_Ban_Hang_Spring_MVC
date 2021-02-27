package controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.ChangePasswordRequest;
import bean.LoginRequest;
import bean.RegisterRequest;
import entity.Brand;
import entity.Product;
import entity.User;
import service.BrandService;
import service.ProductService;
import service.UserService;

@Controller
@Transactional
public class UserController {

	@Autowired
	BrandService brandService;

	@Autowired
	ProductService productService;
	
	@Autowired
	public UserService userService;

	@Autowired
	public HttpSession session;

	@RequestMapping(value = "sign-in", method = RequestMethod.GET)
	public String signIn(ModelMap model) {
		model.addAttribute("loginRequest", new LoginRequest());
		return "sign-in";
	}

	@RequestMapping(value = "sign-in", method = RequestMethod.POST)
	public String signIn(ModelMap model, @ModelAttribute("loginRequest") @Valid LoginRequest loginRequest) {
		User user = userService.checkLogin(loginRequest.getUsername(), loginRequest.getPassword());
		if (user == null) {
			model.addAttribute("message", "Vui lòng kiểm tra lại tài khoản và mật khẩu!");
			return "sign-in";
		}
		session.setAttribute("usersession", user);
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

	@RequestMapping("sign-up")
	public String signUp(ModelMap model) {
		model.addAttribute("registerRequest", new RegisterRequest());
		return "sign-up";
	}

	@RequestMapping(value = "sign-up", method = RequestMethod.POST)
	public String signUp(@Validated @ModelAttribute("registerRequest") RegisterRequest registerRequest,
			BindingResult errors) {
		if (errors.hasErrors()) {
			return "sign-up";
		} else {
			User user = new User();
			if (userService.isExitUsername(registerRequest.getUsername())) {
				errors.rejectValue("username", "registerRequest", "Tên tài khoản đã tồn tại!");
			}else
			if (!registerRequest.getPassword().equals(registerRequest.getConfirmPassword())) {
				errors.rejectValue("confirmPassword","registerRequest", "Xác nhận mật khẩu không trùng khớp!");
			}else{
				BeanUtils.copyProperties(registerRequest, user);
				userService.createUser(user);
				return "redirect:success.htm";
				}
			return "sign-up";	
		}

	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
		User user = (User) session.getAttribute("usersession");
		if(user!=null) {
		session.invalidate();
		return "index";
		}
		return "redirect:/sign-in.htm";
	}

	@RequestMapping("account-info")
	public String acountInfo(ModelMap model) {
		model.addAttribute("changePassword", new ChangePasswordRequest());
		return "account-info";
	}

	@RequestMapping(value = "account-info", method = RequestMethod.POST)
	public String acountInfo(ModelMap model,
			@Validated @ModelAttribute("changePassword") ChangePasswordRequest changePasswordRequest,
			BindingResult errors) {
		if (errors.hasErrors()) {
			return "account-info";
		} else {
			User user = (User) session.getAttribute("usersession");
			if (!changePasswordRequest.getPassword().equals(user.getPassword())) {
				errors.rejectValue("password","changePassword", "Vui lòng kiểm tra password!");
			}else
			if (!changePasswordRequest.getNewPassword().equals(changePasswordRequest.getConfirmNewPassword())) {
				errors.rejectValue("confirmNewPassword","changePassword", "Mật khẩu mới không trùng khớp!");
			}else{
				model.addAttribute("message", "Thay mới password thành công!");
				user.setPassword(changePasswordRequest.getNewPassword());
				userService.changePassword(user);
				}
			return "account-info";
		}
	}
}
