package kr.or.member.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Dm {
	private int dmNo;
	private int memberNo;
	private String sendMemId;
	private String recvMemId;
	private String mTitle;
	private String mContent;
	private int readCk;
	private int warning;
	private int category;
	private int categoryNo;
	private String mDatetime;
	private String mRectime;
}
