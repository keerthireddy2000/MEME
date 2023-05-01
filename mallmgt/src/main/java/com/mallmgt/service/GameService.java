package com.mallmgt.service;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mallmgt.dao.GameDAO;
import com.mallmgt.dao.GameRechargeDAO;
import com.mallmgt.dto.EventDTO;
import com.mallmgt.dto.GameDTO;
import com.mallmgt.dto.GameRechargeDTO;
import com.mallmgt.exception.RecordNotFoundException;

@Service
public class GameService {
	
	
	@Autowired
	public GameDAO dao;
	
	@Autowired
	public GameRechargeDAO gameRechargeDAO;
	
	public List<GameRechargeDTO> CardBalance(long id) {
		return gameRechargeDAO.findAmountByUserId(id);
	}
	
	public GameRechargeDTO RechargeCard(GameRechargeDTO dto) {
		return gameRechargeDAO.save(dto);
	}
		
	public GameDTO Add(GameDTO dto) {
	GameDTO entity  = dao.findBygameName(dto.getGameName());
	if(entity == null) {
		entity = dao.save(dto);
		
	}else {
		throw new RecordNotFoundException("Game name is already exists..");
	}    
       return  entity;
	}
	
	public GameDTO findGameInstrcutionsById(long id) {
		return dao.findInstrcutionsById(id);
	}
	
	public GameDTO findGameById(long id) {
		return dao.findById(id);
	}

	public List<GameDTO> list(){
		List<GameDTO> dto = dao.findAll();
		return dto;
	}
	
	public GameDTO update(GameDTO dto){
		GameDTO bean = dao.saveAndFlush(dto);
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
		
		GameDTO img = dao.findById(id);
		byte[] blob = img.getImage();
		Blob bBlob = new SerialBlob(blob);
		return bBlob;
	}


}
