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
import com.mallmgt.dto.FoodStallDTO;
import com.mallmgt.dto.UserDTO;
import com.mallmgt.form.FoodStallForm;
import com.mallmgt.service.FoodCartService;
import com.mallmgt.service.FoodMenuService;
import com.mallmgt.service.FoodStallService;

@Controller
public class FoodBookingCtl {

	@Autowired
	public FoodStallService stallService;
	
	@Autowired
	public FoodCartService foodCartService;

	@GetMapping("/foodBookingHistory")
	public String foodBookingHistory(Model model, HttpSession session) {
		List<FoodCartDTO> list = null;
		UserDTO dto = (UserDTO) session.getAttribute("user");	
		if(dto.getUserRole().equals("Admin")) {
			list = foodCartService.list();
		}
		else if(dto.getUserRole().equals("FoodAdmin")) {
			long foodStallId = Long.parseLong(dto.getFoodStallId());
			list = foodCartService.findCartInfoByStallId(foodStallId);
		}
		else {
			list = foodCartService.findCartInfoByUserId(dto.getId());
		}
		 
		model.addAttribute("list", list);
		
		return "foodbookinghistorylistview";
	}
	
	@GetMapping("/updateDeliveryStatus")
	public String updateDeliveryStatus(Model model, @RequestParam("id") long id, HttpSession session) {		
	
		System.out.println("Ready To Pick Id:" +id);
	 FoodCartDTO dto =	foodCartService.findById(id);
	 dto.setDeliveryStatus("Ready To Pick");	
	 foodCartService.update(dto);
	 
	   UserDTO user = (UserDTO)session.getAttribute("user");	
		List<FoodCartDTO> list = foodCartService.findCartInfoByUserId(user.getId());
		model.addAttribute("list", list);
	 
		return "redirect:/foodBookingHistory";
	}
	
	@GetMapping("/acceptFoodBooking")
	public String acceptFoodBooking(Model model, @RequestParam("id") long id, HttpSession session) {		
	
		System.out.println("Ready To Pick Id:" +id);
	 FoodCartDTO dto =	foodCartService.findById(id);
	 dto.setStatus("Accepted");	
	 foodCartService.update(dto);
	 
	   UserDTO user = (UserDTO)session.getAttribute("user");	
		List<FoodCartDTO> list = foodCartService.findCartInfoByUserId(user.getId());
		model.addAttribute("list", list);
	 
		return "redirect:/foodBookingHistory";
	}
	
	@GetMapping("/rejectFoodBooking")
	public String rejectFoodBooking(Model model, @RequestParam("id") long id, HttpSession session) {		
	
		System.out.println("Ready To Pick Id:" +id);
	 FoodCartDTO dto =	foodCartService.findById(id);
	 dto.setStatus("Rejected");	
	 foodCartService.update(dto);
	 
	   UserDTO user = (UserDTO)session.getAttribute("user");	
		List<FoodCartDTO> list = foodCartService.findCartInfoByUserId(user.getId());
		model.addAttribute("list", list);
	 
		return "redirect:/foodBookingHistory";
	}
	
	
}
