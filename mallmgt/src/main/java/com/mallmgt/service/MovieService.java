package com.mallmgt.service;

import java.io.PrintStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mallmgt.dao.MovieDAO;
import com.mallmgt.dao.MovieSeatDAO;
import com.mallmgt.dto.BookingDTO;
import com.mallmgt.dto.MovieDTO;
import com.mallmgt.dto.MovieSeatDTO;
import com.mallmgt.exception.RecordNotFoundException;




@Service
public class MovieService {
	
	@Autowired
	public MovieDAO dao;
	
	@Autowired
	public MovieSeatDAO seatDao;
	
	public MovieSeatDTO updateSeatStatus(long id, long showId) {
		MovieSeatDTO dto = seatDao.findByIdAndShowId(id, showId);
		dto.setStatus("Booked");
		seatDao.saveAndFlush(dto);
		return dto;
	}
	
	public MovieDTO Add(MovieDTO dto) {
	MovieDTO movie = null;
	movie = dao.findByTitle(dto.getTitle());
	System.out.println("Movie by Title........: "+movie);
	if(movie != null)
		throw new RecordNotFoundException("movie name is already exists..");
	    System.out.println("dto Before Save: "+dto);
	    movie = dao.save(dto);
       return  movie;
	}
	

	
	public MovieDTO findMovieById(long id) {
		return dao.findById(id);
	}
	
	public MovieDTO findLastMovieId() {
		return dao.findTopByOrderByIdDesc();
	}
	
	public List<MovieDTO> list(){
		List<MovieDTO> dto = dao.findAll();
		return dto;
	}
	
	public MovieDTO update(MovieDTO dto){
		MovieDTO bean = dao.saveAndFlush(dto);
		return bean;
	}
	
	public void delete(long id) throws Exception {
		if(id>0)
		{
			dao.deleteById(id);
		}else {
			throw new Exception("Not a valid id");
		}
		
	}

	public Blob getImageById(long id) throws SerialException, SQLException {
		
		MovieDTO news = dao.findById(id);
		byte[] blob = news.getImage();
		Blob bBlob = new SerialBlob(blob);
		return bBlob;
	}
	
	
	public void creatSeats(MovieDTO dto) {

		System.out.println("dto.getNumberOfSeat(): "+dto.getNumberOfSeat());
		
		for(int s = 1; s<=5;s++) {	
			for(int i=1; i<=dto.getNumberOfSeat(); i++) {
				MovieSeatDTO seat = new MovieSeatDTO();
		System.out.println("Movie ID:" +dto.getId());
				seat.setMovieId(dto.getId());
				seat.setSeat(i);
				seat.setStatus("Available");
				seat.setShowId(s);
				seatDao.save(seat);
			}	
		}
		
		
	}
	
	public List<MovieDTO> searchByGenre(String genre){
		List<MovieDTO> list = dao.findByGenre(genre);
		return list;
	}
	
	public List<MovieDTO> searchByGenreOrLanguageOrFormat(String filter){
		List<MovieDTO> list = dao.findByGenreOrLanguageOrFormat(filter);
		return list;
	}
	
	public static void main(String[] args) {		
		try {

		//	printStream.println("Test: " +updateSeatStatus(16, 4));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
}
