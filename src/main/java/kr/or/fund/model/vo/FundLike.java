package kr.or.fund.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class FundLike {
	private int likeNo;
	private int fundNo;
	private String memberId;
	
	//추가 컬럼
	private int total;
	private int likeCheck;
}
