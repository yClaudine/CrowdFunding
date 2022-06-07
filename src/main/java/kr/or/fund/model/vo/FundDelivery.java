package kr.or.fund.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class FundDelivery {
	int fdeliveryNo;
	String memberId;
	int fundNo;
	int fpayNo;
	String fdeliveryName;
	String fdeliveryPhone;
	String fdeliveryAddress;
	String fdeliveryMessage;
}
