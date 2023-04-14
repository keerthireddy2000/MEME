package com.mallmgt.ctl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.mallmgt.dto.FoodCartDTO;
import com.mallmgt.dto.FoodMenuDTO;
import com.mallmgt.dto.FoodStallDTO;
import com.mallmgt.dto.UserDTO;
import com.mallmgt.form.FoodMenuForm;
import com.mallmgt.form.FoodStallForm;
import com.mallmgt.service.FoodCartService;
import com.mallmgt.service.FoodMenuService;

@Controller
public class FoodCartCtl {

	@Autowired
	public FoodMenuService foodMenuService;
	
	@Autowired
	public FoodCartService service;
	
	@GetMapping("/addToCart")
	public String foodMenu(Model model, @RequestParam("id") long id, HttpSession session) {
	    
		UserDTO user = (UserDTO) session.getAttribute("user");
		
		FoodMenuDTO dto =	foodMenuService.findMenuItemById(id);
		FoodCartDTO dto2 = new FoodCartDTO();
	
		dto2.setDeliveryTime(dto.getDeliveryTime());
		dto2.setFoodName(dto.getFoodName());
		dto2.setFoodId(id);
		dto2.setFoodPrice(dto.getFoodPrice());
		dto2.setPaymentStatus("Not Paid");
		dto2.setDeliveryStatus("In Process");
		dto2.setStallId(dto.getStallId());
		dto2.setStallName(dto.getStallName());
		dto2.setUserId(user.getId());
		dto2.setOrderby(user.getEmail());
		dto2.setStatus("In Process");
		service.add(dto2);
		List<FoodMenuDTO> itemList = foodMenuService.findByStallId(dto.getStallId());
	    model.addAttribute("list", itemList);
		model.addAttribute("success", "Item added to cart");
		
		return "foodmenuitemlist";
	}
	
	@GetMapping("/viewCart")
	public String viewCart(@ModelAttribute("form")FoodMenuForm form, Model model, HttpSession session) {
	    
		UserDTO user = (UserDTO) session.getAttribute("user");
	    List<FoodCartDTO> list = service.list("Not Paid");
	    long totalPrice = 0;
	    for (FoodCartDTO foodCartDTO : list) {
	    	totalPrice = foodCartDTO.getFoodPrice() + totalPrice;
		}
	    model.addAttribute("totalPrice", totalPrice);
	    model.addAttribute("list", list);
		return "foodcartview";
	}
	
	@GetMapping("/increaseQuantity")
	public String increaseQuantity(@ModelAttribute("form")FoodMenuForm form, Model model, HttpSession session, @RequestParam("id") long id) {
	    
		FoodCartDTO dto = service.findById(id);
		FoodMenuDTO food =	foodMenuService.findMenuItemById(dto.getFoodId());
		
		dto.setFoodPrice(dto.getFoodPrice()+food.getFoodPrice());
		
		service.update(dto);
		return "redirect:/viewCart";
	}
	
	@GetMapping("/decreaseQuantity")
	public String decreaseQuantity(@ModelAttribute("form")FoodMenuForm form, Model model, HttpSession session, @RequestParam("id") long id) {
	    
		
		FoodCartDTO dto = service.findById(id);
		
		FoodMenuDTO food =	foodMenuService.findMenuItemById(dto.getFoodId());
		if(dto.getFoodPrice()>food.getFoodPrice())
		{
			dto.setFoodPrice(dto.getFoodPrice()-food.getFoodPrice());
		}
		
		service.update(dto);
		return "redirect:/viewCart";
	}
	
	
	
}
