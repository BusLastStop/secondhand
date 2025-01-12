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
public class Member {
	
	private String memCode;
	private String memId;
	private String memPw;
	private String memName;
	private String memBirthDate;
	private String memEmail;
	private String memPhone;
	private String memAddress;
	private String memLatitude;
	private String memLongitude;
	private String memGender;
	private Date memCreated;
	private String memIsActive;
	private String memAuthority;
	private String memState;

}
