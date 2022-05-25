package kr.or.store.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.store.model.dao.StoreTmpDao;

@Service
public class StoreTmpService {
	@Autowired
	private StoreTmpDao dao;
}
