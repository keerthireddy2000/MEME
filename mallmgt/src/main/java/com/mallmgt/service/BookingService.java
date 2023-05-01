package com.mallmgt.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import com.mallmgt.dao.BookingDAO;
import com.mallmgt.dao.SlotDAO;
import com.mallmgt.dto.BookingDTO;
import com.mallmgt.dto.ParkingDTO;
import com.mallmgt.dto.SlotDTO;
import com.mallmgt.utility.DataUtility;


@Service
public class BookingService {
	
	
	@Autowired
	public BookingDAO dao;

	@Autowired
	public SlotDAO slotDAO;

	public BookingDTO Add(BookingDTO dto) {
	    System.out.println("Requested Slot Number : "+dto.getSlot()+ " Requested Slot Id: "+dto.getSlotId());
	    System.out.println("DTO before Save: "+dto);
	    
	    BookingDTO booking = dao.save(dto);	   
	    
	    System.out.println("Booked Slot id: "+booking.getSlotId());
	    System.out.println("Booking After Save: "+booking);
	    
	    SlotDTO slot = slotDAO.findById(booking.getSlotId());
	    slot.setStatus(false);
	    slotDAO.saveAndFlush(slot);
       return  booking;
	}
	
	public List<BookingDTO> list(){
		List<BookingDTO> dto = dao.findAll();
		return dto;
	}
	

	
	
	
	public List<BookingDTO> findBookingByEmail(String email){
		List<BookingDTO> dto = dao.findByEmail(email);
		return dto;
	}
	
	public SlotDTO findSlotById(long id){
		SlotDTO dto = slotDAO.findById(id);
		return dto;
	}

	@Scheduled(fixedDelay = 120000)
	public void scheduleFixedDelayTask() throws Exception {
	    List<BookingDTO> bookingList = dao.findAll();	    
	    List<SlotDTO> slotList = slotDAO.findAll();
	    
	    for (BookingDTO bookingDTO : bookingList) {
	    	
	    	long slot_id = bookingDTO.getSlotId();
	    	String toBookingDate = DataUtility.getDateString1(bookingDTO.getToBookingDate());
	    	
	    	String toTime = bookingDTO.getToTime();
	    	String finalBookingTime = toBookingDate+" "+toTime+":00";
	    	System.out.println("To Booking Date and time: "+finalBookingTime);
	    	System.out.println("Current Time: "+DataUtility.getCurrentTimestamp());
	    	
	    	int b3 = DataUtility.getCurrentTimestamp().compareTo(DataUtility.getDateAndTime(finalBookingTime));  
	    	System.out.println("Compare Status: "+b3);
	    	
	    	SlotDTO slotDTO = slotDAO.findById(slot_id);
	    	if(slotDTO != null && slotDTO.isStatus() == true) {
	    		//System.out.println("Current Time: "+DataUtility.getCurrentTimestamp());
	    	}else if(b3>=0){ 		
	    		slotDTO.setStatus(true);
	    		slotDAO.saveAndFlush(slotDTO);
	    	}
			
		}
	    
	    
	}
}
