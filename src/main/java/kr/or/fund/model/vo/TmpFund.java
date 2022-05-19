package kr.or.fund.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class TmpFund {
	private int tfNo;
	private String memberId;
	private String tfName;
	private int tfAmount;
	private int tfFees;
	private String tfCategory;
	private String tfStart;
	private String tfEnd;
	private String tfIntro;
	private String tfAs;
	private String tfFilepath1;
	private String tfFilepath2;
	private String tfFilepath3;
	private String tfFilepath4;
	private String tfFilepath5;
	
}
