package com.mallmgt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mallmgt.dao.JobDAO;
import com.mallmgt.dto.JobDTO;
import com.mallmgt.exception.RecordNotFoundException;

@Service
public class JobService {
	
	@Autowired
	public JobDAO dao;
	

	public JobDTO Add(JobDTO dto) {
		JobDTO entity = null;
		entity = dao.findByJobName(dto.getJobName());
	System.out.println("shop By Name........: "+entity);
	
	if(entity != null)
		throw new RecordNotFoundException("Job is already exists..");
	    System.out.println("dto Before Save: "+dto);
	    entity = dao.save(dto);
       return  entity;
	}
	


	public JobDTO findEventDTO(long id) {
		return dao.findById(id);
	}
	
	
	public List<JobDTO> list(){
		List<JobDTO> dto = dao.findAll();
		return dto;
	}
	
	public JobDTO update(JobDTO dto){
		JobDTO bean = dao.saveAndFlush(dto);
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
	
}
