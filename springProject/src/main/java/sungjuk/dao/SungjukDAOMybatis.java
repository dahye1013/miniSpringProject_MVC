package sungjuk.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sungjuk.bean.SungjukDTO;

@Repository("sungjukDAO")
@Transactional
public class SungjukDAOMybatis implements SungjukDAO {
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public void write(SungjukDTO sungjukDTO) {
		sqlSession.insert("sungjukSQL.write",sungjukDTO);
	}


	@Override
	public List<SungjukDTO> getList() {
		return sqlSession.selectList("sungjukSQL.getList");
	}

}
