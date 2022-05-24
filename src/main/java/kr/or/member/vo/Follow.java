package kr.or.member.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Follow {
	private int followNo;
	private String memberId;
	private String targetId;
	private String followerId;
	private String folDatetime;
	
}
