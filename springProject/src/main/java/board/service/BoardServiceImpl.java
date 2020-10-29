package board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private HttpSession session;
	@Autowired
	private BoardPaging boardPaging;
	@Override
	public List<BoardDTO> boardList(Map<String, Integer> map) {
		List<BoardDTO> list = boardDAO.boardList(map);
		return list;
	}

	@Override
	public void boardWrite(Map<String, String> map) {
		map.put("id", (String) session.getAttribute("memId"));
		map.put("name", (String) session.getAttribute("memName"));
		map.put("email", (String) session.getAttribute("memEmail"));
		boardDAO.boardWrite(map);
	}

	@Override
	public BoardPaging boardPaging(String pg) {
		int totalA = boardDAO.getBoardTotalA();// 총 글수 
		boardPaging.setCurrentPage(Integer.parseInt(pg));
		boardPaging.setPageBlock(3);//3페이지를 보여라
		boardPaging.setPageSize(5);//한페이지당 5개씩
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		return boardPaging;
	}

	@Override
	public List<BoardDTO> searchList(Map<String, Object> map) {
		List<BoardDTO> list = boardDAO.searchList(map);
		return list;
	}

	@Override
	public BoardPaging boardPaging(Map<String, Object> map) {
		int totalA = boardDAO.getBoardSearchTotalA(map);//총글수
		boardPaging.setCurrentPage(Integer.parseInt(map.get("pg")+""));
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		return boardPaging;
	}

	@Override
	public BoardDTO getBoard(String seq) {
		
		return boardDAO.getBoard(seq);
	}

	@Override
	public void boardReply(Map<String, String> map) {
		//원글
		BoardDTO dto = boardDAO.getBoard(map.get("pseq"));

		//map에 session값을 더 넣는다
		map.put("id", (String) session.getAttribute("memId"));
		map.put("name", (String) session.getAttribute("memName"));
		map.put("email", (String) session.getAttribute("memEmail"));
		map.put("ref", dto.getRef()+"");//원글 그룹번호 
		map.put("lev", dto.getLev()+"");//원글의 lev+1
		map.put("step", dto.getStep()+"");//원글의 step+1
		
		boardDAO.boardReply(map);
		
	}

	@Override
	public void boardModify(Map<String, Object> map) {
		boardDAO.boardModify(map);
	}

	@Override
	public void boardDelete(String seq) {
		boardDAO.boardDelete(seq);
	}

	@Override
	public void updateHit(String seq) {
		boardDAO.updateHit(seq);
	}

}
