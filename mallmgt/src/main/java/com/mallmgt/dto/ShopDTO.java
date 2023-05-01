package com.mallmgt.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="shop")
@Getter
@Setter
public class ShopDTO extends BaseDTO {

	  @Column(name = "userId")
	   private long userId;
	   
	   @Column(name = "shopName", length = 755)
	   private String shopName;
	   
	   @Column(name = "ownerName", length = 755)
	   private String ownerName;
	   
	   @Column(name = "contactNumber", length = 755)
	   private String contactNumber;
	   
	   @Column(name = "shopId", length = 755)
	   private String shopId;
	   
	   @Column(name = "email", length = 755)
	   private String email;
	   
	   @Column(name = "openingTime", length = 755)
	   private String openingTime;
	   
	   @Column(name = "closingTime", length = 755)
	   private String closingTime;
	   
	   @Column(name = "image", columnDefinition = "LONGBLOB")
	    private byte[] image;
	   
	   
}
