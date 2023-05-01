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

import com.mallmgt.dto.FoodStallDTO;
import com.mallmgt.dto.MovieDTO;
import com.mallmgt.exception.RecordNotFoundException;
import com.mallmgt.form.FoodStallForm;
import com.mallmgt.form.MovieForm;
import com.mallmgt.service.FoodStallService;

@Controller
public class FoodStallCtl {

	@Autowired
	public FoodStallService service;

	@GetMapping("/foodStall")
	public String FoodStall(@ModelAttribute("form")FoodStallForm form, Model model) {
		return "foodstall";
	}
	
	@PostMapping("/addFoodStall")
	public String Add(@Valid @ModelAttribute("form")FoodStallForm form,  BindingResult bindingResult, Model model, @RequestParam(value = "image") MultipartFile image) throws IOException {

		System.out.println("form: "+form);
		try {
		if (bindingResult.hasErrors()) {
			System.out.println("bindingResult : "+bindingResult);
			return "foodstall";
		}else {
			FoodStallDTO bean = form.getDTO();
			System.out.println(bean.getCuisine() + " " + bean.getStallLocation());
			bean.setImage(image.getBytes());
			if(form.getId()>0) {

				service.update(bean);
				model.addAttribute("success", "Stall Updated successfully");
			}else {
				service.Add(bean);
				model.addAttribute("success", "Stall Added successfully");
			}
			
			return "foodstall";
		}}catch (RecordNotFoundException e) {
			// TODO: handle exception
			model.addAttribute("error", e.getMessage());
			e.printStackTrace();
			return "foodstall";
		}
	}
	

	@GetMapping("/foodStallList")
	public String list(@ModelAttribute("form")FoodStallForm form, Model model){
	List<FoodStallDTO> list = service.list();
	model.addAttribute("list", list);
	return "foodstalllist";
		
	}
	
	@GetMapping("/foodStallEdit")	
	public String update(@ModelAttribute("form")FoodStallForm form, Model model, @RequestParam("id") long id ){
		FoodStallDTO bean = service.findStallById(id);
		form.populate(bean);
		model.addAttribute("bean",bean);
		return "foodstall";
	}
	
	@GetMapping("/foodStallDelete")	
	public String delete(@ModelAttribute("form")FoodStallForm form, Model model, @RequestParam("id") long id ) throws Exception{
		service.delete(id);	
		List<FoodStallDTO> list =	service.list();
		model.addAttribute("list", list);
		model.addAttribute("success", "Stall Deleted successfully");
		return "foodstalllist";
	}
	
	@PostMapping("/searchStallByFilter")
	public String FoodStallByFilter(@ModelAttribute("form") FoodStallForm form, Model model, @RequestParam("cuisine") String cuisine) {
		System.out.println("form.getOperation(): "+form.getOperation());
		List<FoodStallDTO> list =	service.searchByCuisine(cuisine);
		if (form.getOperation().equalsIgnoreCase("Reset")) {
			System.out.println("Required Operation: "+form.getOperation());
			return "redirect:/foodStallList";
		}	
		model.addAttribute("list", list);
		return "foodstalllist";
	}
	
	@GetMapping("/getStallImage/{id}")
	public void getNewsImage(HttpServletResponse response, @PathVariable("id") long id) throws Exception {
		response.setContentType("image/jpeg");		
		Blob blb=service.getImageById(id);				
		byte[] bytes = blb.getBytes(1, (int) blb.length());
		InputStream inputStream = new ByteArrayInputStream(bytes);
		IOUtils.copy(inputStream, response.getOutputStream());
	
	}
	
}
