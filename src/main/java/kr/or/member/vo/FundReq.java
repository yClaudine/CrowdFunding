package kr.or.member.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class FundReq {
	private int reqNo;
	private String fundName;
	private String reqDate;
	private String fundNo;
	private String reqType;
	private String memberId;
	
}
