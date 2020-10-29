package sungjuk.service;

import java.util.List;

import sungjuk.bean.SungjukDTO;

public interface SungjukService {

	void write(SungjukDTO sungjukDTO);

	List<SungjukDTO> getList();

}
