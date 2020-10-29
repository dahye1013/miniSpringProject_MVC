package sungjuk.dao;

import java.util.List;

import sungjuk.bean.SungjukDTO;

public interface SungjukDAO {

	void write(SungjukDTO sungjukDTO);

	List<SungjukDTO> getList();

}
