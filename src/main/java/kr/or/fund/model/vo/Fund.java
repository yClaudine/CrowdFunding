package kr.or.fund.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Fund {
	private int fundNo;
	private String memberId;
	private String fundName;
	private int fundAmount;
	private int fundFees;
	private String fundCategory;
	private String fundStart;
	private String fundEnd;
	private String fundIntro;
	private String fundAs;
	private int fundLike;
	private int fundReportcount;
	private int fundWarning;
	private String fundFilepath1;
	private String fundFilepath2;
	private String fundFilepath3;
	private String fundFilepath4;
	private String fundFilepath5;
	
}
