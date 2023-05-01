package com.mallmgt.ctl;

import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mallmgt.dao.MovieSeatDAO;
import com.mallmgt.dto.BookingDTO;
import com.mallmgt.dto.MovieBookingDTO;
import com.mallmgt.dto.MovieDTO;
import com.mallmgt.dto.MovieSeatDTO;
import com.mallmgt.dto.PaymentDTO;
import com.mallmgt.form.MovieBookingForm;
import com.mallmgt.form.MovieForm;
import com.mallmgt.service.MovieBookingService;
import com.mallmgt.service.MovieService;
import com.mallmgt.utility.DataUtility;
import com.mallmgt.dto.UserDTO;

@Controller
public class MovieBookingCtl {
	
	@Autowired
	public MovieService movieService;
	
	@Autowired
	public MovieSeatDAO movieSeatDAO;
	
	@Autowired
	public MovieBookingService service;
	
	@PostMapping("/movieBooking")
	public String MoviePage(@ModelAttribute("form") MovieBookingForm form, Model model, @RequestParam("id") long id, HttpSession session, HttpServletRequest req) {
    
		String showID = req.getParameter("show");
		System.out.println("showID: "+showID);
		UserDTO user = (UserDTO)session.getAttribute("user");
		if(user==null) {
			return "login";
		}
		MovieDTO movieDTO = movieService.findMovieById(id);
       List<MovieSeatDTO> list = movieSeatDAO.findByMovieIdAndShowId(id, DataUtility.getLong(showID));
 
	   model.addAttribute("movieDTO",movieDTO);	
	   model.addAttribute("list", list);
	   model.addAttribute("user", user);
	   model.addAttribute("showID",showID);
		return "moviebookingview";
	}
	
	@PostMapping("/addMovieBooking")
	public String movieBooking(@ModelAttribute("form") MovieBookingForm form, Model model, HttpServletRequest req) {
		String seatNumbers = "";
		MovieBookingDTO dto = form.getDTO();
		dto.setId(0);
		System.out.println("dto: "+dto);
		String showId = req.getParameter("showId");
		System.out.println("showId at Movie booking form: "+showId);
		
		//List<String> list = dto.getSeats();
		
		/*for (String id : list) {
			System.out.println("Booked Seats Id: "+id);
			movieService.updateSeatStatus(DataUtility.getLong(id), DataUtility.getLong(showId));
			
			
		    MovieSeatDTO seatDto = 	movieSeatDAO.findById(DataUtility.getLong(id));
		    long seatNum = seatDto.getSeat();
		    seatNumbers = seatNumbers +"," +DataUtility.getStringData(seatNum);
		//	movieService.updateSeatStatus(16, 4);
		}*/
		List<String> list = dto.getSeats();

		if (!list.isEmpty()) {
		    // Initialize seatNumbers with the first seat number
		    MovieSeatDTO firstSeat = movieSeatDAO.findById(DataUtility.getLong(list.get(0)));
		    long firstSeatNum = firstSeat.getSeat();
		    seatNumbers = DataUtility.getStringData(firstSeatNum);
		}

		for (int i = 1; i < list.size(); i++) {
		    String id = list.get(i);
		    System.out.println("Booked Seats Id: " + id);
		    movieService.updateSeatStatus(DataUtility.getLong(id), DataUtility.getLong(showId));
		    MovieSeatDTO seatDto = movieSeatDAO.findById(DataUtility.getLong(id));
		    long seatNum = seatDto.getSeat();
		    seatNumbers = seatNumbers + "," + DataUtility.getStringData(seatNum);
		}

		System.out.println("Booked Seat Numbers: "+seatNumbers);
		System.out.println("Booking form" +dto);
		long totalPrice =dto.getPrice()*list.size();
		System.out.println("list.size(): "+list.size());
		System.out.println("dto.getPrice(): "+dto.getPrice());
		System.out.println("totalPrice: "+totalPrice);
		
		if(DataUtility.getLong(showId) == 1) {
			dto.setShowTime("10:00 AM");
		}else if(DataUtility.getLong(showId) == 2) {
			dto.setShowTime("1:00 PM");
		}else if(DataUtility.getLong(showId) == 3) {
			dto.setShowTime("4:00 PM");
		}else if(DataUtility.getLong(showId) == 4) {
			dto.setShowTime("7:00 PM");
		}else if(DataUtility.getLong(showId) == 5) {
			dto.setShowTime("10:00 PM");
		}
		
		
		dto.setPrice(totalPrice);
		dto.setSeatNumbers(seatNumbers);
		service.Add(dto);
		model.addAttribute("totalPrice", totalPrice);
		return "redirect:/payment";
	}

	@GetMapping("/movieBookingList")
	public String list(@ModelAttribute("form") MovieBookingForm form, Model model, HttpSession session) {
		List<MovieBookingDTO> list = null;
		UserDTO user = (UserDTO) session.getAttribute("user");
		String email  = user.getEmail();
		
		System.out.println("Booking list email: "+email);
		
		if(user.getUserRole().equals("Admin")) {
			 list = service.List();
		}else {
			list = service.findMovieByEmail(email);
		}
		for(int i=0; i< list.size(); i++) {
			   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		       String formattedDate = formatter.format(list.get(i).getDate());
		       list.get(i).setDateString(formattedDate);
		       //System.out.println("");
		}
		model.addAttribute("list", list);
		return "moviebookingviewlist";
	}
	
	@GetMapping("/viewBookedTicket")
	public String viewBookedTicket(@RequestParam("id") long id,Model model) throws Exception {
	   MovieBookingDTO dto =	service.findMovieBookingById(id);
	   List<String> seats = dto.getSeats();
	   
	   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
       String formattedDate = formatter.format(dto.getDate());
       dto.setDateString(formattedDate);
	   model.addAttribute("ticket", dto);
		return "viewbookedticket";
	}
	
	
}
