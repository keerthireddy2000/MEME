package com.mallmgt.ctl;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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

import com.mallmgt.dto.ApplyJobDTO;
import com.mallmgt.dto.UserDTO;
import com.mallmgt.exception.RecordNotFoundException;
import com.mallmgt.form.ApplyJobForm;
import com.mallmgt.service.ApplyJobService;

@Controller
public class ApplyJobCtl {

	
	@Autowired
	public ApplyJobService service;

	@GetMapping("/applyJob")
	public String applyJob(@ModelAttribute("form")ApplyJobForm form, @RequestParam("id") long id, @RequestParam("jobName") String jobName, Model model, HttpSession session) {
         UserDTO user = (UserDTO)session.getAttribute("user");
         if(user==null) {
 			return "login";
 		}
		  model.addAttribute("jobId", id);
		  System.out.println(jobName);
		  model.addAttribute("jobName", jobName);
		  model.addAttribute("user", user);
		return "applyjob";
	}

	@PostMapping("/addApplyJob")
	public String Add(@RequestParam(value = "file") MultipartFile file, @Valid @ModelAttribute("form")ApplyJobForm form,  BindingResult bindingResult, Model model) throws IOException {

		System.out.println("form: "+form);
		try {
		if (bindingResult.hasErrors()) {
			System.out.println("bindingResult : "+bindingResult);
			return "applyjob";
		}else {
			ApplyJobDTO bean = form.getDTO();
			bean.setFile(file.getBytes());
			bean.setStatus("Applied");
			if(form.getId()>0) {
				service.update(bean);
				model.addAttribute("success", "Applied successfully");
			}else {
			service.Add(bean);
			model.addAttribute("success", "Applied successfully");
			}
			
			return "applyjob";
		}}catch (RecordNotFoundException e) {
			// TODO: handle exception
			model.addAttribute("error", e.getMessage());
			e.printStackTrace();
			return "applyjob";
		}
	}
	
	@GetMapping("/applyjobList")
	public String list(@ModelAttribute("form")ApplyJobForm form, Model model){
	List<ApplyJobDTO> list = service.list();
	model.addAttribute("list", list);
	return "applyjoblist";
		
	}
	
	
	@GetMapping("/accpetJobApplication")	
	public String accpetJobApplication(@RequestParam("id") long id, Model model){
		ApplyJobDTO bean = service.findAppliedJobById(id);
		
		System.out.println("Bean:"+bean.toString());
		
		bean.setStatus("Accepted");
		service.update(bean);
		System.out.println("Bean:"+bean.toString());
		List<ApplyJobDTO> list = service.list();
		model.addAttribute("list", list);
		return "applyjoblist";
	}
	
	@GetMapping("/rejectJobApplication")	
	public String rejectJobApplication(@RequestParam("id") long id, Model model ){
		ApplyJobDTO bean = service.findAppliedJobById(id);
		bean.setStatus("Rejected");
		service.update(bean);
		List<ApplyJobDTO> list = service.list();
		model.addAttribute("list", list);
		return "applyjoblist";
	}
	
	/*@GetMapping("/getResume/{id}")
	public void getResume(HttpServletResponse response, @PathVariable("id") long id) throws Exception {
		response.setContentType("file/pdf");		
		Blob blb=service.getFileById(id);				
		byte[] bytes = blb.getBytes(1, (int) blb.length());
		InputStream inputStream = new ByteArrayInputStream(bytes);
		IOUtils.copy(inputStream, response.getOutputStream());
	
	}*/
	@GetMapping("/getResume/{id}")
	public void getResume(HttpServletResponse response, @PathVariable("id") long id) throws Exception {
	    Blob blb = service.getFileById(id);
	    byte[] bytes = blb.getBytes(1, (int) blb.length());
	    String fileName = service.findUserName(id)+"_Resume.pdf";
	    response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
	    response.setContentType("application/pdf");
	    InputStream inputStream = new ByteArrayInputStream(bytes);
	    IOUtils.copy(inputStream, response.getOutputStream());
	}


}
