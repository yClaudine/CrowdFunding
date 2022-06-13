package kr.or.fund.model.vo;

import java.util.ArrayList;

import kr.or.member.vo.Seller;
import kr.or.notice.model.vo.Notice;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class FundUpdateNoticeViewData {
	private Fund f;
	private ArrayList<Reward> rewardList;
	private Seller s;
	private FundLike fl;
	private FundPay p;
	private ArrayList<FundPay> payList;
	
	//새소식 관련
	private FundNotice fn;
}
