package kr.or.member.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Myblog {

	private int blogNo;
	private int levelMem;
	private String memberId;
	private String visitor;
	private String memComment;
	private String coDate;
}
