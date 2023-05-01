package com.mallmgt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mallmgt.dao.FoodCartDAO;
import com.mallmgt.dto.FoodCartDTO;


@Service
public class FoodCartService {

	@Autowired
	public FoodCartDAO dao;
	
	public void add(FoodCartDTO dto) {
		dao.save(dto);
	}
	
	public List<FoodCartDTO> list(){
		return dao.findAll();
	}
	

	
	public List<FoodCartDTO> list(String paymentStatus){
		return dao.findByPaymentStatus(paymentStatus);
		
	}
	
	public List<FoodCartDTO> findCartInfoByUserId(long id){
		List<FoodCartDTO> list =   dao.findByUserId(id);		
		return list;
	}
	
	public List<FoodCartDTO> findCartInfoByStallId(long id){
		List<FoodCartDTO> list =   dao.findByStallId(id);		
		return list;
	}
	
	public FoodCartDTO update(FoodCartDTO dto) {
		return dao.saveAndFlush(dto);
	}
	
	public void delete(FoodCartDTO dto) {
	    dao.delete(dto);
	}
	
	public FoodCartDTO findById(long id) {
		return dao.findById(id);
	}
	

	
}
