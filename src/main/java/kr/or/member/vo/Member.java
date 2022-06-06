package kr.or.member.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Member {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memEmail;
	private String memPhone;
	private int gender;
	private int categoryNo;
	private int authRe;
	private int report;
	private String memComment;
	private int memberWarning;
	
	
}


