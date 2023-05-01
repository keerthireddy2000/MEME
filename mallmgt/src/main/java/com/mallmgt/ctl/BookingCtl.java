package com.mallmgt.ctl;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mallmgt.dao.BookingDAO;
import com.mallmgt.dao.SlotDAO;
import com.mallmgt.dto.BookingDTO;
import com.mallmgt.dto.ParkingDTO;
import com.mallmgt.dto.SlotDTO;
import com.mallmgt.dto.UserDTO;
import com.mallmgt.exception.RecordNotFoundException;
import com.mallmgt.form.BookingForm;
import com.mallmgt.form.ParkingForm;
import com.mallmgt.service.BookingService;
import com.mallmgt.service.ParkingService;


@Controller
public class BookingCtl {

     @Autowired
     public SlotDAO slotDAO;
     
     @Autowired
     public BookingDAO bookingDAO;
     
     @Autowired
     public BookingService service;
     
     @Autowired
     public ParkingService parkingService;
	
	@GetMapping("/booking")
	public String booking(@ModelAttribute("form")BookingForm form, Model model, @RequestParam("id") long id, HttpSession session) {
		UserDTO user = (UserDTO)session.getAttribute("user");
		if(user==null) {
			return "login";
		}
		ParkingDTO parkingDTO = parkingService.findParkingById(id);
		List<SlotDTO> slotList = slotDAO.findByParkingIdAndStatus(id, true);		
		model.addAttribute("slotList", slotList);
		model.addAttribute("user", user);
		model.addAttribute("parkingDTO", parkingDTO);
		
		return "booking";
	}
	
	@GetMapping("/bookBySlotById")	
	public String viewSlotById(@ModelAttribute("form")BookingForm form, Model model, @RequestParam("slotId") long slotId, HttpSession session ){
		UserDTO user = (UserDTO)session.getAttribute("user");
		if(user==null) {
			return "login";
		}
		SlotDTO slot = slotDAO.findById(slotId);
		ParkingDTO parkingDTO = parkingService.findParkingById(slot.getParkingId());
		System.out.println(parkingDTO.getId() + " " + slot.getSlot() + " " + slot.getId());
		List<SlotDTO> slotList = slotDAO.findByParkingIdAndStatus(parkingDTO.getId(), true);		
		model.addAttribute("slotList", slotList);
		model.addAttribute("user", user);
		model.addAttribute("slotId", slot.getId());
		model.addAttribute("slot", slot.getSlot());
		model.addAttribute("parkingDTO", parkingDTO);
		return "booking";
	}
	
	@PostMapping("/addBooking")
	public String Add(@Valid @ModelAttribute("form")BookingForm form,  BindingResult bindingResult, Model model) {
		System.out.println("jdsj");
		System.out.println("form: "+form);
		try {
		if (bindingResult.hasErrors()) {
			System.out.println("bindingResult : "+bindingResult);
			return "booking";
		}else {
			BookingDTO bean = form.getDTO();
			bean.setId(0);
		    //SlotDTO slotDTO = slotDAO.findById(bean.getSlotId());			
			//bean.setSlot(slotDTO.getSlot());
			//bean.setSlotId(slotDTO.getId());
			System.out.println(bean.getSlot() +" " + bean.getSlotId());
			bean.setStatus("Cancel");
			service.Add(bean);
			//model.addAttribute("success", "Booking successfully");
			model.addAttribute("totalPrice", 50);
			return "redirect:/payment";
		}}catch (RecordNotFoundException e) {
			// TODO: handle exception
			model.addAttribute("error", e.getMessage());
			e.printStackTrace();
			return "booking";
		}
	}
	
	@GetMapping("/bookinglist")
	public String list(@ModelAttribute("form")BookingForm form, Model model, HttpSession session){
		List<BookingDTO> list = null;
		UserDTO user = (UserDTO) session.getAttribute("user");
		String email  = user.getEmail();
		System.out.println("Booking list email: "+email);
		if(user.getUserRole().equals("Admin")) {
			 list = service.list();
		}else {
			list = service.findBookingByEmail(email);
		}
		
	model.addAttribute("list", list);
	return "bookinglist";
		
	}
	
	@GetMapping("/cancelBooking")
	public String cancelBooking(@ModelAttribute("form")BookingForm form, Model model, @RequestParam("id") long id, @RequestParam("slotid") long slotid, HttpSession session) {
		SlotDTO slot = slotDAO.findById(slotid);
		slot.setStatus(true);
		slotDAO.saveAndFlush(slot);

		BookingDTO booking = bookingDAO.findById(id);
		booking.setStatus("Canceled");
		bookingDAO.saveAndFlush(booking);
		
		List<BookingDTO> list = null;
		UserDTO user = (UserDTO) session.getAttribute("user");
		String email  = user.getEmail();
		System.out.println("Booking list email: "+email);
		if(user.getUserRole().equals("Admin")) {
			 list = service.list();
		}else {
			list = service.findBookingByEmail(email);
		}
		model.addAttribute("list", list);
		return "bookinglist";
	}
	
	
}
