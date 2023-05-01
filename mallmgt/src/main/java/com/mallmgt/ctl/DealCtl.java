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

import com.mallmgt.dto.DealDTO;
import com.mallmgt.exception.RecordNotFoundException;
import com.mallmgt.form.DealForm;
import com.mallmgt.service.DealService;


@Controller
public class DealCtl {
	
	@Autowired
	public DealService service;
	
	

	@GetMapping("/deal")
	public String event(@ModelAttribute("form")DealForm form, Model model) {

		return "deal";
	}

	@PostMapping("/addDeal")
	public String Add(@RequestParam(value = "image") MultipartFile image, @Valid @ModelAttribute("form")DealForm form,  BindingResult bindingResult, Model model) throws IOException {

		System.out.println("form: "+form);
		try {
		if (bindingResult.hasErrors()) {
			System.out.println("bindingResult : "+bindingResult);
			return "deal";
		}else {
			DealDTO bean = form.getDTO();
			if(bean.getDealType() == null) {
				bean.setDealType("false");
			}
			bean.setImage(image.getBytes());
			if(form.getId()>0) {
				service.update(bean);
				model.addAttribute("success", "Deal Updated successfully");
			}else {
			service.Add(bean);
			model.addAttribute("success", "Deal Added successfully");
			}
			
			return "deal";
		}}catch (RecordNotFoundException e) {
			// TODO: handle exception
			model.addAttribute("error", e.getMessage());
			e.printStackTrace();
			return "deal";
		}
	}
	
	@GetMapping("/dealList")
	public String list(@ModelAttribute("form")DealForm form, Model model){
	List<DealDTO> list = service.list();
	model.addAttribute("list", list);
	return "deallist";
		
	}
	
	
	@GetMapping("/dealEdit")	
	public String update(@ModelAttribute("form")DealForm form, Model model, @RequestParam("id") long id ){
		DealDTO bean = service.findDealDTO(id);
		if(bean.getDealType() == "false") {
			bean.setDealType(null);
		}
		form.populate(bean);
		model.addAttribute("bean",bean);	
		return "deal";
	}
	
	@GetMapping("/dealDelete")	
	public String delete(@ModelAttribute("form")DealForm form, Model model, @RequestParam("id") long id ) throws Exception{
		service.delete(id);	
		
		List<DealDTO> list =	service.list();
		model.addAttribute("list", list);
		model.addAttribute("success", "Deal Deleted successfully");
		return "deallist";
	}

	@GetMapping("/getDealImage/{id}")
	public void getNewsImage(HttpServletResponse response, @PathVariable("id") long id) throws Exception {
		response.setContentType("image/jpeg");		
		Blob blb=service.getImageById(id);				
		byte[] bytes = blb.getBytes(1, (int) blb.length());
		InputStream inputStream = new ByteArrayInputStream(bytes);
		IOUtils.copy(inputStream, response.getOutputStream());
	
	}
	

}
