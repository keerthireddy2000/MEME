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
import com.mallmgt.dto.JobDTO;
import com.mallmgt.exception.RecordNotFoundException;
import com.mallmgt.form.EventForm;
import com.mallmgt.form.JobForm;
import com.mallmgt.service.EventService;
import com.mallmgt.service.JobService;

@Controller
public class JobCtl {

	@Autowired
	public JobService service;
	
	

	@GetMapping("/job")
	public String event(@ModelAttribute("form")JobForm form, Model model) {

		return "job";
	}

	@PostMapping("/addJob")
	public String Add(@Valid @ModelAttribute("form")JobForm form,  BindingResult bindingResult, Model model) throws IOException {

		System.out.println("form: "+form);
		try {
		if (bindingResult.hasErrors()) {
			System.out.println("bindingResult : "+bindingResult);
			return "job";
		}else {
			JobDTO bean = form.getDTO();			
			
			if(form.getId()>0) {
				service.update(bean);
				model.addAttribute("success", "Job Updated successfully");
			}else {
			service.Add(bean);
			model.addAttribute("success", "Job Added successfully");
			}
			
			return "job";
		}}catch (RecordNotFoundException e) {
			// TODO: handle exception
			model.addAttribute("error", e.getMessage());
			e.printStackTrace();
			return "job";
		}
	}
	
	@GetMapping("/jobList")
	public String list(@ModelAttribute("form")JobForm form, Model model){
	List<JobDTO> list = service.list();
	model.addAttribute("list", list);
	return "joblist";
		
	}
	
	
	@GetMapping("/jobEdit")	
	public String update(@ModelAttribute("form")JobForm form, Model model, @RequestParam("id") long id ){
		JobDTO bean = service.findEventDTO(id);
		form.populate(bean);
		model.addAttribute("bean",bean);	
		return "job";
	}
	
	@GetMapping("/jobDelete")	
	public String delete(@ModelAttribute("form")JobForm form, Model model, @RequestParam("id") long id ) throws Exception{
		service.delete(id);	
		
		List<JobDTO> list =	service.list();
		model.addAttribute("list", list);
		model.addAttribute("success", "Job Deleted successfully");
		return "joblist";
	}

}
