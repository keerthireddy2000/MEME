package com.mallmgt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mallmgt.dao.MovieBookingDAO;
import com.mallmgt.dao.MovieDAO;
import com.mallmgt.dao.MovieSeatDAO;
import com.mallmgt.dto.MovieBookingDTO;
import com.mallmgt.dto.MovieDTO;
import com.mallmgt.exception.RecordNotFoundException;

@Service
public class MovieBookingService {

	@Autowired
	public MovieBookingDAO dao;

	public MovieBookingDTO Add(MovieBookingDTO dto) {
		MovieBookingDTO  movieBooking = dao.save(dto);
       return  movieBooking;
	}
	
	public List<MovieBookingDTO> List() {
		List<MovieBookingDTO>  list = dao.findAll();
       return  list;
	}
	
	public List<MovieBookingDTO> findMovieByEmail(String email) {
		List<MovieBookingDTO>  list = dao.findByEmail(email);
       return  list;
	}
	
	public MovieBookingDTO findMovieBookingById(long id) {
		MovieBookingDTO  movieBooking = dao.findById(id);
       return  movieBooking;
	}
}
