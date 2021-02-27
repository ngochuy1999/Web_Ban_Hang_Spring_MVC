package controller;

import java.util.List;

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

import entity.Role;
import entity.User;
import service.UserService;

@Controller
@RequestMapping("/admin/")
public class AdminUserController {
	@Autowired
	public UserService userService;

	@Autowired
	SessionFactory factory;

	@Autowired
	HttpSession session;
	
	@RequestMapping(value = "user", method = RequestMethod.GET)
	public String viewUserList(ModelMap model) {
		if (session.getAttribute("adminsession") != null) {
			model.addAttribute("listUser", userService.getAllUser(0, 10));
			model.addAttribute("page", userService.countRecord() / 10);
			model.addAttribute("totalItem", userService.countRecord());
			model.addAttribute("countItem", 10);
			return "admin/user_list";
		}else{
			return "redirect:/admin/login.htm";
		}
	}

	@RequestMapping(value = "user/{page}", method = RequestMethod.GET)
	public String viewUserListByPage(ModelMap model, @PathVariable("page") int page) {
		if (session.getAttribute("adminsession") != null) {
		model.addAttribute("listUser", userService.getAllUser((page - 1) * 10, 10));
		model.addAttribute("page", userService.countRecord() / 10);
		model.addAttribute("totalItem", userService.countRecord());
		if ((page * 10) > userService.countRecord()) {
			model.addAttribute("countItem", userService.countRecord() - (page - 1) * 10);
		} else {
			model.addAttribute("countItem", 10);
		}
		return "admin/user_list";
		}else{
			return "redirect:/admin/login.htm";
		}
	}

	@RequestMapping(value = "user/insert", method = RequestMethod.GET)
	public String insertUser(ModelMap model) {
		if (session.getAttribute("adminsession") != null) {
		model.addAttribute("user", new User());
		List<Role> listRole = userService.getAllRole();
		model.addAttribute("role", listRole);
		return "admin/user_form";
		}else{
			return "redirect:/admin/login.htm";
		}
	}

	@RequestMapping(value = "user/insert", method = RequestMethod.POST)
	public String insertUser(ModelMap model,@Validated @ModelAttribute("user") User user,BindingResult errors) {
		if (errors.hasErrors()) {
			model.addAttribute("message", "Thêm mới thất bại!");
			model.addAttribute("role", userService.getAllRole());
			return "admin/user_form";
		} else {
			if(userService.isExitUsername(user.getUsername()))
			{
				model.addAttribute("message", "Thêm mới thất bại!");
				errors.rejectValue("username","user", "Tên người dùng đã tồn tại!");
			}else{
				boolean check = userService.insertUser(user);
				if (check) {
					model.addAttribute("message", "Thêm mới thành công!");
				} else {
					model.addAttribute("message", "Thêm mới thất bại!");
				}
			}
			model.addAttribute("role", userService.getAllRole());
		return "admin/user_form";
		}
	}

	@RequestMapping(value = "user/update/{id}", method = RequestMethod.GET)
	public String editUser(ModelMap model, @PathVariable("id") Long id) {
		if (session.getAttribute("adminsession") != null) {
		Session session = factory.openSession();
		User user = (User) session.get(User.class, id);
		model.addAttribute("user", user);
		model.addAttribute("role", userService.getAllRole());
		return "admin/user_update";
		}else{
			return "redirect:/admin/login.htm";
		}
	}

	@RequestMapping(value = "user/update/{id}", method = RequestMethod.POST)
	public String editUser(ModelMap model,@Validated @ModelAttribute("user") User user, BindingResult errors) {
		if (errors.hasErrors()) {
			model.addAttribute("message", "Cập nhật thất bại!");
			List<Role> listRole = userService.getAllRole();
			model.addAttribute("role", listRole);
			return "admin/user_update";
		} else {
			
				boolean check = userService.updateUser(user);
				if (check) {
					model.addAttribute("message", "Cập nhật thành công!");
				} else {
					model.addAttribute("message", "Cập nhật thất bại!");
				}
			
			model.addAttribute("role", userService.getAllRole());
		return "admin/user_update";
		}
	}

	@RequestMapping("user/remove/{id}")
	public String deleteUser(ModelMap model, @PathVariable("id") Long id) {
		if (session.getAttribute("adminsession") != null) {
			User admin = (User) session.getAttribute("adminsession");
			User user = (User) session.getAttribute("usersession");
			if(user==null){
				if(admin.getId()!=id){
				boolean check = userService.deleteUser(id);
				if (check) {
					model.addAttribute("message", "Xóa thành công!");
				} else {
					model.addAttribute("message", "Xóa thất bại!");
				}
				return "redirect:/admin/user.htm";
				}else{
					model.addAttribute("message", "Xóa thất bại!");
					return "redirect:/admin/user.htm";
				}
			}else{if(user.getId()!=id && admin.getId()!=id){
				boolean check = userService.deleteUser(id);
				if (check) {
					model.addAttribute("message", "Xóa thành công!");
				} else {
					model.addAttribute("message", "Xóa thất bại!");
				}
				return "redirect:/admin/user.htm";
				}else{
					model.addAttribute("message", "Xóa thất bại!");
					return "redirect:/admin/user.htm";
				}}
		}else
		return "redirect:/admin/login.htm";
	}
}
