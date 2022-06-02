package kr.or.fund.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PayViewData {
	private Fund f;
	private ArrayList<Reward> rewardList;
}
