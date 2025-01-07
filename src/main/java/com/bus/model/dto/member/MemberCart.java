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
public class MemberCart {
	
	private String boaTitle;
	private String fileOlginName;
	private String boaContent;
	private String memName;
	private Date shoCreate;

}
