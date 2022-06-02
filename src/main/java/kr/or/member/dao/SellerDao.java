package kr.or.member.dao;
 
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.vo.Member;
import kr.or.member.vo.Seller;

@Repository
public class SellerDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertSeller(Seller s) {
		
		int result = sqlSession.insert("seller.insertSeller",s);
		return result;
	}

	public Seller selectOneSeller(Member m) {
		
		Seller sel = sqlSession.selectOne("seller.selectOneSeller",m);
		return sel;
	}

	public int updateSeller(Seller sel) {
		
		int result = sqlSession.update("seller.updateSeller",sel);
		return result;
	}
}
