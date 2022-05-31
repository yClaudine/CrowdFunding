package kr.or.store.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Storepay {
	private int storepayNo;
	private int memCouponNo;
	private int storeNo;
	private int memberNo;
	private int storeDelivery;
	private int storePrice;
	private int storepayCheck;
	private String storepayDate;
	private int storepayAllPrice;
}
