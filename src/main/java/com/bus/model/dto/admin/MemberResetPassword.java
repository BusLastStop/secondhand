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
public class MemberResetPassword {
	
	private String memId;
	private String memName;
	private Date memBirthDate;
	private String memEmail;
	private String memPhone;
	private String repCreate;
	private String memState;

}
