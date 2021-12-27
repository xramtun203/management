package csh.trade.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import csh.trade.dao.TradeDAO;
import csh.trade.dto.BoardDTO;
import csh.trade.dto.MemberDTO;

@Service
public class TradeService {
	@Autowired
	private TradeDAO tradeDAO;
	private HashMap<String, Object> valueMap = new HashMap<String, Object>();

	public List<MemberDTO> list() {
		return tradeDAO.memberList();
	}

	public MemberDTO detail(MemberDTO memberDTO) {
		return tradeDAO.memberDetail(memberDTO);
	}

	public List<MemberDTO> searchList(String keyword, int page, int limit) {
		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		valueMap.put("keyword", keyword);
		valueMap.put("startrow", startrow);
		valueMap.put("endrow", endrow);
		return tradeDAO.getSearchList(valueMap);
	}

	public int searchListCount(String keyword) {
		return tradeDAO.getSearchListCount(keyword);
	}

	public int listCount() {
		return tradeDAO.getListCount();
	}

	public List<MemberDTO> memberList(int page, int limit) {
		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		valueMap.put("startrow", startrow);
		valueMap.put("endrow", endrow);
		return tradeDAO.getMemberList(valueMap);
	}

	public void insert(MemberDTO memberDTO) {
		tradeDAO.memberInsert(memberDTO);
	}

	public void newinsert(MemberDTO memberDTO) {
		tradeDAO.memberNewInsert(memberDTO);
	}

	public void update(MemberDTO memberDTO) {
		tradeDAO.memberUpdate(memberDTO);
	}

	public void delete(String id) {
		tradeDAO.memberDelete(id);
	}

	// Board
	public List<BoardDTO> boardList() {
		return tradeDAO.boardList();
	}

	public BoardDTO boardDetail(BoardDTO boardDTO) {
		return tradeDAO.boardDetail(boardDTO);
	}

	public List<BoardDTO> boardSearchList(String keyword, int page, int limit) {
		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		valueMap.put("keyword", keyword);
		valueMap.put("startrow", startrow);
		valueMap.put("endrow", endrow);
		return tradeDAO.boardSearchList(valueMap);
	}

	public int boardSearchListCount(String keyword) {
		return tradeDAO.boardSearchListCount(keyword);
	}

	public int boardListCount() {
		return tradeDAO.boardListCount();
	}

	public List<BoardDTO> getBoardList(int page, int limit) {
		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		valueMap.put("startrow", startrow);
		valueMap.put("endrow", endrow);
		return tradeDAO.getBoardList(valueMap);
	}

	public void boardInsert(BoardDTO boardDTO) {
		tradeDAO.boardInsert(boardDTO);
	}

	public void boardUpdate(BoardDTO boardDTO) {
		tradeDAO.boardUpdate(boardDTO);
	}

	public void boardDelete(int boardno) {
		tradeDAO.boardDelete(boardno);
	}

}
