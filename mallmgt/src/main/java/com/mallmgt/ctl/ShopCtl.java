package com.mallmgt.ctl;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import com.mallmgt.dto.ShopDTO;
import com.mallmgt.exception.RecordNotFoundException;
import com.mallmgt.form.ShopForm;
import com.mallmgt.service.ShopService;

@Controller
public class ShopCtl {

	
	@Autowired
	public ShopService service;
	
	

	@GetMapping("/shop")
	public String shop(@ModelAttribute("form")ShopForm form, Model model) {

		return "shop";
	}

	@PostMapping("/addShop")
	public String Add(@RequestParam(value = "image") MultipartFile image, @Valid @ModelAttribute("form")ShopForm form,  BindingResult bindingResult, Model model) throws Exception {

		System.out.println("form: "+form);
		try {
		if (bindingResult.hasErrors()) {
			System.out.println("bindingResult : "+bindingResult);
			return "shop";
		}else {
			ShopDTO bean = form.getDTO();
			bean.setImage(image.getBytes());
			if(form.getId()>0) {
				ShopDTO new_bean = service.findByShopId(bean.getShopId());
				if(new_bean != null) {			
					service.delete(new_bean.getId());
				}
				service.Add(bean);
				model.addAttribute("success", "Shop Updated successfully");
			}
			else {
				ShopDTO new_bean = service.findByShopId(bean.getShopId());
				if(new_bean != null) {			
					service.delete(new_bean.getId());
				}
				service.Add(bean);
				model.addAttribute("success", "Shop Added successfully");
			}
			
			return "shop";
		}}catch (RecordNotFoundException e) {
			// TODO: handle exception
			model.addAttribute("error", e.getMessage());
			e.printStackTrace();
			return "shop";
		}
	}
	
	@GetMapping("/shopList")
	public String list(@ModelAttribute("form")ShopForm form, Model model){
	List<ShopDTO> list = service.list();
	model.addAttribute("list", list);
	return "shoplist";
		
	}
	
	
	@GetMapping("/shopEdit")	
	public String update(@ModelAttribute("form")ShopForm form, Model model, @RequestParam("id") long id ){
		ShopDTO bean = service.findShopById(id);
		form.populate(bean);
		model.addAttribute("bean",bean);	
		return "shop";
	}
	
	@GetMapping("/shopDelete")	
	public String delete(@ModelAttribute("form")ShopForm form, Model model, @RequestParam("id") long id ) throws Exception{
		service.delete(id);	
		
		List<ShopDTO> list =	service.list();
		model.addAttribute("list", list);
		model.addAttribute("success", "Shop Deleted successfully");
		return "shoplist";
	}

	@GetMapping("/getShopImage/{id}")
	public void getNewsImage(HttpServletResponse response, @PathVariable("id") long id) throws Exception {
		response.setContentType("image/jpeg");		
		Blob blb=service.getImageById(id);				
		byte[] bytes = blb.getBytes(1, (int) blb.length());
		InputStream inputStream = new ByteArrayInputStream(bytes);
		IOUtils.copy(inputStream, response.getOutputStream());
	
	}
	
	
}
