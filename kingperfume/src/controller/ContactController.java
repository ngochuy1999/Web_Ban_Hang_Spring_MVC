package controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import entity.Brand;
import entity.Contact;
import service.BrandService;
import service.ContactService;

@Controller
public class ContactController {
	@Autowired
	BrandService brandService;

	@Autowired
	ContactService contactService;

	@RequestMapping("contact")
	public String contact(ModelMap model) {
		List<Brand> listBrand = brandService.getAllBrand();
		model.addAttribute("listBrand", listBrand);
		model.addAttribute("contact", new Contact());
		return "contact";
	}

	@RequestMapping(value = "contact/insert", method = RequestMethod.POST)
	public String contact(ModelMap model, @ModelAttribute("contact") @Valid Contact contact, BindingResult result) {
		if (result.hasErrors()) {
			return "contact";
		} else {
			boolean check = contactService.insertContact(contact);
			if (check) {
				model.addAttribute("message", "Liên hệ thành công!");
			} else {
				model.addAttribute("message", "Liên hệ thất bại!");
			}
			model.addAttribute("contact", new Contact());
			return "contact";
		}
	}
}
