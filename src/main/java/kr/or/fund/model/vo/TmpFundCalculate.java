package kr.or.fund.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class TmpFundCalculate {
	private int tfcNo;
	private int tfNo;
	private String tfcRepCategory;
	private String tfcRepName;
	private String tfcRepEmail;
	private String tfcRepFilepath;
	private String tfcRepBirth;
	private String tfcMail;
	private String tfcBankName;
	private long tfcBankNo;
	private String tfcBankAccount;
	private String tfcBankFilepath;

}
