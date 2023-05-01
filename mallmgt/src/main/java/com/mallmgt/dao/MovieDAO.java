package com.mallmgt.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mallmgt.dto.MovieBookingDTO;
import com.mallmgt.dto.MovieDTO;
import com.mallmgt.dto.MovieSeatDTO;


public interface MovieDAO extends JpaRepository<MovieDTO, Long> {
	
	public MovieDTO findById(long id);
	public MovieDTO findByTitle(String title);
	public MovieDTO findTopByOrderByIdDesc();
	public List<MovieDTO> findByGenre(String genre);
	@Query(value = "SELECT * FROM movie where genre = ?1 OR language = ?1 OR format = ?1", nativeQuery = true)
	public List<MovieDTO> findByGenreOrLanguageOrFormat(String filter);
}

