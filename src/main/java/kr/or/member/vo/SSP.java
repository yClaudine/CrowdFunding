package kr.or.member.vo;

import java.util.ArrayList;

import kr.or.store.model.vo.Store;
import kr.or.store.model.vo.Storepay;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class SSP {
	private ArrayList<Store> store;
	private ArrayList<Storepay> storePay;
	private ArrayList<TotalPay> tlist;
	private String pagenation;
	private int storeCount;
}
