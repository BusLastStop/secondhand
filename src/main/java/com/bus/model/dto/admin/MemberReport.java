package com.bus.model.dto.admin;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberReport {
	
	private String boaCode;
	private String repCode;
	private String repReason;
	private Date repCreate;
	private String repResultReason;
	private String repResult;
	private String memCode;
	private String memId;
	private String memName;
	private Date memBirthDate;
	private String memPhone;
	private String memIsActive;
	private String memAuthority;

}
