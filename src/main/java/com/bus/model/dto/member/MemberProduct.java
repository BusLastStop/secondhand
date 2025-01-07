package com.bus.model.dto.member;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberProduct {
	
	private String memId;
	private String boaTitle;
	private String boaContent;
	private String memName;
	private int boaViews;
	private Date boaCreate;

}
