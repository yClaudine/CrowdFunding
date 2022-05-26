package kr.or.notice.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	private int noticeNo;
	private int noticeType;
	private String noticeWriter;
	private String noticeTitle;
	private String noticeFilepath;
	private String noticeContent;
	private String dateStart;
	private String dateEnd;
	private String regDate;
	private int important;
	private int couponNo;
}
