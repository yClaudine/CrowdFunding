package kr.or.fund.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class RewardCart {
	int cartNo;
	int memberNo;
	int rewardNo;
	int rewardAmount;
	int fundNo;
}
