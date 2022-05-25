package kr.or.store.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.store.model.dao.StoreTmpDao;
import kr.or.store.model.vo.TmpStore;

@Service
public class StoreTmpService {
	@Autowired
	private StoreTmpDao dao;

	public int createTmpStore(TmpStore t) {
		// TODO Auto-generated method stub
		return dao.createTmpStore(t);
	}
}
