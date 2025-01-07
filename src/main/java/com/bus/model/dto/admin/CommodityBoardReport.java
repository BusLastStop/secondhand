package com.bus.model.dto.admin;

import java.sql.Date;

import com.bus.model.dto.CommodityBoard;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CommodityBoardReport {
	
	private String boaCode;
	private String boaTitle;
	private String boaContent;
	private int boaViews;
	private Date boaCreate;
	private Date boaUpdate;
	private String boaComName;
	private int boaComPrice;
	private String boaFilePath;
	private String repCode;
	private String repReason;
	private Date repCreate;
	private String repResultReason;
	private String repResult;
	private String memCode;
	private String memId;
	private String memName;
	private String memIsActive;
	private String memAuthority;
	private String comCatCode;
	private String comCatName;

}
