package com.mallmgt.service;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mallmgt.dao.FoodMenuDAO;
import com.mallmgt.dto.FoodMenuDTO;
import com.mallmgt.dto.FoodStallDTO;
import com.mallmgt.exception.RecordNotFoundException;

@Service
public class FoodMenuService {

	@Autowired
	public FoodMenuDAO dao;
	

	public FoodMenuDTO Add(FoodMenuDTO dto) {
		FoodMenuDTO foodMenu = null;
		foodMenu = dao.findByFoodName(dto.getFoodName());
	System.out.println("Food Stall By Name........: "+foodMenu);
	
	if(foodMenu != null)
		throw new RecordNotFoundException("Food Name is already exists..");
	    System.out.println("dto Before Save: "+dto);
	    foodMenu = dao.save(dto);
       return  foodMenu;
	}
	

	
	public FoodMenuDTO findMenuItemById(long id) {
		return dao.findById(id);
	}
	
	public FoodMenuDTO findByStallName(String stallName) {
		return dao.findByStallName(stallName);
	}
	
	public List<FoodMenuDTO> findByStallId(long id) {
		return dao.findByStallId(id);
	}
	
	
	
	public List<FoodMenuDTO> list(){
		List<FoodMenuDTO> dto = dao.findAll();
		return dto;
	}
	
	public FoodMenuDTO update(FoodMenuDTO dto){
		FoodMenuDTO bean = dao.saveAndFlush(dto);
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
		
		FoodMenuDTO news = dao.findById(id);
		byte[] blob = news.getImage();
		Blob bBlob = new SerialBlob(blob);
		return bBlob;
	}
	
}
