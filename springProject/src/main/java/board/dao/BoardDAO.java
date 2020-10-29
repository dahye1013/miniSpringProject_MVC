package board.dao;

import java.util.List;
import java.util.Map;

import board.bean.BoardDTO;

public interface BoardDAO {

	List<BoardDTO> boardList(Map<String, Integer> map);

	void boardWrite(Map<String, String> map);


	List<BoardDTO> searchList(Map<String, Object> map);

	int getBoardTotalA();

	int getBoardSearchTotalA(Map<String, Object> map);

	BoardDTO getBoard(String seq);

	void boardReply(Map<String, String> map);

	void boardModify(Map<String, Object> map);

	void boardDelete(String seq);

	void updateHit(String seq);

}

