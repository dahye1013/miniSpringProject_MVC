package board.service;

import java.util.List;
import java.util.Map;

import board.bean.BoardDTO;
import board.bean.BoardPaging;

public interface BoardService {

	List<BoardDTO> boardList(Map<String, Integer> map);

	void boardWrite(Map<String, String> map);


	List<BoardDTO> searchList(Map<String, Object> map);

	public BoardPaging boardPaging(Map<String, Object> map);

	BoardPaging boardPaging(String pg);

	BoardDTO getBoard(String seq);

	void boardReply(Map<String, String> map);

	void boardModify(Map<String, Object> map);

	void boardDelete(String seq);

	void updateHit(String seq);

}
