package kr.or.store.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class StoreDelivery {
	private int deliveryNo;
	private int storeNo;
	private int memberNo;
	private int storepayNo;
	private int storeDelivery;
	private String storeProduct;
	private int storeProductNum;
	private String deliveryName;
	private String deliveryPhone;
	private String deliveryAddress;
	private String deliveryMsg;
}
