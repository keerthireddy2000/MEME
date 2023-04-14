package com.mallmgt.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mallmgt.dto.MovieBookingDTO;
import com.mallmgt.dto.MovieDTO;


public interface MovieDAO extends JpaRepository<MovieDTO, Long> {
	
	public MovieDTO findById(long id);
	public MovieDTO findByTitle(String title);
	public MovieDTO findTopByOrderByIdDesc();
	public List<MovieDTO> findByGenre(String genre);

}

