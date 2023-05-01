package com.mallmgt.ctl;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

import com.mallmgt.dao.MovieSeatDAO;
import com.mallmgt.dto.MovieDTO;
import com.mallmgt.dto.MovieSeatDTO;
import com.mallmgt.exception.RecordNotFoundException;
import com.mallmgt.form.MovieBookingForm;
import com.mallmgt.form.MovieForm;
import com.mallmgt.service.MovieService;

@Controller
public class MovieCtl {
	
	@Autowired
	public MovieService service;
	
	@Autowired
	public MovieSeatDAO seatDao;

	@GetMapping("/movie")
	public String MoviePage(@ModelAttribute("form")MovieForm form, Model model) {

		return "movie";
	}

	@PostMapping("/addMovie")
	public String Add(@RequestParam(value = "image") MultipartFile image, @Valid @ModelAttribute("form")MovieForm form,  BindingResult bindingResult, Model model) throws IOException {

		System.out.println("form: "+form);
		try {
		if (bindingResult.hasErrors()) {
			System.out.println("bindingResult : "+bindingResult);
			return "movie";
		}else {
			MovieDTO bean = form.getDTO();			
			bean.setImage(image.getBytes());
			if(form.getId()>0) {
				service.update(bean);
				model.addAttribute("success", "Movie Updated successfully");
			}else {
			service.Add(bean);
			MovieDTO movieDTO =	service.findLastMovieId();
			service.creatSeats(movieDTO);
			model.addAttribute("success", "Movie Added successfully");
			}
			
			return "movie";
		}}catch (RecordNotFoundException e) {
			// TODO: handle exception
			model.addAttribute("error", e.getMessage());
			e.printStackTrace();
			return "movie";
		}
	}
	
	@GetMapping("/movieList")
	public String list(@ModelAttribute("form")MovieForm form, Model model){
	List<MovieDTO> list = service.list();
	model.addAttribute("list", list);
	return "movieslist";
		
	}
	
	@GetMapping("/movieGrid")
	public String movieGridList(@ModelAttribute("form")MovieForm form, Model model){
	List<MovieDTO> list = service.list();
	model.addAttribute("list", list);
	return "moviegrid";
		
	}
	
	
	@GetMapping("/seatView")
	public String seatView(@ModelAttribute("form")MovieForm form, Model model, @RequestParam("id") long id){
	MovieDTO movie =	service.findMovieById(id);
	List<MovieSeatDTO> seat = seatDao.findByMovieId(id);
	
	model.addAttribute("bean", movie);
	model.addAttribute("list", seat);
	return "seatview";
		
	}
	
	
	@GetMapping("/movieEdit")	
	public String update(@ModelAttribute("form")MovieForm form, Model model, @RequestParam("id") long id ){
		MovieDTO bean = service.findMovieById(id);
		form.populate(bean);
		model.addAttribute("bean",bean);	
		return "movie";
	}
	
	@GetMapping("/movieDelete")	
	public String delete(@ModelAttribute("form")MovieForm form, Model model, @RequestParam("id") long id ) throws Exception{
		service.delete(id);	
		
		List<MovieDTO> list =	service.list();
		model.addAttribute("list", list);
		model.addAttribute("success", "User Deleted successfully");
		return "movieslist";
	}

	@GetMapping("/getImage/{id}")
	public void getNewsImage(HttpServletResponse response, @PathVariable("id") long id) throws Exception {
		response.setContentType("image/jpeg");		
		Blob blb=service.getImageById(id);				
		byte[] bytes = blb.getBytes(1, (int) blb.length());
		InputStream inputStream = new ByteArrayInputStream(bytes);
		IOUtils.copy(inputStream, response.getOutputStream());
	
	}
	
	@PostMapping("/searchMovie")
	public String MoviesByGenre(@ModelAttribute("form") MovieForm form, Model model, @RequestParam("genre") String genre) {
		System.out.println("form.getOperation(): "+form.getOperation());
		List<MovieDTO> list =	service.searchByGenre(genre);
		if (form.getOperation().equalsIgnoreCase("Reset")) {
			System.out.println("Required Operation: "+form.getOperation());
			return "redirect:/movieList";
		}	
		model.addAttribute("list", list);
		return "movieslist";
	}
	
	@PostMapping("/searchMovieByFilter")
	public String MoviesByFilter(@ModelAttribute("form") MovieForm form, Model model, @RequestParam("genre") String genre) {
		System.out.println("form.getOperation(): "+form.getOperation());
		List<MovieDTO> list =	service.searchByGenreOrLanguageOrFormat(genre);
		if (form.getOperation().equalsIgnoreCase("Reset")) {
			System.out.println("Required Operation: "+form.getOperation());
			return "redirect:/movieList";
		}	
		model.addAttribute("list", list);
		return "movieslist";
	}
	
	@PostMapping("/searchMovieByFilter2")
	public String MoviesByFilter2(@ModelAttribute("form") MovieForm form, Model model, @RequestParam("genre") String genre) {
		System.out.println("form.getOperation(): "+form.getOperation());
		List<MovieDTO> list =	service.searchByGenreOrLanguageOrFormat(genre);
		if (form.getOperation().equalsIgnoreCase("Reset")) {
			return "redirect:/movieGrid";
		}	
		model.addAttribute("list", list);
		return "moviegrid";
	}
	
	@GetMapping("/updateSeat")
	public String updateSeat(@ModelAttribute("form")MovieForm form, Model model, @RequestParam("id") long id,@RequestParam("movieId") long movieId) {
		
	MovieSeatDTO  dto =	seatDao.findById(id);
	dto.setStatus("Available");
	seatDao.saveAndFlush(dto);
	
	MovieDTO movie =	service.findMovieById(movieId);
	List<MovieSeatDTO> seat = seatDao.findByMovieId(movieId);
	
	model.addAttribute("bean", movie);
	model.addAttribute("list", seat);
	return "seatview";

		
	}
	
	
}
