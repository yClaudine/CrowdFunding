package kr.or.fund.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Reward {
	private int rewardNo;
	private int fundNo;
	private String rewardName;
	private String rewardIntro;
	private int rewardPrice;
	private int rewardCount;
	private String rewardOption;
	private String rewardSend;
	private int rewardDeliveryfee;
}
