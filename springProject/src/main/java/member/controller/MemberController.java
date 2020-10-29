package member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;
import member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	@ResponseBody
	public String login(@RequestBody Map<String, String> map, HttpSession session, Model model) {
		String loginResult = null;
		MemberDTO memberDTO = memberService.loginMember(map);
		if (memberDTO != null) {
			loginResult = "sucess";
			session.setAttribute("memName", memberDTO.getName());
			session.setAttribute("memId", memberDTO.getId());
			session.setAttribute("memEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
			System.out.println("로그인 성공");
			model.addAttribute("display", "/template/loginOk.jsp");
		} else {
			loginResult = "fail";
			System.out.println("로그인 실패");
			model.addAttribute("display", "/template/loginFail.jsp");

		}
		return loginResult;
	}

	@RequestMapping(value = "/member/logout")
	public ModelAndView logout(HttpSession session, Model model) {
		session.invalidate();
		return new ModelAndView("redirect:/main/index");
	}

	@RequestMapping(value = "/member/writeForm",  method = RequestMethod.GET)
	public String writeForm(Model model) {
		model.addAttribute("display", "/member/writeForm.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value = "/member/modifyForm",  method = RequestMethod.GET)
	public String modifyForm(HttpSession session, Model model) {
		String id = (String) session.getAttribute("memId");
		MemberDTO memberDTO = memberService.getMember(id);
		model.addAttribute("memDTO", memberDTO);
		model.addAttribute("display", "/member/modifyForm.jsp");
		return "/main/index";
	}

	@RequestMapping(value = "/member/write")
	public String write(@ModelAttribute MemberDTO memberDTO, Model model) {
		memberService.write(memberDTO);
		model.addAttribute("display", "/member/write.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="/member/modify", method=RequestMethod.POST)
	public @ResponseBody void modify(@ModelAttribute MemberDTO memberDTO) {
		memberService.modify(memberDTO);
	}
	
	@RequestMapping(value = "/member/checkId", method = RequestMethod.POST)
	@ResponseBody
	public String checkId(@RequestParam String id) {
		System.out.println(id);
		return memberService.checkId(id);
	}

	@RequestMapping(value = "/member/checkPost", method = RequestMethod.GET)
	public String index(Model model) {
		return "/member/checkPost";
	}

	@RequestMapping(value="/member/zipcodeList",method= RequestMethod.POST)
	@ResponseBody
	public ModelAndView zipcodeList(@RequestParam Map<String, String> map) {
		System.out.println(map.get("roadname"));
		
		List<ZipcodeDTO> list = memberService.zipcodeList(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;

	}

//	@RequestMapping(value = "/member/logout")
//	public String logout(HttpSession session, Model model) {
//		session.invalidate();
//		model.addAttribute("display","/template/body.jsp");
//		return "/main/index";
//	}

}
