package kr.or.manager.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.manager.model.dao.ManagerDao;
import kr.or.member.vo.Seller;

@Transactional
@Service
public class ManagerService {
	
	@Autowired
	private ManagerDao dao;

	public int totalSellerCount(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.totalSellerCount(map);
	}

	public ArrayList<Seller> selectSellerForManager(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectSellerForManager(map);
	}

	//멤버 판매자 권한 변경
	public int changeMemberAuth(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.changeMemberAuth(map);
	}
	//판매자 승인상태 변경
	public int changeSellerAuth(Seller seller) {
		// TODO Auto-generated method stub
		return dao.changeSellerAuth(seller);
	}

	public ArrayList<Seller> moreSeller(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.moreSeller(map);
	}

	
}
