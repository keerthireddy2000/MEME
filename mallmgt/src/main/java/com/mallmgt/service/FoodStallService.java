package com.mallmgt.service;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mallmgt.dao.FoodStallDAO;
import com.mallmgt.dao.SlotDAO;
import com.mallmgt.dto.EventDTO;
import com.mallmgt.dto.FoodStallDTO;
import com.mallmgt.dto.MovieDTO;
import com.mallmgt.exception.RecordNotFoundException;

@Service
public class FoodStallService {

	@Autowired
	public FoodStallDAO dao;
	

	public FoodStallDTO Add(FoodStallDTO dto) {
		FoodStallDTO foodStall = null;
		foodStall = dao.findByStallName(dto.getStallName());
	System.out.println("Food Stall By Name........: "+foodStall);
	
	if(foodStall != null)
		throw new RecordNotFoundException("Food Stall is already exists..");
	    System.out.println("dto Before Save: "+dto);
	    foodStall = dao.save(dto);
       return  foodStall;
	}
	

	
	public FoodStallDTO findStallById(long id) {
		return dao.findById(id);
	}
	
	public FoodStallDTO findByStallName(String stallName) {
		return dao.findByStallName(stallName);
	}
	
	public List<FoodStallDTO> list(){
		List<FoodStallDTO> dto = dao.findAll();
		return dto;
	}
	
	public FoodStallDTO update(FoodStallDTO dto){
		FoodStallDTO bean = dao.saveAndFlush(dto);
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
	
	public List<FoodStallDTO> searchByCuisine(String filter){
		List<FoodStallDTO> list = dao.findByCuisine(filter);
		return list;
	}
	
	public Blob getImageById(long id) throws SerialException, SQLException {
		
		FoodStallDTO news = dao.findById(id);
		byte[] blob = news.getImage();
		Blob bBlob = new SerialBlob(blob);
		return bBlob;
	}

}
