package board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import board.bean.BoardDTO;

@Repository("boardDAO")
@Transactional
public class BoardDAOMybatis implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BoardDTO> boardList(Map<String, Integer> map) {
		return sqlSession.selectList("boardSQL.boardList", map);
	}

	@Override
	public void boardWrite(Map<String, String> map) {
		sqlSession.insert("boardSQL.boardWrite", map);
	}

	@Override
	public int getBoardTotalA() {
		return sqlSession.selectOne("boardSQL.getBoardTotalA");
	}

	@Override
	public List<BoardDTO> searchList(Map<String, Object> map) {
		return sqlSession.selectList("boardSQL.searchList", map);
	}

	@Override
	public int getBoardSearchTotalA(Map<String, Object> map) {
		return sqlSession.selectOne("boardSQL.getBoardSearchTotalA",map);
	}

	@Override
	public BoardDTO getBoard(String seq) {
		return sqlSession.selectOne("boardSQL.getBoard", Integer.parseInt(seq));
	}

	@Override
	public void boardReply(Map<String, String> map) {
		sqlSession.insert("boardSQL.boardReply", map);

	}

	@Override
	public void boardModify(Map<String, Object> map) {
		sqlSession.update("boardSQL.boardModify" , map);
	}

	@Override
	public void boardDelete(String seq) {
		sqlSession.delete("boardSQL.boardDelete" , Integer.parseInt(seq));
	}

	@Override
	public void updateHit(String seq) {
		sqlSession.update("boardSQL.updateHit" , seq);
	}
	
	
	
	
	
}
