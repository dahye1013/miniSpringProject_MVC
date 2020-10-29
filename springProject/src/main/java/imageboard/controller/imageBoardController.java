package imageboard.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import imageboard.bean.ImageboardDTO;
import imageboard.service.ImageboardService;

@Controller
@RequestMapping(value = "imageboard")
public class imageBoardController {
	
	@Autowired
	private ImageboardService imageboardService;

	@RequestMapping(value = "imageboardWriteForm", method = RequestMethod.GET)
	public String boardList(Model model) {
		model.addAttribute("display", "/imageboard/imageboardWriteForm.jsp");
		return "/main/index";
	}

//	1.위치 (실제폴더) 이름도 변경
//	2. 실제 폴더에 있는 파일명을 가상 폴더로 복사
//	3. imageboardDTO image1에 값을 넣어주기

	//드래그해서 한번에 여러개의 파일을 선택할 경우
	@RequestMapping(value="imageboardWrite", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView imageboardWrite(@ModelAttribute ImageboardDTO imageboardDTO,
								@RequestParam("img[]") List<MultipartFile> list){
		String filePath = "D:\\spring\\workSTS\\springProject\\src\\main\\webapp\\storage";
		
		for(MultipartFile img : list) {
			String fileName = img.getOriginalFilename();
			File file = new File(filePath, fileName);
			
			//파일 복사
			try {
				FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			imageboardDTO.setImage1(fileName);
			imageboardDTO.setImage2("");

			//DB
			imageboardService.imageboardWrite(imageboardDTO);
		}//for
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/imageboard/imageboardWrite.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping(value="imageboardList", method=RequestMethod.GET)
	public String imageboardList(@RequestParam(required=false, defaultValue="1") String pg,
				Model model) {
		model.addAttribute("pg",pg);
		model.addAttribute("display","/imageboard/imageboardList.jsp");
		return "/main/index";
	}

	@RequestMapping(value="getImageboardList", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getImageboardList(@RequestParam String pg) {
		List<ImageboardDTO> list = imageboardService.getImageboardList(pg);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg",pg);
		mav.addObject("list",list);
		mav.setViewName("jsonView");
		return mav;
	}
	
}


	
/*	@RequestMapping(value = "imageboardWrite", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView imageboardWrite(@ModelAttribute ImageboardDTO imageboardDTO,
			@RequestParam MultipartFile[] img) { // 여기서
																												// 집어넣는다.
		String filePath = "D:\\spring\\workSTS\\springProject\\src\\main\\webapp\\storage";
		String fileName;
		File file;

		// 파일 복사 이미지1
		if (img[0] != null) {
			fileName = img[0].getOriginalFilename();
			file = new File(filePath, fileName);
			try { // img에 대한 정보를 inputStream으로 읽어와서 file에 넣어 저장시킨다.
				FileCopyUtils.copy(img[0].getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}
			imageboardDTO.setImage1(fileName);
		} else {
			imageboardDTO.setImage1("");
		}

		// 파일 복사 이미지2
		if (img[0] != null) {
			fileName = img[1].getOriginalFilename();
			file = new File(filePath, fileName);
			try {
				FileCopyUtils.copy(img[0].getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}
			imageboardDTO.setImage2(fileName);
		} else {
			imageboardDTO.setImage2("");
		}
		
		
		//DB
		imageboardService.imageboardWrite(imageboardDTO);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display","/imageboard/imageboardWrite.jsp");
		mav.setViewName("/main/index");
		return mav;
		}*/
	
	
	


// 파일이 1개일때
//	@RequestMapping(value = "imageboardWrite", method = RequestMethod.POST)
//	public void imageboardWrite(@ModelAttribute ImageboardDTO imageboardDTO,
//								@RequestParam MultipartFile img) { //여기서 임시파일로 받은것을 복사시켜서 가상 폴더에 집어넣는다.
//		String filePath = "D:\\spring\\workSTS\\springProject\\src\\main\\webapp\\storage";
//		String fileName = img.getOriginalFilename();
//		File file = new File(filePath, fileName);
//		
//		//파일 복사
//		try {				//img에 대한 정보를 inputStream으로 읽어와서  file에 넣어 저장시킨다.
//			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
//		}catch (IOException e) {
//			e.printStackTrace();
//		}
//		imageboardDTO.setImage1(fileName);
//	}
