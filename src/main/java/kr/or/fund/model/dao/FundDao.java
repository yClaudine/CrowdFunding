package kr.or.fund.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.fund.model.vo.Fund;

@Repository
public class FundDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Fund> selectAllFund() {
		List list = sqlSession.selectList("fund.selectAllFund");
		return (ArrayList<Fund>)list;
	}
	

}
