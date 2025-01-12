package com.bus.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CommodityBoard {
	
	private String boaCode;
	private String boaTitle;
	private String boaContent;
	private String boaViews;
	private Date boaCreate;
	private Date boaUpdate;
	private String boaComName;
	private int boaComPrice;
	private String boaFileName;
	private String boaFileReName;
	private String boaMemName;

}
