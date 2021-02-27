package controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import entity.Contact;
import service.ContactService;

@Controller
@RequestMapping("/admin/")
@Transactional
public class AdminMaiboxController {
	@Autowired
	ContactService contactService;

	@Autowired
	SessionFactory factory;

	@Autowired
	HttpSession session;

	@RequestMapping("mailbox")
	public String brand(ModelMap model) {
		if (session.getAttribute("adminsession") != null) {
			List<Contact> listContact = contactService.getAllContact();
			model.addAttribute("listContact", listContact);
			return "admin/mailbox_list";
		}else{
			return "redirect:/admin/login.htm";
			}
	}

	
	@RequestMapping("mailbox/remove/{id}")
	public String delete(ModelMap model, @PathVariable("id") int id) {
		if (session.getAttribute("adminsession") != null) {
		boolean check = contactService.removeContact(id);
		if (check==true) {
			model.addAttribute("message", "Xóa thành công!");
		} else {
			model.addAttribute("message", "Xóa thất bại!");
		}
		return "redirect:/admin/mailbox.htm";
		}else{
			return "redirect:/admin/login.htm";
			}
	}
}
