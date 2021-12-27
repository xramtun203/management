package csh.trade.dao;

import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import csh.trade.dto.BoardDTO;
import csh.trade.dto.MemberDTO;

@Repository
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class TradeDAO {

	@Autowired
	SqlSessionTemplate sqlsessionTemplate;

	// Member
	public List<MemberDTO> memberList() {
		return sqlsessionTemplate.selectList("memberList");
	}

	public MemberDTO memberDetail(MemberDTO memberDTO) {
		return sqlsessionTemplate.selectOne("memberDetail", memberDTO);
	}

	public List<MemberDTO> getSearchList(HashMap<String, Object> valueMap) {
		return sqlsessionTemplate.selectList("getSearchList", valueMap);
	}

	public int getSearchListCount(String keyword) {
		return sqlsessionTemplate.selectOne("getSearchListCount", keyword);
	}

	public int getListCount() {
		return sqlsessionTemplate.selectOne("getListCount");
	}

	public List<MemberDTO> getMemberList(HashMap<String, Object> valueMap) {
		return sqlsessionTemplate.selectList("getMemberList", valueMap);
	}

	// Board
	public List<BoardDTO> boardList() {
		return sqlsessionTemplate.selectList("boardList");
	}

	public BoardDTO boardDetail(BoardDTO boardDTO) {
		return sqlsessionTemplate.selectOne("boardDetail", boardDTO);
	}

	public List<BoardDTO> boardSearchList(HashMap<String, Object> valueMap) {
		return sqlsessionTemplate.selectList("boardSearchList", valueMap);
	}

	public int boardSearchListCount(String keyword) {
		return sqlsessionTemplate.selectOne("boardSearchListCount", keyword);
	}

	public int boardListCount() {
		return sqlsessionTemplate.selectOne("boardListCount");
	}

	public List<BoardDTO> getBoardList(HashMap<String, Object> valueMap) {
		return sqlsessionTemplate.selectList("getBoardList", valueMap);
	}

	@Transactional
	// Member
	public void memberInsert(MemberDTO memberDTO) {
		sqlsessionTemplate.insert("memberInsert", memberDTO);
	}

	public void memberNewInsert(MemberDTO memberDTO) {
		sqlsessionTemplate.insert("memberNewInsert", memberDTO);
	}

	public void memberUpdate(MemberDTO memberDTO) {
		sqlsessionTemplate.update("memberUpdate", memberDTO);
	}

	public void memberDelete(String id) {
		sqlsessionTemplate.delete("memberDelete", id);
	}

	// Board
	public void boardInsert(BoardDTO boardDTO) {
		sqlsessionTemplate.insert("boardInsert", boardDTO);
	}

	public void boardUpdate(BoardDTO boardDTO) {
		sqlsessionTemplate.update("boardUpdate", boardDTO);
	}

	public void boardDelete(int boardno) {
		sqlsessionTemplate.delete("boardDelete", boardno);
	}

}
