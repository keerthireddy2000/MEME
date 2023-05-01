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

import com.mallmgt.dto.EventDTO;
import com.mallmgt.dto.ShopDTO;
import com.mallmgt.exception.RecordNotFoundException;
import com.mallmgt.form.EventForm;
import com.mallmgt.form.ShopForm;
import com.mallmgt.service.EventService;
import com.mallmgt.service.ShopService;

@Controller
public class EventCtl {

	@Autowired
	public EventService service;
	
	

	@GetMapping("/event")
	public String event(@ModelAttribute("form")EventForm form, Model model) {

		return "event";
	}

	@PostMapping("/addEvent")
	public String Add(@RequestParam(value = "image") MultipartFile image, @Valid @ModelAttribute("form")EventForm form,  BindingResult bindingResult, Model model) throws IOException {

		System.out.println("form: "+form);
		try {
		if (bindingResult.hasErrors()) {
			System.out.println("bindingResult : "+bindingResult);
			return "event";
		}else {
			EventDTO bean = form.getDTO();			
			bean.setImage(image.getBytes());
			if(form.getId()>0) {
				service.update(bean);
				model.addAttribute("success", "Event Updated successfully");
			}else {
			service.Add(bean);
			model.addAttribute("success", "Event Added successfully");
			}
			
			return "event";
		}}catch (RecordNotFoundException e) {
			// TODO: handle exception
			model.addAttribute("error", e.getMessage());
			e.printStackTrace();
			return "event";
		}
	}
	
	@GetMapping("/eventList")
	public String list(@ModelAttribute("form")EventForm form, Model model){
	List<EventDTO> list = service.list();
	model.addAttribute("list", list);
	return "eventlist";
		
	}
	
	
	@GetMapping("/eventEdit")	
	public String update(@ModelAttribute("form")EventForm form, Model model, @RequestParam("id") long id ){
		EventDTO bean = service.findEventDTO(id);
		form.populate(bean);
		model.addAttribute("bean",bean);	
		return "event";
	}
	
	@GetMapping("/eventDelete")	
	public String delete(@ModelAttribute("form")EventForm form, Model model, @RequestParam("id") long id ) throws Exception{
		service.delete(id);	
		
		List<EventDTO> list =	service.list();
		model.addAttribute("list", list);
		model.addAttribute("success", "Shop Deleted successfully");
		return "eventlist";
	}

	@GetMapping("/getEventImage/{id}")
	public void getNewsImage(HttpServletResponse response, @PathVariable("id") long id) throws Exception {
		response.setContentType("image/jpeg");		
		Blob blb=service.getImageById(id);				
		byte[] bytes = blb.getBytes(1, (int) blb.length());
		InputStream inputStream = new ByteArrayInputStream(bytes);
		IOUtils.copy(inputStream, response.getOutputStream());
	
	}
	
	
}
