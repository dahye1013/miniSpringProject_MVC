package imageboard.service;

import java.util.List;

import imageboard.bean.ImageboardDTO;

public interface ImageboardService {

	public void imageboardWrite(ImageboardDTO imageboardDTO);

	public List<ImageboardDTO> getImageboardList(String pg);

	
}
