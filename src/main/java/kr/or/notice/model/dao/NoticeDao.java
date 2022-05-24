package kr.or.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.notice.model.vo.Notice;

@Repository
public class NoticeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Notice> selectNoticeList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("notice.selectNoticeList",map);
		return (ArrayList<Notice>)list;
	}

	

	public int selectNoticeCount(HashMap<String, Object> countMap) {
		int totalCount = sqlSession.selectOne("notice.selectTotalCount",countMap);
		return totalCount;
	}



	public int insertNotice(Notice n) {
		int result = sqlSession.insert("notice.insertNoitce", n);
		return result;
	}



	public Notice selectOneNotice(int noticeNo) {
		Notice notice = sqlSession.selectOne("notice.selectOneNotice",noticeNo);
		return notice;
	}
}
