package kr.or.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.dao.SellerDao;
import kr.or.member.vo.Seller;

@Service
public class SellerService {
	
	@Autowired
	private SellerDao dao;

	public int insertSeller(Seller s) {
		
		return dao.insertSeller(s);
	}
}
