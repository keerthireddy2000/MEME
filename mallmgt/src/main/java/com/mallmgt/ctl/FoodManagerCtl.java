package com.mallmgt.ctl;


import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.mallmgt.dto.UserDTO;
import com.mallmgt.exception.RecordNotFoundException;
import com.mallmgt.form.FoodManagerForm;
import com.mallmgt.form.UserForm;
import com.mallmgt.service.UserService;

@Controller
public class FoodManagerCtl {
	
	@Autowired
	public UserService service;

	
	@GetMapping("/addfoodmanager")
	public String RegistrationPage(@ModelAttribute("form")FoodManagerForm form, Model model, @RequestParam("stallId") String stallId) {
		model.addAttribute("foodStallId", stallId);
		return "addfoodmanager";
	}
	
	@PostMapping("/AddFoodAdmin")
	public String Add(@Valid @ModelAttribute("form")FoodManagerForm form,  BindingResult bindingResult, Model model) {

		System.out.println("form: "+form);
		try {
		if (bindingResult.hasErrors()) {
			System.out.println("bindingResult : "+bindingResult);
			return "addfoodmanager";
		}else {
			UserDTO bean = form.getDTO();
			if(form.getId()>0) {
				bean.setUserRole("FoodAdmin");
				service.update(bean);
				model.addAttribute("success", "Food Manager Details Updated successfully");
			}else {
				bean.setUserRole("FoodAdmin");
				service.Add(bean);
				model.addAttribute("success", "Registration successfull");
			}
			
			return "addfoodmanager";
		}}catch (RecordNotFoundException e) {
			// TODO: handle exception
			model.addAttribute("error", e.getMessage());
			e.printStackTrace();
			return "addfoodmanager";
		}
	}
	
	@GetMapping("/foodmanagerlist")
	public String list(@ModelAttribute("form")FoodManagerForm form, Model model, @RequestParam("stallId") String stallId){
	List<UserDTO> list = service.findUserByStallId(stallId);
	model.addAttribute("list", list);
	model.addAttribute("stallId", stallId);
	return "foodmanagerlist";
	}
	
	@GetMapping("/foodmanagerEdit")	
	public String update(@ModelAttribute("form")FoodManagerForm form, Model model, @RequestParam("id") long id ){
		UserDTO bean = service.findUserById(id);
		form.populate(bean);
		model.addAttribute("bean",bean);	
		return "addfoodmanager";
	}
	
	@GetMapping("/foodmanagerDelete")	
	public String delete(@ModelAttribute("form")FoodManagerForm form, Model model, @RequestParam("id") long id, @RequestParam("stallId") String stallId ) throws Exception{
		service.delete(id);	
		List<UserDTO> list =	service.findUserByStallId(stallId);
		model.addAttribute("list", list);
		model.addAttribute("stallId", stallId);
		model.addAttribute("success", "Food Manager Deleted successfully");
		return "foodmanagerlist";
	}

}
