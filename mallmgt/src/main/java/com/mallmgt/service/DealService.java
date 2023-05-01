package com.mallmgt.service;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mallmgt.dao.DealDAO;
import com.mallmgt.dto.DealDTO;
import com.mallmgt.exception.RecordNotFoundException;

@Service
public class DealService {
	
	@Autowired
	public DealDAO dao;
	

	public DealDTO Add(DealDTO dto) {
		DealDTO entity = null;
		entity = dao.findByDealName(dto.getDealName());
	System.out.println("Deal By Name........: "+entity);
	
	if(entity != null)
		throw new RecordNotFoundException("shop is already exists..");
	    System.out.println("dto Before Save: "+dto);
	    entity = dao.save(dto);
       return  entity;
	}
	


	public DealDTO findDealDTO(long id) {
		return dao.findById(id);
	}
	
	
	public List<DealDTO> list(){
		List<DealDTO> dto = dao.findAll();
		return dto;
	}
	
	public DealDTO update(DealDTO dto){
		DealDTO bean = dao.saveAndFlush(dto);
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
		
		DealDTO news = dao.findById(id);
		byte[] blob = news.getImage();
		Blob bBlob = new SerialBlob(blob);
		return bBlob;
	}


}
