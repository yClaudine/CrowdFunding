package kr.or.fund.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class FundCalculate {
	private int fcNo;
	private int fundNo;
	private String fcRepCategory;
	private String fcRepName;
	private String fcRepEmail;
	private String fcRepFilepath;
	private String fcRepBirth;
	private String fcMail;
	private String fcBankName;
	private long fcBankNo;
	private String fcBankAccount;
	private String fcBankFilepath;
	
}
