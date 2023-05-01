package com.mallmgt.service;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mallmgt.dao.ApplyJobDAO;
import com.mallmgt.dto.ApplyJobDTO;
import com.mallmgt.dto.EventDTO;


@Service
public class ApplyJobService {
	
	@Autowired
	public ApplyJobDAO dao;
	

	public ApplyJobDTO Add(ApplyJobDTO dto) {
	    return dao.save(dto);  
	}
	
	public String findUserName(long id) {
		ApplyJobDTO bean = dao.findById(id);
	    return bean.getName();  
	}

	public ApplyJobDTO findAppliedJobById(long id) {
		return dao.findById(id);
	}
		
	public List<ApplyJobDTO> list(){
		List<ApplyJobDTO> dto = dao.findAll();
		return dto;
	}
	public List<ApplyJobDTO> list(long userId){
		List<ApplyJobDTO> dto = dao.findByUserId(userId);
		return dto;
	}
	
	public ApplyJobDTO update(ApplyJobDTO dto){
		ApplyJobDTO bean = dao.saveAndFlush(dto);
		return bean;
	}
	
	public Blob getFileById(long id) throws SerialException, SQLException {		
		ApplyJobDTO news = dao.findById(id);
		byte[] blob = news.getFile();
		Blob bBlob = new SerialBlob(blob);
		return bBlob;
	}
	

}
