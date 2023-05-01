package com.mallmgt.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mallmgt.dto.MovieBookingDTO;


public interface MovieBookingDAO extends JpaRepository<MovieBookingDTO, Long> {
	
	public MovieBookingDTO findById(long id);
	public MovieBookingDTO findByTitle(String title);
	public List<MovieBookingDTO> findByEmail(String email);


}
