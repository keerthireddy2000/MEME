package com.mallmgt.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="gamerecharge")
@Getter
@Setter
public class GameRechargeDTO extends BaseDTO {
	
	@Column(name = "userId")
	private long userId;
	
	@Column(name = "amount")
	private long amount;

}
