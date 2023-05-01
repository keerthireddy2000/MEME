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

import com.mallmgt.dto.GameDTO;
import com.mallmgt.dto.GameRechargeDTO;
import com.mallmgt.dto.UserDTO;
import com.mallmgt.exception.RecordNotFoundException;
import com.mallmgt.form.GameForm;
import com.mallmgt.form.GameRechargeForm;
import com.mallmgt.service.GameService;


@Controller
public class GameCtl {
	
	
	@Autowired
	public GameService service;
	


	@GetMapping("/game")
	public String game(@ModelAttribute("form")GameForm  form, Model model) {
		return "game";
	}
	
	@GetMapping("/gameDetails")
	public String gameDetails(@ModelAttribute("form")GameForm  form, Model model, @RequestParam("id") long id) {
		
		GameDTO game = service.findGameById(id);
		model.addAttribute("game", game);
		
		return "gamedetails";
	}

	
	@GetMapping("/gameRecharge")
	public String gameRecharge(@ModelAttribute("form")GameRechargeForm  form, Model model, HttpSession session) {
		UserDTO user = (UserDTO)session.getAttribute("user");
		long amount = 0;
		List<GameRechargeDTO> list = service.CardBalance(user.getId());
		
		for (GameRechargeDTO gameRechargeDTO : list) {
			System.out.println("amount" + amount);
			amount = amount + gameRechargeDTO.getAmount();
			System.out.println("amount2" + amount);
		}
		
		if(list!=null) {
			model.addAttribute("balance", amount);
		}else {
			model.addAttribute("balance", 0);
			model.addAttribute("cardId", form.getId());
		}
		
		return "gamerecharge";
		//model.addAttribute("totalPrice",form.getAmount());
		//return "redirect:/payment";
	}
	
	@PostMapping("/addGameRecharge")
	public String addGameRecharge(@ModelAttribute("form")GameRechargeForm  form, Model model, HttpSession session) {
	     UserDTO user = (UserDTO)session.getAttribute("user");		
		GameRechargeDTO dto = form.getDTO();
		dto.setUserId(user.getId());
		service.RechargeCard(dto);
		model.addAttribute("success", "Recharge Successful!");
		model.addAttribute("totalPrice",form.getAmount());
		return "redirect:/payment";
		
	}
	
	@PostMapping("/addGame")
	public String Add(@RequestParam(value = "image") MultipartFile image, @Valid @ModelAttribute("form")GameForm form,  BindingResult bindingResult, Model model) throws IOException {

		System.out.println("form: "+form);
		try {
		if (bindingResult.hasErrors()) {
			System.out.println("bindingResult : "+bindingResult);
			return "game";
		}else {
			GameDTO bean = form.getDTO();
			bean.setImage(image.getBytes());
			if(form.getId()>0) {
				String link = bean.getVideoLink();
				String links[] = link.split("youtu.be/");
				bean.setVideoLink(links[1]);
				service.update(bean);
				model.addAttribute("success", "Game Updated successfully");
			}else {
				String link = bean.getVideoLink();
				String links[] = link.split("youtu.be/");
				bean.setVideoLink(links[1]);
				service.Add(bean);
				model.addAttribute("success", "Game Added successfully");
			}
			
			return "game";
		}}catch (RecordNotFoundException e) {
			// TODO: handle exception
			model.addAttribute("error", e.getMessage());
			e.printStackTrace();
			return "game";
		}
	}
	

	@GetMapping("/gameList")
	public String list(@ModelAttribute("form")GameForm form, Model model){
	List<GameDTO> list = service.list();
	for(int i=0; i< list.size(); i++) {
		String link = list.get(i).getVideoLink();
		link = "https://youtu.be/" + link;
		list.get(i).setVideoLink(link);
	}
	model.addAttribute("list", list);
	return "gamelist";
		
	}
	
	@GetMapping("/gameEdit")	
	public String update(@ModelAttribute("form")GameForm form, Model model, @RequestParam("id") long id ){
		GameDTO bean = service.findGameById(id);
		String link = bean.getVideoLink();
		link = "https://youtu.be/" + link;
		bean.setVideoLink(link);
		form.populate(bean);
		System.out.println("Edit Bean:" +bean.toString());
		model.addAttribute("bean",bean);	
		return "game";
	}
	
	@GetMapping("/gameDelete")	
	public String delete(@ModelAttribute("form")GameForm form, Model model, @RequestParam("id") long id ) throws Exception{
		service.delete(id);	
		
		List<GameDTO> list =	service.list();
		model.addAttribute("list", list);
		model.addAttribute("success", "Game Deleted successfully");
		return "gamelist";
	}
	
	@GetMapping("/getGameImage/{id}")
	public void getNewsImage(HttpServletResponse response, @PathVariable("id") long id) throws Exception {
		response.setContentType("image/jpeg");		
		Blob blb=service.getImageById(id);				
		byte[] bytes = blb.getBytes(1, (int) blb.length());
		InputStream inputStream = new ByteArrayInputStream(bytes);
		IOUtils.copy(inputStream, response.getOutputStream());
	
	}
	

	
}
