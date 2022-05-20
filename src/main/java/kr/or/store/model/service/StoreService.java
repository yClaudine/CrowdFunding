package kr.or.store.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.store.model.dao.StoreDao;
import kr.or.store.model.vo.Store;


@Service
public class StoreService {
	@Autowired
	private StoreDao dao;

	public ArrayList<Store> selectAllStore() {
		// TODO Auto-generated method stub
		return dao.selectAllStore();
	}
}
