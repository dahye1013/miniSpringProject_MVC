package sungjuk.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.bean.BoardDTO;
import member.bean.MemberDTO;
import sungjuk.bean.SungjukDTO;
import sungjuk.service.SungjukService;

@Controller
public class SungjukController {
	@Autowired
	private SungjukService sungjukService;


	@RequestMapping(value="/sungjuk/input", method=RequestMethod.GET)
	public String input() {
		return "/sungJuk/input";
	}
	
	@RequestMapping(value = "/sungjuk/write", method=RequestMethod.POST)
	public @ResponseBody void write(@ModelAttribute SungjukDTO sungjukDTO) {
		System.out.println(sungjukDTO.getName());
		sungjukService.write(sungjukDTO);
	}
	
	@RequestMapping(value="/sungjuk/list", method=RequestMethod.GET)
	public String list() {
		return "/sungJuk/list";
	}
	
	 @RequestMapping(value = "/sungjuk/getList", method=RequestMethod.POST)
	 @ResponseBody 
	 public ModelAndView getList() {
		List<SungjukDTO> list = sungjukService.getList();
		System.out.println(list.get(0).getName());
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
}









