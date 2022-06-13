package kr.or.member.vo;

import java.util.ArrayList;

import kr.or.fund.model.vo.Fund;
import kr.or.fund.model.vo.FundPay;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class FFP {
	private int fpayCount;
	private ArrayList<FundPay> fpay;
	private ArrayList<Fund> fund;
	private String pagenation;
	private ArrayList<TotalPay> tlist;
}
