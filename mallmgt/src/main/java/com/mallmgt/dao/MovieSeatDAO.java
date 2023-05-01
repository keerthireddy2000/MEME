package com.mallmgt.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mallmgt.dto.MovieDTO;
import com.mallmgt.dto.MovieSeatDTO;

public interface MovieSeatDAO extends JpaRepository<MovieSeatDTO, Long> {

	public MovieSeatDTO findById(long id);
	
	@Query(value = "SELECT * FROM movieseat where id = ?1 AND show_id = ?2", nativeQuery = true)
	public MovieSeatDTO findByIdAndShowId(long id, long showid);
	
	public List<MovieSeatDTO> findByMovieId(long id);	
	public List<MovieSeatDTO> findByMovieIdAndShowId(long id, long showid);
}
