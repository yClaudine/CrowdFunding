package kr.or.fund.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class TmpReward {
	private int trNo;
	private int tfNo;
	private String trName;
	private String trIntro;
	private int trPrice;
	private int trCount;
	private String trOption;
	private String trSend;
	private int trDeliveryfee;
}
