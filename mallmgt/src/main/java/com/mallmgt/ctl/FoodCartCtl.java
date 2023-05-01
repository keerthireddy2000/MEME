package com.mallmgt.ctl;

import java.util.List;
import java.util.ArrayList;


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
		if(user==null) {
			return "login";
		}
		
		FoodMenuDTO dto =	foodMenuService.findMenuItemById(id);
		FoodCartDTO dto2 = new FoodCartDTO();
	
		dto2.setDeliveryTime(dto.getDeliveryTime());
		dto2.setFoodName(dto.getFoodName());
		dto2.setFoodId(id);
		dto2.setFoodPrice(dto.getFoodPrice());
		dto2.setUnitPrice(dto.getFoodPrice());
		dto2.setPaymentStatus("Not Paid");
		dto2.setDeliveryStatus("In Process");
		dto2.setStallId(dto.getStallId());
		dto2.setStallName(dto.getStallName());
		dto2.setUserId(user.getId());
		dto2.setOrderby(user.getEmail());
		dto2.setStatus("In Process");
		dto2.setQuantity(1);
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
	    List<FoodCartDTO> final_list = new ArrayList<FoodCartDTO>();
	    Boolean flag = false;
	    int count =0;
	    for(int i=0;i<list.size(); i++) {
	    	flag = false;
	    	int j = 0;
	    	long price = list.get(i).getUnitPrice();
	    	for(j =0; j<final_list.size(); j++) {
	    		if(list.get(i).getFoodId() == final_list.get(j).getFoodId()) {
	    			flag = true;
	    			break;
	    		}
	    	}
	    	if(flag == false) {
	    		final_list.add(list.get(i));
	    	}
	    	else {
	    		long quantity = list.get(i).getQuantity();
	    		quantity = quantity +1 ;
	    		list.get(i).setQuantity(quantity);
	    		price += list.get(i).getFoodPrice();
	    		list.get(i).setFoodPrice(price);
	    		final_list.remove(j);
	    		final_list.add(list.get(i));
	    	}
	    }
	    
	    long totalPrice = 0;
	    for (FoodCartDTO foodCartDTO : final_list) {
	    	totalPrice = foodCartDTO.getFoodPrice() + totalPrice;
		}
	    System.out.println(final_list);
	    model.addAttribute("totalPrice", totalPrice);
	    model.addAttribute("list", final_list);
		return "foodcartview";
	}
	
	@GetMapping("/increaseQuantity")
	public String increaseQuantity(@ModelAttribute("form")FoodMenuForm form, Model model, HttpSession session, @RequestParam("id") long id) {
	    
		FoodCartDTO dto = service.findById(id);
		FoodMenuDTO food =	foodMenuService.findMenuItemById(dto.getFoodId());
		long quantity = dto.getQuantity();
		quantity = quantity + 1;
		dto.setQuantity(quantity);
		long pr= dto.getUnitPrice()*quantity;
		System.out.println(dto.getUnitPrice()+" " + dto.getFoodPrice() + " " + pr);
		dto.setFoodPrice(pr);
		System.out.println(dto.getUnitPrice()+" " + dto.getFoodPrice() + " " + pr);
		service.update(dto);
		return "redirect:/viewCart";
	}
	
	@GetMapping("/decreaseQuantity")
	public String decreaseQuantity(@ModelAttribute("form")FoodMenuForm form, Model model, HttpSession session, @RequestParam("id") long id) {
	    
		
		FoodCartDTO dto = service.findById(id);
		
		FoodMenuDTO food =	foodMenuService.findMenuItemById(dto.getFoodId());
		
			long q = dto.getQuantity();
			q  = q-1;
			if(q == 0) {
				service.delete(dto);		
			}
			else {
				dto.setFoodPrice(dto.getFoodPrice()-food.getFoodPrice());
				dto.setQuantity(q);
				service.update(dto);
			}
		return "redirect:/viewCart";
	}
	
	
	
}
