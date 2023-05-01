package com.mallmgt.service;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mallmgt.dao.ShopDAO;
import com.mallmgt.dto.MovieDTO;
import com.mallmgt.dto.ShopDTO;
import com.mallmgt.exception.RecordNotFoundException;

@Service
public class ShopService {
	
	
	@Autowired
	public ShopDAO dao;
	

	public ShopDTO Add(ShopDTO dto) {
		ShopDTO shop = null;
		shop = dao.findByShopName(dto.getShopName());
	System.out.println("shop By Name........: "+shop);
	
	if(shop != null)
		throw new RecordNotFoundException("shop is already exists..");
	    System.out.println("dto Before Save: "+dto);
	    shop = dao.save(dto);
       return  shop;
	}
	

	
	public ShopDTO findShopById(long id) {
		return dao.findById(id);
	}
	
	public ShopDTO findByShopId(String shopId) {
		return dao.findByShopId(shopId);
	}
	
	public void deleteByShopId(String shopId) {
		dao.deleteByShopId(shopId);
	}
	
	public List<ShopDTO> findByShopByUserId(long userId) {
		return dao.findByUserId(userId);
	}
	
	public List<ShopDTO> list(){
		List<ShopDTO> dto = dao.findAll();
		return dto;
	}
	
	public ShopDTO update(ShopDTO dto){
		ShopDTO bean = dao.saveAndFlush(dto);
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
		
		ShopDTO news = dao.findById(id);
		byte[] blob = news.getImage();
		Blob bBlob = new SerialBlob(blob);
		return bBlob;
	}
	

}
