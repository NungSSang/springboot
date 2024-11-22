package com.example.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reply {
	private int id;
	private String updateDate;
	private String regDate;
	private int memberId;
	private String relTypeCode;
	private int relId;
	private String body;
	
	private String loginId;
}
