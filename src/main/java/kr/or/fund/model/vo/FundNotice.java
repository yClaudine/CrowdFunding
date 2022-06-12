package kr.or.fund.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class FundNotice {
	private String fnNo;
	private String fundNo;
	private String memberId;
	private String fnTitle;
	private String fnContent;
	private String fnDate;
	private String fnCategory;
	private String fnFix;
	private String fnFilepath;
	
}
