package com.mallmgt.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mallmgt.dto.PaymentDTO;
import com.mallmgt.dto.UserDTO;

public interface PaymentDAO extends JpaRepository<PaymentDTO, Long> {
	
	public PaymentDTO findById(long id);
	public List<PaymentDTO> findByEmail(String email);

}
