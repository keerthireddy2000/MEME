package com.mallmgt.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.mallmgt.dto.BookingDTO;
import com.mallmgt.dto.ParkingDTO;

public interface BookingDAO extends JpaRepository<BookingDTO, Long>{
	
	public List<BookingDTO> findByEmail(String email);
	public BookingDTO findById(long id);
	

}
