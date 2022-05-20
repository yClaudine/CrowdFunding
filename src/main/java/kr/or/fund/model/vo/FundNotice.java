package kr.or.fund.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class FundNotice {
	private int fnNo;
	private int fundNo;
	private String memberId;
	private String fnTitle;
	private String fnContent;
	private int fnCount;
	private String fnDate;
	private int fnCategory;
	
}
