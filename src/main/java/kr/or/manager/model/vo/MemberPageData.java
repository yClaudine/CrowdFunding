package kr.or.manager.model.vo;

import java.util.ArrayList;

import kr.or.member.vo.Member;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberPageData {
	
	private ArrayList<Member> list;
	private String pageNavi;
}
