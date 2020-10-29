package sungjuk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.BoardDTO;
import sungjuk.bean.SungjukDTO;
import sungjuk.dao.SungjukDAO;

@Service
public class SungjukServiceImpl implements SungjukService {
	@Autowired
	private SungjukDAO sungjukDAO;

	@Override
	public void write(SungjukDTO sungjukDTO) {
		sungjukDTO.setTot(sungjukDTO.getEng()+sungjukDTO.getKor()+sungjukDTO.getMath());
		sungjukDTO.setAvg(sungjukDTO.getTot()/3);
		
		sungjukDAO.write(sungjukDTO);
	}

	@Override
	public List<SungjukDTO> getList() {
		List<SungjukDTO> list = sungjukDAO.getList();
		return list;
	}
}
