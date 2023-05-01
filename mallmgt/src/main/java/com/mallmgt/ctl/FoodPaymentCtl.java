package com.mallmgt.ctl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mallmgt.dto.FoodCartDTO;
import com.mallmgt.dto.FoodPaymentDTO;
import com.mallmgt.dto.UserDTO;
import com.mallmgt.form.FoodPaymentForm;
import com.mallmgt.service.FoodCartService;
import com.mallmgt.service.FoodPaymentService;


@Controller
public class FoodPaymentCtl {

	
	@Autowired
	private FoodPaymentService service;
	
	@Autowired
	private FoodCartService foodCartService;
	
	@GetMapping("/foodPayment")
	public String paymentpage(@ModelAttribute("form")FoodPaymentForm form, Model model, @RequestParam("totalPrice") String totalPrice) {
		model.addAttribute("totalPrice", totalPrice);
		return "foodpaymentview";
	}
	
	@PostMapping("/addFoodPayment")
	public String add(@ModelAttribute("form")FoodPaymentForm form, BindingResult bindingResult, Model model, HttpSession session ) {

		if(bindingResult.hasErrors()) {
			return "foodpaymentview";
		}else {
			FoodPaymentDTO dto = form.getDTO();
			
			UserDTO user = (UserDTO)session.getAttribute("user");
			dto.setEmail(user.getEmail());
			service.Add(dto);
			model.addAttribute("success", "Payment Done!");
		List<FoodCartDTO> FoodCartList =	foodCartService.findCartInfoByUserId(user.getId());
		
		for (FoodCartDTO foodCartDTO : FoodCartList) {
			foodCartDTO.setPaymentStatus("Paid");
			foodCartService.update(foodCartDTO);
			//Updated Payment Status to make cart empty........
		}
		}
		return "foodpaymentview";
	}
	
	@GetMapping("/foodPaymentList")
	public String list(@ModelAttribute("form")FoodPaymentForm form, Model model, HttpSession session) {
		
		UserDTO user = (UserDTO) session.getAttribute("user");
		List<FoodPaymentDTO> list =null;
		if(user.getUserRole().equals("User")) {
			list = service.list(user.getEmail());
		}else {
			list = service.list();
		}
		 
        model.addAttribute("list", list);
		return "foodpaymentlistview";
	}
}
