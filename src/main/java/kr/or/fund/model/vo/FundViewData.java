package kr.or.fund.model.vo;

import java.util.ArrayList;

import kr.or.member.vo.Seller;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class FundViewData {
	private Fund f;
	private ArrayList<Reward> rewardList;
	private Seller s;
}
