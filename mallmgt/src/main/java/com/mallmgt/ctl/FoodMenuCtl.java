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

import com.mallmgt.dto.FoodMenuDTO;
import com.mallmgt.dto.FoodStallDTO;
import com.mallmgt.exception.RecordNotFoundException;
import com.mallmgt.form.FoodMenuForm;
import com.mallmgt.form.FoodStallForm;
import com.mallmgt.service.FoodMenuService;
import com.mallmgt.service.FoodStallService;

@Controller
public class FoodMenuCtl {
	
	@Autowired
	public FoodStallService stallService;
	
	@Autowired
	public FoodMenuService service;

	@GetMapping("/foodMenu")
	public String foodMenu(@ModelAttribute("form")FoodStallForm form, Model model) {
		List<FoodStallDTO> list = stallService.list();
		model.addAttribute("list", list);
		
		return "stalldropdownlist";
	}
	
	@GetMapping("/viewFoodMenu")
	public String viewFoodMenu(@ModelAttribute("form")FoodStallForm form, Model model) {
		List<FoodStallDTO> list = stallService.list();
		model.addAttribute("list", list);
		
		return "stalldropdownviewlist";
	}
	

	
	
	@GetMapping("/viewFoodMenuToAddItem")
	public String viewFoodMenuToAddItem(@ModelAttribute("form")FoodMenuForm form, Model model, @RequestParam("stallId") long stallId) {
	
		FoodStallDTO stallDto = stallService.findStallById(stallId);		
		FoodMenuDTO dto = form.getDTO();
		dto.setStallId(stallId);
		dto.setStallName(stallDto.getStallName());
	   System.out.println("Stall details to add food item: "+dto+ "stallId: "+stallId);
	
	model.addAttribute("dto", dto);
		
		return "foodmenuitem";
	}
	
	@GetMapping("/foodMenuItemList")
	public String foodMenuItemList(@ModelAttribute("form")FoodMenuForm form, Model model, @RequestParam("stallId") long stallId) {
	
		List<FoodMenuDTO> itemList = service.findByStallId(stallId);
	    model.addAttribute("list", itemList);
		
		return "foodmenuitemlist";
	}
	
	
	
	
	@PostMapping("/addFoodMenu")
	public String Add(@Valid @ModelAttribute("form")FoodMenuForm form,  BindingResult bindingResult, Model model) {

		System.out.println("form: "+form);
		try {
		if (bindingResult.hasErrors()) {
			System.out.println("bindingResult : "+bindingResult);
			return "foodmenuitem";
		}else {
			FoodMenuDTO bean = form.getDTO();
			
			System.out.println("Menu Item Before Save: "+bean);
			
			if(form.getId()>0) {

				service.update(bean);
				model.addAttribute("success", "Menu Item Updated successfully");
			}else {
				service.Add(bean);
				model.addAttribute("success", "Menu Item Added successfully");
			}
			
			return "foodmenuitem";
		}}catch (RecordNotFoundException e) {
			// TODO: handle exception
			model.addAttribute("error", e.getMessage());
			e.printStackTrace();
			return "foodmenuitem";
		}
	}
	

	@GetMapping("/foodMenuList")
	public String list(@ModelAttribute("form")FoodMenuForm form, Model model){
	List<FoodMenuDTO> list = service.list();
	model.addAttribute("list", list);
	return "addfoodmenuitemlist";
		
	}


	@GetMapping("/foodMenuEdit")	
	public String update(@ModelAttribute("form")FoodMenuForm form, Model model, @RequestParam("id") long id ){
		FoodMenuDTO bean = service.findMenuItemById(id);
		form.populate(bean);
		model.addAttribute("bean",bean);
		return "foodmenuitem";
	}
	
	@GetMapping("/foodMenuDelete")	
	public String delete(@ModelAttribute("form")FoodMenuForm form, Model model, @RequestParam("id") long id, @RequestParam("stallId") long stallId ) throws Exception{
		service.delete(id);	
		
		List<FoodMenuDTO> itemList = service.findByStallId(stallId);		
		model.addAttribute("list", itemList);
		model.addAttribute("success", "Menu Item Deleted successfully");
		return "foodmenuitemlist";
	}
	
	
	
}